<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class reportController extends Controller{
    
    public function __construct($model, $action) {
        parent::__construct($model, $action);
        $this->setModel($model);
    }
    
    public function index(){
        $retArr = array();
        $retArr1 = array();
        $retArr = $this->model->defaultReport();
        $todayreport = $this->model->dailyBills();
        $weeklyreport = $this->model->weeklyBills();
        $monthlyreport = $this->model->monthlyBills();
        $allreport = $this->model->allBills();
        $retArr1=$this->model->getWeekStartEndDate();
        $this->model->db->close();
        $this->setView("index");
        $this->view->set("title","Default Report");
        $this->view->set("report",$retArr);
        $this->view->set("today",date('d-M-y'));
        $this->view->set("todayreport",$todayreport);
        $this->view->set("weekreport",$weeklyreport);
        $this->view->set("monthreport",$monthlyreport);
        $this->view->set("allreport",$allreport);
        $this->view->set("weekstartdate",$retArr1[0]);
        $this->view->set("weekenddate",$retArr1[1]);
        
        $this->view->output();
    }
    public function weekly(){
        $retArr = array();
        $retArr = $this->model->weeklyBills();
        $this->model->db->close();
        $this->setView("weekly");
        $this->view->set("title","weekly Bills");
        $this->view->set("startdate","1");
        $this->view->set("enddate","7");
        $this->view->set("billData",$retArr);
        $this->view->output();
    }
    public function daily(){
        $retArr = array();
        $retArr = $this->model->dailyBills();
        $this->model->db->close();
        $this->setView("daily");
        $this->view->set("title","Daily Bills");
        $this->view->set("billData",$retArr);
        $this->view->output();
    }
    public function monthly(){
        $retArr = array();
        $retArr = $this->model->monthlyBills();
        $this->model->db->close();
        $this->setView("weekly");
        $this->view->set("title","weekly Bills");
        $this->view->set("startdate","1");
        $this->view->set("enddate","7");
        $this->view->set("billData",$retArr);
        $this->view->output();
    }
    
}