<?php




require_once __DIR__.'/vendor/autoload.php';


/**
 * ENV
 */
use Symfony\Component\Dotenv\Dotenv;

$dotenv = new Dotenv();
$dotenv->load(__DIR__.'/.env');

var_dump($_ENV);

/**
 * ROUTES
 */

$app = new Silex\Application();

var_dump("rerer");


$app->get('/', function (){
    return "hello";
});

$app->get('/test', function (){
    return "test";
});

$app->get('/hello/{name}', function ($name) use ($app) {
  return 'Hello '.$app->escape($name);
});

$app->run();