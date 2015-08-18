<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class View{
    protected $dataArr = array();
    protected $file ;
    public function __construct($file) {
        $this->file=$file;
        $this->dataArr = array();
    }
    public function set($key,$value){
        $this->dataArr[$key]=$value;
    }
    public function get($key){
        return $this->dataArr[$key];
    }
    public function output(){
        if(!file_exists($this->file)){
            throw new Exception("Template file $this->file doesn't exist");
        }
        $link ="";
        extract($this->dataArr);        
        ob_start();
        include($this->file);
        $contents = ob_get_contents();
        ob_end_clean();
        echo $contents;
    }
}