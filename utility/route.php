<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$model = "index";
$action = "index";
$query = "";
if(isset($_GET['url'])){
    $path = explode('/', $_GET['url']);
    $model = $path[0];
    if(isset($path[1]) && !empty($path[1])){
        $action = $path[1];
    }
    if(isset($path[2]) && !empty($path[2])){
        $query = $path[2];
    }
}
if(!((strcmp($model,"auth")==0 ||(strcmp($model,"index"))==0) && (strcmp($action,"index")==0))){
    if((!isset($_COOKIE['login'])) &&(((int)$_COOKIE['login']))!=1 ){
        header('Location: http://busimplified.com/buBilling/');       
    }
}
$controller = $model;
$controller.='controller';
$load = new $controller($model,$action);

if(method_exists($load, $action)){
    $load->$action($query);
}else{
    http_response_code(404);
    print "Page Not Found";
}