<?php
error_reporting(E_ALL);
set_error_handler("my_error_handler");
ini_set('display_errors','1');
define('HOME',dirname(__FILE__));
define('DS',DIRECTORY_SEPARATOR);

include_once 'config.php';
include_once 'utility'.DS.'route.php';

function __autoload($className){
    if(file_exists(HOME.DS.'controller'.DS.strtolower($className).'.php')){
        include_once HOME.DS.'controller'.DS.strtolower($className).'.php';
    }else if(file_exists(HOME.DS.'model'.DS.strtolower($className).'.php')){
        include_once HOME.DS.'model'.DS.strtolower($className).'.php';
    }else if(file_exists(HOME.DS.'view'.DS.strtolower($className).'.php')){
        include_once HOME.DS.'view'.DS.strtolower($className).'.php';
    }else if(file_exists(HOME.DS.'utility'.DS.strtolower($className).'.php')){
        include_once HOME.DS.'utility'.DS.strtolower($className).'.php';
    }
}
function my_error_handler($errno, $errstr, $errfile, $errline){
    
   $file = fopen("log/errorlog.txt","a+") or die("Unable to Open file");
   $date = date('d-M-y');
   $time = date("h:i:sa");
   $string = "[$date $time] [Error#: $errno] [Error Message: $errstr] [File: $errfile] [ Line#: $errline] \n";
   fwrite($file,$string);
   fclose($file);
   http_response_code(500);
}
?>
