<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class productController extends Controller{
    
    public function __construct($model, $action) {
        parent::__construct($model, $action);
        $this->setModel($model);        
    }
    public function add(){
        $dataArr =array();
        $dataArr=$this->model->getAttributes();
        $catArr = $this->model->getCategories();
        $this->model->db->close();
        $this->setView("add");
        $this->view->set('title',"Add Product");
        $this->view->set('heading',"Add below data to insert product into database");
        $this->view->set('body',"");
        $this->view->set('attributes',$dataArr);
        $this->view->set('categories',$catArr);
        $this->view->output();
    }
    public function delete($pid){
        $pid = (int)$pid;
        $retArr=$this->model->delProduct($pid);
        print json_encode($retArr);
    }
    public function index(){
        $dataArr = array();
       // $dataArr = $this->model->listAll();
        $this->setView("list");
        
    }
    public function save(){
        $dataArr = array();
        $return = $this->model->checkProduct($_POST);
        if($return == 1){
            $dataArr=$this->model->saveAttributes($_POST);
            print json_encode($dataArr);
        }else{
            $dataArr['success']=0;
            print json_encode($dataArr);
        }        
    }
    public function showAll(){
        $dataArr = array();
        $dataArr = $this->model->getAll();
        print json_encode($dataArr);
    }
    public function show(){
        $dataArr = array();
        $dataArr = $this->model->getAll();
        $this->setView("show");
        $this->view->set("title","Show Products");
        $this->view->set("pdata",$dataArr);
        $this->view->output();
    }
    public function remove(){
        $dataArr = array();
        $dataArr = $this->model->getAll();
        $this->setView("remove");
        $this->view->set("title","Show Products");
        $this->view->set("pdata",$dataArr);
        $this->view->output();
    }
}
