<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class billingController extends Controller{
    
    public function __construct($model, $action) {
        parent::__construct($model, $action);
        $this->setModel($model);
    }
    public function index(){
        $customerInput = array();
        $customerInput = $this->model->getCustomerInputDetail();
        $productDetails = $this->model->getProductInputDetail();
        $this->model->db->close();
        $this->setView("index");
        $this->view->set('title',"Title");
        $this->view->set('heading',"Heading");
        $this->view->set('body',"Body");
        $this->view->set('customerInputs',$customerInput);
        $this->view->set('productDetails',$productDetails);        
        $this->view->output();
    }
    public function show($id){
        $customerdetail = array();
        $billdetail = array();
        $customerdetail=$this->model->getCustomerDetail($id);
        $billdetail = $this->model->getBillingDetail($id);
        $total = $this->model->getTotal($id);
        $this->model->db->close();
        $this->setView("show");
        $this->view->set('title',"BillId $id");
        $this->view->set('heading',"Billing Heading");
        $this->view->set('body',"");
        $this->view->set("cust",$customerdetail);
        $this->view->set("bill",$billdetail);
        $this->view->set("total",$total);
        
        $this->view->output();
    }
    public function save(){
        $custDetail = $_POST['cust'];
        $prdDetail = $_POST['prd'];       
        $retArr = array();           
        $retArr=$this->model->saveBillDetail($custDetail,$prdDetail);
        if($retArr['success']==0){
            $this->model->db->query("ROLLBACK");
        }
        $this->model->db->close();
        print json_encode($retArr);        
    }    
}