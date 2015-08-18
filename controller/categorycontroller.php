<?php

class categoryController extends Controller{

    public function __construct($model, $action) {
        parent::__construct($model, $action);
        $this->setModel($model);
    }
    public function save(){        
        $name = $_POST['categoryName'];
        $dataArr = array();
        $dataArr=$this->model->saveCategory($name);        
        print json_encode($dataArr);
        
    }
    public function add(){
        $dataArr =array();
        $dataArr=$this->model->getAttributes();
        $this->model->db->close();
        $this->setView("add");
        $this->view->set('title',"Add Cateogry");
        $this->view->set('heading',"Add below data to insert product into database");
        $this->view->set('body',"");
        $this->view->set('attributes',$dataArr);
        $this->view->output();         
 
    }
    public function show(){
        $dataArr = array();
        $dataArr = $this->model->getAll();
        $productByCatgory=$this->model->getAllProcuctByCategoty(); 
        $this->model->db->close();
        $this->setView("show");
        $this->view->set("title","Show Category");
        $this->view->set("cdata",$dataArr);
        $this->view->set("productbycategory",$productByCatgory);
        $this->view->output();
    }
    public function showAll(){
        $dataArr = array();
        $dataArr = $this->model->getAll();
        $this->model->db->close();
        print json_encode($dataArr);
    }
}