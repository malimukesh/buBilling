<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Controller{
    
    protected $controller;
    protected $model;
    protected $action;
    protected $baseModel;
    protected $view;
    
    public function __construct($model,$action){       
        $this->controller = ucwords(__CLASS__);
        $this->baseModel = trim(strtolower($model));
        $this->action = $action;
        $this->view = new View(HOME.DS.'view'.DS.strtolower($this->baseModel).DS.$action.'.tpl');        
    }
    public function setModel($model){
        $model.='model';
        $this->model = new $model();
    }
    public function setView($viewName){
        $viewName = trim($viewName);
        $this->view = new View(HOME.DS.'view'.DS.strtolower($this->baseModel).DS.$viewName.'.tpl');        
    }   
}