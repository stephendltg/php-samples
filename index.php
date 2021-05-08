<?php

//phpinfo();

var_dump("testset");

require_once __DIR__.'/../vendor/autoload.php';

$app = new Silex\Application();


$app->get('/', function (){
    return "hello";
});

$app->get('/hello/{name}', function ($name) use ($app) {
  return 'Hello '.$app->escape($name);
});

$app->run();