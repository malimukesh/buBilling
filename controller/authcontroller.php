<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class authController extends Controller{
    
    public function __construct($model, $action) {
        parent::__construct($model, $action);
        $this->setModel($model);
    }
    public function index(){
        $retArr = array("success"=>0);
        $return = $this->model->authenticate($_POST['uname'],$_POST['pwd']);
        if($return == TRUE){
           header("Location: http://busimplified.com/buBilling/index/home");
        }else{
           header("Location: http://busimplified.com/buBilling/index/");
        }
    }
    public function logout(){
        setcookie('login','0',time()-3600,'/');
        unset($_COOKIE['login']);
        $this->setView("logout");
        $this->view->output();
    }
    public function chpwd(){
        $this->setView('chpwd');
        $this->view->output();
    }
    public function changepwd(){
        
        $username = $_COOKIE['username'];
        $oldpwd = trim($_POST['oldpwd']);
        $newpwd = trim($_POST['newpwd']);
        $cnfnewpwd = trim($_POST['cnfnewpwd']);
        $retArr = array();
        if(strcmp($newpwd,$oldpwd)==0){
            $retArr = array("Success"=>0,"Message"=>"Old and new password Shouldn't be same");            
        }else{        
            $retArr = $this->model->changePassword($username,$oldpwd,$newpwd);                           
        }
        $this->setView('changed');
        $this->view->set("Success",$retArr['Success']);
        $this->view->set("Message",$retArr['Message']);
        $this->view->output();
    }  
}