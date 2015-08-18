<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class indexController extends Controller{
    
    public function __construct($model, $action) {
        parent::__construct($model, $action);
        $this->setModel($model);
    }
    public function index(){
        $dataArr = array();
        $dataArr = $this->model->getIndexData(); 
        $this->model->db->close();
        if(isset($_COOKIE['login']) && ($_COOKIE['login']==1)){
            $this->setView("home");
        }
        else{   
            $this->setView("index");
        }
        $this->view->set('title',$dataArr['title']);
        $this->view->set('heading',$dataArr['heading']);
        $this->view->set('body',$dataArr['body']);
        $this->view->output();
    }
    public function home(){
        $dataArr = array();
        $dataArr = $this->model->getIndexData(); 
        $this->model->db->close();
        $this->setView("home");
        $this->view->set('title',$dataArr['title']);
        $this->view->set('heading',$dataArr['heading']);
        $this->view->set('body',$dataArr['body']);
        $this->view->output();
    }
}