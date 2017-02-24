<html>
  <head>
  </head>
  <body>
    <tbody>
    <?php  foreach($members as $member): ?>
        <tr>
            <td><?php echo $member->id ?></td>
            <td><?php echo $member->description ?></td>
        </tr>
    <?php endforeach; ?>
    </tbody>
