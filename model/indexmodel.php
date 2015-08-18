<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class indexModel extends Model{
    public function __construct() {
        parent::__construct();
    }
    public function getIndexData(){
        $arr = array();
        $arr['title']= "Index Title";
        $arr['heading'] = "Index Heading";
        $arr['body'] = "Index HTML Body";
        return $arr;
    }
}