<?php
function validate()
{
    $token = '1a10c89f';
    $client_id = 'entimm';
    if (!empty($_SESSION['validated'])) {
        return true;
    }
    if (isset($_GET['token']) && $token == $_GET['token']) {
        return true;
    }
    if(!isset($_SERVER['HTTP_SOCKETLOG']))
    {
        return false;
    }
    $args = [];
    if(!preg_match('/SocketLog\((.*?)\)/', $_SERVER['HTTP_SOCKETLOG'], $match))
    {
        return false;
    }

    parse_str($match[1], $args);
    if(isset($args['client_id']) && $client_id == $args['client_id'])
    {
        return true;
    }
    return false;
}