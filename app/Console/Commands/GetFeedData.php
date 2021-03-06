<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Feed;
use App\FeedData;

class GetFeedData extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'getfeeddata';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'フィード情報を取得する';

    //スクレイピング情報
    //どのキーにどのスクレイピング先のhead->metaタグのname属性を割り当てるか
    //フィードID => (こちらの記事情報キー => スクレイピング先head->meta要素name)
    private $scraping = array(
        1 => array(),
        2 => array(
            'description' => 'og:description',
            'author' => 'cXenseParse:author',
            'image_url' => 'og:image',
        ),
        3 => array(
           'description' => 'og:description',
           'author' => 'cXenseParse:author',
           'image_url' => 'og:image',
        ),
        5 => array(),
    );

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        //Feedテーブル、FeedDataテーブルのインスタンス生成
        $feed_ins = new Feed;
        $feed_data_ins = new FeedData;

        info("start");

        //重複起動チェック
        $fp = fopen(__FILE__, 'rb');
        if (!flock($fp, LOCK_EX | LOCK_NB)) {
            Error('フィード収集バッチ起動中のため終了します');
            exit;
        }
        //フィード設定読み込み
        $feeds = $feed_ins->getFeederData();
        //確認ログ出力
        info("feeds=".print_r($feeds,true));

        //フィード情報取得
        foreach($feeds as $feed ){
            $feed_url = $feed['feed_url'];
            //フィードデータをパース
            try {
                $xml = simplexml_load_file($feed_url);
            } catch (Exception $e) {
                //このフィードサイトはスキップ
                Error($e->getMessage());
                continue;
            }

            //フィード形式判定して処理
            if ($xml->entry) {
                info("type=Atom");
                $this->readAtom1($feed['id'], $xml);
            } else if ($xml->item) {
                info("type=RSS1.0");
                $this->readRss1($feed['id'], $xml);
            } else if ($xml->channel->item) {
                info("type=RSS2.0");
                $this->readRss2($feed['id'], $xml);
            } else {
                //XMLとしては読めたけどフィードデータじゃない
                Error("type=unkonwn");
                //このフィードサイトはスキップ
                continue;
            }

        }
        Info('End');
    }

    /**
     * Atom1.0形式を読み取って保存する
     * 
     * @param Int $feedId フィードID
     * @param Object $xml feed要素のSimpleXMLObject
     * @return なし
     */
    private function readAtom1($feedId, $xml) {
        //ドキュメントに定義されている名前空間取得
        $xmlns = $xml->getDocNamespaces();
        Info("xmlns=" . print_r($xmlns, true));

        //フィード情報を取得
        $feedVal = array(
            'title' => (string)$xml->title,
            'link' => (string)$xml->link['href'],
            'description' => (string)$xml->subtitle,
            'author' => (string)$xml->author->name,
            'pubdate' => date('Y/m/d H:i:s', strtotime($xml->updated)),
        );
        Info("feedVal=" . print_r($feedVal, true));

        //記事情報を取得して保存
                foreach ($xml->entry as $entry) {
            $itemVal1 = array(
                'title' => (string)$entry->title,
                'link' => (string)$entry->link['href'],
                'description' => (string)$entry->summary,
                'author' => (string)$entry->author->name,
                'pub_date' => date('Y-m-d H:i:s', strtotime($entry->published)),
                //'pub_date' => date('0000/00/00 00:00:00'),
                'original_date' => date('Y-m-d H:i:s', strtotime($entry->published))
            );
            if ($feedId == 4) {
                $mediaGroup = $entry->children($xmlns['media'])->group;
                $itemVal1['description'] = mb_substr(str_replace("\n", '', (string)$mediaGroup->description), 0, 160);
                $itemVal1['image_url'] = (string)$mediaGroup->thumbnail->attributes()->{'url'};
                $itemVal1['movie_url'] = (string)$mediaGroup->content->attributes()->{'url'};
            }
            //スクレイピング
            $itemVal = $this->webScraping($feedId, $itemVal1);
            Info("itemVal=" . print_r($itemVal, true));
            //保存
            $this->saveItem($feedId, $itemVal);
        }
    }
    /**
     * RSS1.0形式を読み取って保存する
     * 
     * @param Int $feedId フィードID
     * @param Object $xml rdf要素のSimpleXMLObject
     * @return なし
     */
    private function readRss1($feedId, $xml) {
        //ドキュメントに定義されている名前空間取得
        $xmlns = $xml->getDocNamespaces();
        Info("xmlns=" . print_r($xmlns, true));

        //フィード情報を取得
        $feedVal = array(
            'title' => (string)$xml->channel->title,
            'link' => (string)$xml->channel->link,
            'description' => (string)$xml->channel->description,
            'author' => '',
            'pubdate' => '',
        );
        info("feedVal=" . print_r($feedVal, true));
        //記事情報を取得して保存
        foreach ($xml->item as $item) {
            $itemVal1 = array(
                'title' => (string)$item->title,
                'link' => (string)$item->link,
                'description' => (string)$item->description,
                'author' => (string)$item->children($xmlns['dc'])->creator,
                'pub_date' => date('Y-m-d H:i:s', strtotime($item->children($xmlns['dc'])->date)),
//                'pub_date' => date('0000-00-00 00:00:00'),
                'original_date' => date('Y-m-d H:i:s', strtotime($item->children($xmlns['dc'])->date))
            );
            //スクレイピング
            $itemVal = $this->webScraping($feedId, $itemVal1);
            Info("itemVal=" . print_r($itemVal, true));
            $this->saveItem($feedId, $itemVal);
        }
    }

    
    /**
     * RSS2.0形式を読み取って保存する
     * 
     * @param Int $feedId フィードID
     * @param Object $xml rss要素のSimpleXMLObject
     * @return なし
     */
    private function readRss2($feedId, $xml) {
        //ドキュメントに定義されている名前空間取得
        $xmlns = $xml->getDocNamespaces();
        Info("xmlns=" . print_r($xmlns, true));

        $feedVal = array(
            'title' => (string)$xml->channel->title,
            'link' => (string)$xml->channel->link,
            'description' => (string)$xml->channel->description,
            'author' => (string)$xml->channel->managingEditor,
            'pubdate' => date('Y/m/d H:i:s', strtotime($xml->channel->lastBuildDate)),
        );
        Info("feedVal=" . print_r($feedVal, true));

        foreach ($xml->channel->item as $item) {
            $itemVal1 = array(
                'title' => (string)$item->title,
                'link' => (string)$item->link,
                'description' => (string)$item->description,
                'author' => (string)$item->author,
                'pub_date' => date('Y/m/d H:i:s', strtotime($item->pubDate)),
                //'pub_date' => date('0000/00/00 00:00:00'),
                'original_date' => date('Y/m/d H:i:s', strtotime($item->pubDate))
            );
            //TODO別タグ付け替え処理（多くなければこれで）
            if ($feedId == 2) {
                $content1 = (string)$item->children($xmlns['content'])->encoded;
                $youtubeUrls = preg_match('/[\'|\"](https:\/\/www\.youtube\.com\/.+?)[\'|\"]/', $content1, $matches);
                if (count($matches) > 1) {
                    $itemVal1['movie_url'] = $matches[1];
                }
                $imageUrls = preg_match('/<img.*?\ssrc\s*=\s*[\'|\"](http.+?)[\'|\"]/', $content1, $matches);
                if (count($matches) > 1) {
                    $itemVal1['image_url'] = $matches[1];
                }
                $content2 = str_replace(array('&nbsp;', "\n"), '',  strip_tags($content1));
                $itemVal1['description'] = mb_substr($content2, 0, 160);
                $itemVal1['author'] = (string)$item->children($xmlns['dc'])->creator;
            }
            //スクレイピング
            $itemVal = $this->webScraping($feedId, $itemVal1);
            Info("itemVal=" . print_r($itemVal, true));
            $this->saveItem($feedId, $itemVal);

        }
    }

    /**
     * ウェブスクレイピング
     * 
     * @param Int $feedId フィードID
     * @param Array $itemVal 
     * @return Array 記事情報の連想配列
     */
    private function webScraping($feedId, $itemVal){
        if (isset($this->scraping[$feedId]) === false) {
            return $itemVal;
        }
        if (($feedId == 1 || $feedId == 5) & isset($itemVal['image_url'])) {
            return $itemVal; 
        }
        Info("webscraping=" . $itemVal['link']);
        //記事URLのHTMLを読み込み
        $dom = new \DOMDocument();
        $dom->formatOutput = true;
        libxml_use_internal_errors(true);
//        $url = mb_convert_encoding(file_get_contents($itemVal['link']),'utf-8','euc-jp');
        $url = file_get_contents($itemVal['link']);
        $dom->loadHTML($url);
        libxml_clear_errors();
        $html = simplexml_load_string($dom->saveXML());
        $tmp = $itemVal;
        //ヘッダのmeta要素より指定のデータをセットする
        foreach ($html->head->meta as $meta) {
            foreach ($this->scraping[$feedId] as $itemkey => $metakey) {
                if ((string)$meta['name'] === $metakey || (string)$meta['property'] === $metakey) {
                    $tmp[$itemkey] = (string)$meta['content'];
                }
            }
        }
        //ボディからimgタグのsrcがjpg画像の最初のものを抜き出す
        if ($feedId == 1 || $feedId == 3) {
            foreach ($html->body->xpath('//img') as $img) {
                $src = (string)$img['src'];
                if (preg_match('/^\s*http.+\.jpg\s*$/i', $src) === 1) {
                    $tmp['image_url'] = trim($src);
                    Info('image_url='. $src);
                    break;
                }
            }
        }
        return $tmp;
    }

    /**
     * 記事情報保存
     * 
     * @param Int $feedId フィードID
     * @param Array $itemVal 記事情報
     */
    private function saveItem($feedId, $itemVal) {

        //記事URLが登録されているか確認
        //URLは仕様的に長くてindex貼れないのでCRC32ハッシュ列に貼って絞る
        $linkHash = crc32($itemVal['link']);
        $fddt = FeedData::where('link_hash',$linkHash)->where('link',$itemVal['link'])->get();
        //記事情報保存
        $itemVal['feed_id'] = $feedId;
        $itemVal['link_hash'] = $linkHash;
        //記事データが存在する時は更新させる
        if (count($fddt) > 0) {
            $itemVal['pub_date'] = $fddt[0]->pub_date;
            $itemVal['status'] = $fddt[0]->status;
            $itemVal['id'] = $fddt[0]->id;
            FeedData::where(
                [
                    'feed_id' => $itemVal['feed_id'],
                    'category_id' => 1,
                    'title' => $itemVal['title'],
                    'link' => $itemVal['link'],
                    'link_hash' => $linkHash,
                    'description' => strip_tags($itemVal['description']),
                    'author' => $itemVal['author'],
                    'pub_date' => $itemVal['pub_date'],
                    'original_date' => $itemVal['original_date'],
                    'status' => $itemVal['status'],
                    'image_url' => $itemVal['image_url'],
                    'movie_url' => isset($itemVal['movie_url']) ? $itemVal['movie_url'] : null,
                ])->update(['id' => $itemVal['id']]
            );
 
        }else{
            FeedData::insert(
                [
                    'feed_id' => $itemVal['feed_id'],
                    'category_id' => 1,
                    'title' => $itemVal['title'],
                    'link' => $itemVal['link'],
                    'link_hash' => $linkHash,
                    'description' => strip_tags($itemVal['description']),
                    'author' => $itemVal['author'],
                    'pub_date' => $itemVal['pub_date'],
                    'original_date' => $itemVal['original_date'],
                    'image_url' => $itemVal['image_url'],
                    'movie_url' => isset($itemVal['movie_url']) ? $itemVal['movie_url'] : null,
                ]
            );
        }
    }

}
