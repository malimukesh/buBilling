<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class salesController extends Controller{
    
    public function __construct($model, $action) {
        parent::__construct($model, $action);
        $this->setModel($model);
    }
    public function apiweekly(){
        $week = $this->model->getApiWeek();
        print json_encode($week);
    }
    public function apimonthly(){
        $month = $this->model->getApiMonth();
        print json_encode($month);
    }
    public function apitoday(){
        $today = $this->model->getApiToday();
        print json_encode($today);
    }
    public function apiall(){
        $all = $this->model->getApiAll();
        print json_encode($all);
    }
    public function index(){   
     $all = $this->model->getAll();
     $today = $this->model->getToday();
     $week = $this->model->getWeek();
     $month = $this->model->getMonth();
     $retArr=$this->model->getWeekStartEndDate();
     //$monthly = $this->model->getLatestMonthly();
     $this->model->db->close();
     $this->setView("index");
     $this->view->set("title","Total Sales");
     //$this->view->set("monthly",$retArr);
     $this->view->set("today",date('d-M-Y'));
     $this->view->set("todaysales",$today);
     $this->view->set("weeksales",$week);
     $this->view->set("monthsales",$month);
     $this->view->set("allsales",$all);
     $this->view->set("weekstartdate",$retArr[0]);
     $this->view->set("weekenddate",$retArr[1]);
     $this->view->output();
    }
}