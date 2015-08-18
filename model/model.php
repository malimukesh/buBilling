<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Model{
    public  $db;
    protected  $sql;
    
    public function  __construct(){
        if(!$this->db){
            $this->db = Db::init();
        }
        return $this->db;
    }
    public function setSql($sql){
        $sql = mysqli_escape_string($this->db, $sql);
        $this->sql = $sql;
    }
}