<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Db{
    public static $db;
    public static function init() {
        if(!self::$db){
            self::$db = mysqli_connect(DB_HOST,DB_USER,DB_PASS,DB_NAME) or die(mysqli_error(self::$db));                                
        }
        return self::$db;
    }
}