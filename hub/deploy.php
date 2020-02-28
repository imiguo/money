<?php
require '../common/function.php';

session_start();
if (!validate()) {
    header('HTTP/1.1 403 Forbidden');
    echo "Invalid request.";
    exit;
}
$_SESSION['validated'] = true;

$commands = [
    'echo $PWD',
    'git reset --hard HEAD',
    'git pull',
    'git status',
];
$site = '';
if (isset($_GET['env'])) {
    $site = $_GET['env'];
}
if ($site == 'midollar') {
    chdir('/var/www/hm_prod');
} elseif($site == 'new') {
    chdir('/var/www/hm_new');
} elseif($site == 'larahm') {
    chdir('/var/www/larahm');
} elseif($site == 'larahm_test') {
    chdir('/var/www/larahm_test');
} elseif($site == 'template') {
    chdir('/var/www/lara-templates');
} elseif($site == 'tawenxi') {
    chdir('/var/www/tawenxi_guzzler');
} else {
    chdir('/var/www/hm_test');
}

if (! empty($_POST['commands'])) {
    $timeStr = 'time: '.date('Y-m-d H:i:s');
    $ipStr = 'ip: '.$_SERVER['REMOTE_ADDR'];
    $dirStr = 'dir: '.getcwd();
    $extraCommands = explode("\r\n", $_POST['commands']);
    $str = '------'.PHP_EOL.$timeStr.PHP_EOL.$ipStr.PHP_EOL.$dirStr.PHP_EOL;
    foreach ($extraCommands as $value) {
        $str .= '> '.$value.PHP_EOL;
    }
    $str .= '------'.PHP_EOL;
    file_put_contents('/var/www/deploy/extraCommands.log', $str, FILE_APPEND);

    // preg_split('/\r\n|[\r\n]/', $_POST['commands'])
    $commands = array_merge($commands, $extraCommands);
}

$output = '';
foreach($commands AS $command){
    $command = trim($command);
    if (!$command) continue;
    $tmp = shell_exec($command . ' 2>&1');
    $output .= "<span style=\"color: #6BE234;\">\$</span> <span style=\"color: #729FCF;\">{$command}\n</span>";
    $output .= htmlentities(trim($tmp)) . "\n";
}
?>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <title>GIT DEPLOYMENT SCRIPT</title>
    <style>
        .tip a{
            font-size: 15px;
            color: #f80054;
            text-decoration: none;
            display: inline-block;
            margin-bottom: 10px;
        }
    </style>
</head>
<body style="background-color: #000000; color: #FFFFFF; font-weight: bold; padding: 0 10px;">
<pre>
 .  ____  .    ____________________________
 |/      \|   |                            |
[| <span style="color: #FF0000;">&hearts;    &hearts;</span> |]  | Git Deployment Script v0.1 |
 |___==___|  /                &copy;entimm 2017 |
              |____________________________|

<?php echo $output; ?>

<div class="tip">
-----------------
<a href="/?env=tawenxi">deploy tawenxi</a>
<a href="/?env=new">deploy new</a>
<a href="/?env=midollar">deploy midollar</a>
<a href="/?env=larahm">deploy larahm</a>
<a href="/?env=larahm_test">deploy larahm_test</a>
<a href="/?env=template">deploy templates</a>
<a href="/?env">deploy test</a>
-----------------
</div>
</pre>

<form method="POST">
    <textarea name="commands" rows="5" cols="40" required><?=isset($_POST['commands']) ? $_POST['commands'] : ''?></textarea>
    <br>
    <input type="submit" value="excute">
</form>
</body>
</html>