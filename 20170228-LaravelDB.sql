-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: Laravel
-- ------------------------------------------------------
-- Server version	5.7.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `feed_data`
--

DROP TABLE IF EXISTS `feed_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'IDENTIFIED  AUTO_INCREMENT',
  `feed_id` bigint(20) NOT NULL COMMENT 'フィードID',
  `category_id` bigint(20) NOT NULL COMMENT 'カテゴリID',
  `title` varchar(1024) NOT NULL COMMENT 'タイトル',
  `link` varchar(2083) NOT NULL COMMENT 'リンク',
  `link_hash` int(10) unsigned NOT NULL COMMENT 'リンクハッシュリンクのCRC32値',
  `description` varchar(1024) DEFAULT NULL COMMENT '要約',
  `author` varchar(255) DEFAULT NULL COMMENT '著者',
  `pub_date` datetime NOT NULL COMMENT '発行日時',
  `original_date` datetime NOT NULL COMMENT 'オリジナル記事日時',
  `image_url` varchar(2083) DEFAULT NULL COMMENT '画像URL',
  `movie_url` varchar(2083) DEFAULT NULL COMMENT '動画URL',
  `status` tinyint(4) DEFAULT '0' COMMENT 'ステータス',
  `insert_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
  `update_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時 ON UPDATE CURRENT_TIMESTAMP',
  PRIMARY KEY (`id`),
  KEY `feed_data_IX1` (`link_hash`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='フィードデータフィードデータのIDはCREAM記事のIDとユニークにするため100万1からとする。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed_data`
--

