<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class docController extends Controller{
    
    public function __construct($model, $action) {
        parent::__construct($model, $action);
        $this->setModel($model);
    }
    public function index(){
        $this->setView("index");
        $this->view->output();
    }
    
}