LOCK TABLES `feed_data` WRITE;
/*!40000 ALTER TABLE `feed_data` DISABLE KEYS */;
INSERT INTO `feed_data` VALUES (1,1,1,'【鉢音ちゃんねる】最近のハチ高原はキッカー天国！素敵な空の旅をお楽しみください。','http://www.heavysnowker.com/archives/52016095.html',2204708977,'\n\nハチ・ハチ北スキー場の非公認キャラ（？）の鉢音ミクの「鉢音ちゃんねる♫」より、『最近のハチ高原はキッカー天国！素敵な空の旅をお楽しみください。』が公開！\n','heavysnowker','2017-02-27 00:17:24','2017-02-27 00:17:24','http://resize.blogsys.jp/dc1c5fd910f53386e724c93b2779a4330e518f41/crop1/60x60/http://livedoor.blogimg.jp/heavysnowker/imgs/7/b/7be1cb7b-s.jpg',NULL,0,'2017-02-28 06:58:59','2017-02-28 06:58:59'),(2,1,1,'スキー場での事故死、過去15年間で200人以上！原因の2位は転倒、1位は？','http://www.heavysnowker.com/archives/52016093.html',1429263212,'\n※画像はイメージ\n\nスキー場で事故死、１５年間で２００人以上\n\n全国のスキー場で２００１年度から１５年度までに、スキーやスノーボードなどの事故による死者が少なくとも２０８人に上ったことが分かった。','heavysnowker','2017-02-27 00:09:01','2017-02-27 00:09:01','http://livedoor.blogimg.jp/heavysnowker/imgs/f/2/f2159660-s.jpg',NULL,0,'2017-02-28 06:58:59','2017-02-28 06:58:59'),(3,1,1,'子出藤歩夢と今井胡桃が銅メダル！＝冬季アジア大会　男女スノーボード・ハーフパイプ結果','http://www.heavysnowker.com/archives/52016025.html',2171495563,'\n銅メダルを獲得した今井胡桃（写真左）、冨田せな（中央）、松本遥奈（右）\n\n札幌で行われている冬季アジア大会は25日、さっぽろばんけいスキー場で男女スノーボードのハーフパイプが行われ、男子では子出藤歩夢が86.75ptで、女子では今井胡桃が73.00ptで、それぞれ銅メダル...','heavysnowker','2017-02-25 20:48:52','2017-02-25 20:48:52','http://livedoor.blogimg.jp/heavysnowker/imgs/f/4/f4425fa3.jpg',NULL,0,'2017-02-28 06:58:59','2017-02-28 06:58:59'),(4,1,1,'【雪崩】ニセコで350メートルの大雪崩　外国人2人死傷　立ち入り禁止区域でスノボー','http://www.heavysnowker.com/archives/52016018.html',202927560,'\n\n北海道倶知安町のニセコアンヌプリ岳で2月25日午前、スノーボードをしていたニュージーランド人の男性が、雪崩に巻き込まれ、死亡しました。\n','heavysnowker','2017-02-25 20:01:52','2017-02-25 20:01:52','http://resize.blogsys.jp/dc1c5fd910f53386e724c93b2779a4330e518f41/crop1/60x60/http://livedoor.blogimg.jp/heavysnowker/imgs/7/b/7be1cb7b-s.jpg',NULL,0,'2017-02-28 06:58:59','2017-02-28 06:58:59'),(5,1,1,'2017 Burton US Open 参加ライダーが決定！ショーン・ホワイト、平野歩夢、平岡卓、角野友基、鬼塚雅、藤森由香らが参戦！','http://www.heavysnowker.com/archives/52015898.html',3583968479,'\n\n2月27日(月)から始まるスノーボードイベント、THE 2017 BURTON US OPEN SNOWBOARDING CHAMPIONSHIPS（以下、US OPEN）に出場するライダーが決まりました。\n','heavysnowker','2017-02-23 23:23:33','2017-02-23 23:23:33','http://livedoor.blogimg.jp/heavysnowker/imgs/2/d/2d10f2fe-s.jpg',NULL,0,'2017-02-28 06:58:59','2017-02-28 06:58:59'),(6,1,1,'【竜王シルブプレ4-20】谷口尊人、リッキー、むしずが木落し流し！竜王での楽しい流し方','http://www.heavysnowker.com/archives/52015896.html',4019545519,'\n\nお馴染みP-can Factoryのムービーシリーズ「竜王シルブプレ」のシーズン４-20『[木落し流し]竜王で楽しい流し方』が公開！\n','heavysnowker','2017-02-23 23:03:57','2017-02-23 23:03:57','http://resize.blogsys.jp/dc1c5fd910f53386e724c93b2779a4330e518f41/crop1/60x60/http://livedoor.blogimg.jp/heavysnowker/imgs/7/b/7be1cb7b-s.jpg',NULL,0,'2017-02-28 06:59:00','2017-02-28 06:59:00'),(7,1,1,'【WOW】ブッチとZIZOも集結してのWOWリク セッション！WOW8.08「ブッチとWOWリク」','http://www.heavysnowker.com/archives/52015895.html',1761679105,'\n\n大人気のスノーボード エンタメ ウェブ ムービー シリーズ「WOW（ワオ）」のシーズン8-8となる『ブッチとWOWリク』が公開！\n','heavysnowker','2017-02-23 22:53:48','2017-02-23 22:53:48','http://resize.blogsys.jp/dc1c5fd910f53386e724c93b2779a4330e518f41/crop1/60x60/http://livedoor.blogimg.jp/heavysnowker/imgs/7/b/7be1cb7b-s.jpg',NULL,0,'2017-02-28 06:59:00','2017-02-28 06:59:00'),(8,1,1,'岡本圭司が監修したスキー場情報アプリ「yukiyama」、全国一斉ユーザ参加型イベントを開催！豪華プレゼントも','http://www.heavysnowker.com/archives/52015848.html',3024643359,'\n\nスキー場情報アプリで全国一斉ユーザ参加型イベント「yukiyama ぴたかん」\n滑走記録が一番近い人に豪華賞品をプレゼント、フォトコンテストも同時開催\n\n株式会社神戸デジタル・ラボが、サイドウェイ株式会社（代表取締役社長：岡本圭司）と共同開発した一般消費者向けの無...','heavysnowker','2017-02-23 00:02:45','2017-02-23 00:02:45','http://livedoor.blogimg.jp/heavysnowker/imgs/7/a/7a18707b.jpg',NULL,0,'2017-02-28 06:59:00','2017-02-28 06:59:00'),(9,1,1,'2017 FIS スノーボード世界選手権大会　日本代表選手発表！','http://www.heavysnowker.com/archives/52015768.html',4210517658,'\n竹内智香/Tomoka Takeuchi (JPN) 写真：YUTAKA/アフロスポーツ\n\n全日本スキー連盟は、来月、3月9日～17日にスペイン・シェラネバダで開催される「スノーボード世界選手権大会」の代表選手を発表した。2年前のオーストリア大会で史上最年少での優勝を果たし、一躍脚光を浴び...','heavysnowker','2017-02-22 23:48:14','2017-02-22 23:48:14','http://livedoor.blogimg.jp/heavysnowker/imgs/f/c/fc171976-s.jpg',NULL,0,'2017-02-28 06:59:00','2017-02-28 06:59:00'),(10,1,1,'【GOGO TV】高橋烈男＠川場スキー場 桜川エクスプレス トップtoボトム ムービー！','http://www.heavysnowker.com/archives/52015767.html',195155023,'\n\n高橋烈男のGOGO TVより、群馬県・川場スキー場での自身の近況ライディングムービーが公開！','heavysnowker','2017-02-22 00:03:46','2017-02-22 00:03:46','http://resize.blogsys.jp/dc1c5fd910f53386e724c93b2779a4330e518f41/crop1/60x60/http://livedoor.blogimg.jp/heavysnowker/imgs/7/b/7be1cb7b-s.jpg',NULL,0,'2017-02-28 06:59:00','2017-02-28 06:59:00'),(11,1,1,'ベアマウンテン公式ムービーシリーズ「SUNDAY IN THE PARK 2017」エピソード7公開！','http://www.heavysnowker.com/archives/52015766.html',3237808106,'\n\nベアマウンテン リゾートの公式ウェブ ムービー シリーズ「SUNDAY IN THE PARK 2017」のエピソード7が公開！\n','heavysnowker','2017-02-21 23:52:48','2017-02-21 23:52:48','http://resize.blogsys.jp/dc1c5fd910f53386e724c93b2779a4330e518f41/crop1/60x60/http://livedoor.blogimg.jp/heavysnowker/imgs/7/b/7be1cb7b-s.jpg',NULL,0,'2017-02-28 06:59:00','2017-02-28 06:59:00'),(12,1,1,'【DRAGON TV】尾瀬戸倉最新パーク映像！DAYLINE 216.','http://www.heavysnowker.com/archives/52015648.html',2713876269,'\n\n人気YouTubeチャンネル「DRAGON TV」より、群馬県・スノーパーク尾瀬戸倉の最新パーク映像「DAYLINE 216.」が公開！登場ライダー達が華麗に流すパークライディングは必見！\n','heavysnowker','2017-02-20 00:47:38','2017-02-20 00:47:38','http://resize.blogsys.jp/dc1c5fd910f53386e724c93b2779a4330e518f41/crop1/60x60/http://livedoor.blogimg.jp/heavysnowker/imgs/7/b/7be1cb7b-s.jpg',NULL,0,'2017-02-28 06:59:00','2017-02-28 06:59:00'),(13,1,1,'スノーボード日本最強決定戦「COWDAY」が今年も開催決定！一般エントリー受付開始！','http://www.heavysnowker.com/archives/52015646.html',2613581405,'\n\n今年もスノーボード日本最強決定戦「COWDAY」 が白馬47 にて3 月24 日・25 日に開催決定！！！！\n','heavysnowker','2017-02-20 00:34:11','2017-02-20 00:34:11','http://livedoor.blogimg.jp/heavysnowker/imgs/4/7/4737500b-s.jpg',NULL,0,'2017-02-28 06:59:00','2017-02-28 06:59:00'),(14,1,1,'【成田兄弟】成田緑夢、障害者スノーボードクロス全国大会２連覇！「僕はヒーローになりたいんです」','http://www.heavysnowker.com/archives/52015645.html',492594419,'\n全国障がい者スノーボード選手権大会（下肢障害その他クラス）で優勝した成田緑夢（ぐりむ）選手\n\n成田緑夢、スノボクロス連覇「ヒーローになりたい」\n\n＜スノーボード：全国障がい者選手権大会＞◇１９日◇長野・白馬乗鞍温泉スキー場◇男子スノーボードクロス（下肢障害な...','heavysnowker','2017-02-20 00:21:12','2017-02-20 00:21:12','http://livedoor.blogimg.jp/heavysnowker/imgs/5/f/5f87aea4.jpg',NULL,0,'2017-02-28 06:59:00','2017-02-28 06:59:00'),(15,1,1,'【WOW】疲れのピークでドギーが弱音！？WOW8.07「ガンバレドギー」','http://www.heavysnowker.com/archives/52015383.html',1145431038,'\n\n大人気のスノーボード エンタメ ウェブ ムービー シリーズ「WOW（ワオ）」のシーズン8-7となる『ガンバレドギー』が公開！\n','heavysnowker','2017-02-18 00:09:04','2017-02-18 00:09:04','http://resize.blogsys.jp/dc1c5fd910f53386e724c93b2779a4330e518f41/crop1/60x60/http://livedoor.blogimg.jp/heavysnowker/imgs/7/b/7be1cb7b-s.jpg',NULL,0,'2017-02-28 06:59:00','2017-02-28 06:59:00'),(16,1,1,'【スキー場情報】モンスターパイプオープン！新潟県・石打丸山スキー場 2017年02月17日【虫くんch】','http://www.heavysnowker.com/archives/52015381.html',160252661,'\n\nYouTubeチャンネル「虫くんch」より、モンスターパイプがオープンしたことでも話題となっている新潟県・上越国際スキー場の2月17日のリアル レポート ムービーが公開！\n','heavysnowker','2017-02-17 23:54:09','2017-02-17 23:54:09','http://resize.blogsys.jp/dc1c5fd910f53386e724c93b2779a4330e518f41/crop1/60x60/http://livedoor.blogimg.jp/heavysnowker/imgs/7/b/7be1cb7b-s.jpg',NULL,0,'2017-02-28 06:59:00','2017-02-28 06:59:00'),(17,1,1,'【竜王シルブプレ4-19】谷口尊人が教えるスピンその前に！ストレートエアーからナナーメエアー【ハウツー】','http://www.heavysnowker.com/archives/52015305.html',2717077124,'\n\nお馴染みP-can Factoryのムービーシリーズ「竜王シルブプレ」のシーズン４-19『[スピンする前に]ストレートエアーからナナーメエアー 谷口尊人ハウツー』が公開！\n','heavysnowker','2017-02-16 23:40:05','2017-02-16 23:40:05','http://resize.blogsys.jp/dc1c5fd910f53386e724c93b2779a4330e518f41/crop1/60x60/http://livedoor.blogimg.jp/heavysnowker/imgs/7/b/7be1cb7b-s.jpg',NULL,0,'2017-02-28 06:59:00','2017-02-28 06:59:00'),(18,1,1,'【スキー場情報】新潟県・上越国際スキー場 パーク＆パイプ 2017年02月16日【虫くんch】','http://www.heavysnowker.com/archives/52015304.html',1789893921,'\n\nYouTubeチャンネル「虫くんch」より、2月16日の新潟県・上越国際スキー場のリアル レポート ムービーが公開！\n','heavysnowker','2017-02-16 23:29:10','2017-02-16 23:29:10','http://resize.blogsys.jp/dc1c5fd910f53386e724c93b2779a4330e518f41/crop1/60x60/http://livedoor.blogimg.jp/heavysnowker/imgs/7/b/7be1cb7b-s.jpg',NULL,0,'2017-02-28 06:59:01','2017-02-28 06:59:01'),(19,1,1,'岐阜県・白弓スキー場でバックカントリースキーをしていて行方不明となっていた会社員の遺体見つかる','http://www.heavysnowker.com/archives/52015303.html',2007674265,'\n\n岐阜県白川村のスキー場に出かけたまま行方がわからなくなっていた３６歳の会社員が近くの谷で遺体で見つかり、警察は、スキー場の外の整備されていない斜面を滑るバックカントリースキーをしていて、誤って雪のくぼみに落ちたと見て調べています。','heavysnowker','2017-02-16 23:20:14','2017-02-16 23:20:14','http://resize.blogsys.jp/dc1c5fd910f53386e724c93b2779a4330e518f41/crop1/60x60/http://livedoor.blogimg.jp/heavysnowker/imgs/7/b/7be1cb7b-s.jpg',NULL,0,'2017-02-28 06:59:01','2017-02-28 06:59:01'),(20,1,1,'【グラトリ】グラトリの大会「Guratori DAYS 3rd」 決勝ムービー公開！','http://www.heavysnowker.com/archives/52015244.html',1380628908,'\n\n2017年2月5日、福島県・アルツ磐梯スキー場にて行われたグラトリの大会「Guratori DAYS 3rd」の男子決勝ムービーが公開！\n','heavysnowker','2017-02-16 00:46:21','2017-02-16 00:46:21','http://resize.blogsys.jp/dc1c5fd910f53386e724c93b2779a4330e518f41/crop1/60x60/http://livedoor.blogimg.jp/heavysnowker/imgs/7/b/7be1cb7b-s.jpg',NULL,0,'2017-02-28 06:59:01','2017-02-28 06:59:01');
/*!40000 ALTER TABLE `feed_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feeds`
--

DROP TABLE IF EXISTS `feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feeds` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'IDENTIFIED  AUTO_INCREMENT',
  `feed_name` varchar(1024) NOT NULL COMMENT 'サイト名',
  `feed_url` varchar(2083) NOT NULL COMMENT 'URL',
  `site_url` varchar(2083) DEFAULT NULL COMMENT 'サイトURL',
  `twitter_url` varchar(2083) DEFAULT NULL COMMENT 'Twitter',
  `facebook_url` varchar(2083) DEFAULT NULL COMMENT 'Facebook',
  `video_url` varchar(2083) DEFAULT NULL COMMENT '動画サイト',
  `icon_image_url` varchar(2083) DEFAULT NULL COMMENT 'アイコン画像URL',
  `feed_text` varchar(1024) DEFAULT NULL COMMENT 'テキスト',
  `status` tinyint(4) DEFAULT '0' COMMENT 'ステータス 0=収集,9=削除',
  `insert_id` varchar(255) NOT NULL COMMENT '登録者',
  `insert_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日時',
  `update_id` varchar(255) NOT NULL COMMENT '更新者',
  `update_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時 ON UPDATE CURRENT_TIMESTAMP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='フィード';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feeds`
--

LOCK TABLES `feeds` WRITE;
/*!40000 ALTER TABLE `feeds` DISABLE KEYS */;
INSERT INTO `feeds` VALUES (1,'heavysnow','http://www.heavysnowker.com/index.rdf','http://www.heavysnowker.com/','https://twitter.com/_heavysnowker_','https://www.facebook.com/heavysnowker',NULL,'http://pbs.twimg.com/profile_images/538645519594053632/e0zMncp3_bigger.png','スノーボード | スノボーの最新ニュース - heavysnowker（ヘビースノーカー) ',0,'admin','2017-02-27 07:34:58','admin','2017-02-27 07:34:58');
/*!40000 ALTER TABLE `feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2017_02_24_151802_create_sample_table',2),(4,'2017_02_24_151802_create_test_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sample`
--

DROP TABLE IF EXISTS `sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sample`
--

LOCK TABLES `sample` WRITE;
/*!40000 ALTER TABLE `sample` DISABLE KEYS */;
/*!40000 ALTER TABLE `sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'test',NULL,NULL),(2,'test2',NULL,NULL),(3,'test3',NULL,NULL),(4,'test4',NULL,NULL);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-28 16:29:29
