<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class reportModel extends Model{
        
    public function defaultReport(){
        $retArr = array();
        $sql = "select count(billId) from billing where date(billDate) = date(NOW())";        
        $result=$this->db->query($sql) or trigger_error("Error in $sql ");
        $res = $result->fetch_array(MYSQLI_NUM);
        array_push($retArr,array("Total Today's Bill" => $res[0]));
        
        $sql = "select count(productId) from billingInfo where billId in (select billId from billing where date(billDate) = date(NOW()))";
        $result=$this->db->query($sql) or trigger_error("Error in $sql ");
        $res = $result->fetch_array(MYSQLI_NUM);
        array_push($retArr,array("Total Product Sold Today" => $res[0]));
        
        $sql = "select count(billId) from billing where billDate between date_sub(now(),INTERVAL 1 WEEK) and now()";
        $result=$this->db->query($sql) or trigger_error("Error in $sql ");
        $res = $result->fetch_array(MYSQLI_NUM);
        array_push($retArr,array("Total Bill in Last 7days" => $res[0]));
        
        $sql = "select count(productId) from billingInfo where billId in (select billId from billing where billDate between date_sub(now(),INTERVAL 1 WEEK) and now())";
        $result=$this->db->query($sql) or trigger_error("Error in $sql ");
        $res = $result->fetch_array(MYSQLI_NUM);
        array_push($retArr,array("Total Product Sold in Last 7days" => $res[0]));
        
        return $retArr;
    }
    public function allBills(){
        $retArr = array(array("Bill Id","Bill Date","Customer Name","Customer Contact#","Bill Price"));
        $sql = "select * from billing";
        $result = $this->db->query($sql) or trigger_error("Error in $sql");
        while($res = $result->fetch_array(MYSQLI_NUM)){
             array_push($retArr,array($res[0],$res[1],$res[3],$res[4],$res[6]));
        }
        return $retArr;
        
    }  
    public function weeklyBills(){
        $retArr = array(array("Bill Id","Bill Date","Customer Name","Customer Contact#","Bill Price"));
        $sql = "select * from billing where WEEKOFYEAR(billDate)=WEEKOFYEAR(NOW())";
        $result = $this->db->query($sql) or trigger_error("Error in $sql");
        while($res = $result->fetch_array(MYSQLI_NUM)){
             array_push($retArr,array($res[0],$res[1],$res[3],$res[4],$res[6]));
        }
        return $retArr;
        
    }    
    public function dailyBills(){
        $retArr = array(array("Bill Id","Bill Date","Customer Name","Customer Contact#","Bill Price"));
        $sql = "select * from billing where date(billDate)=date(NOW())";
        $result = $this->db->query($sql) or trigger_error("Error in $sql");
        while($res = $result->fetch_array(MYSQLI_NUM)){
             array_push($retArr,array($res[0],$res[1],$res[3],$res[4],$res[6]));
        }
        return $retArr;
    }
    public function monthlyBills(){
        $retArr = array(array("Bill Id","Bill Date","Customer Name","Customer Contact#","Bill Price"));
        //$sql = "select * from billing where billDate between date_sub(now(),INTERVAL 1 MONTH) and now()";
        $sql = "select * from billing where (MONTH(billDate)=MONTH(NOW())) AND (YEAR(billDate)=YEAR(NOW()))";
        $result = $this->db->query($sql) or trigger_error("Error in $sql");
        while($res = $result->fetch_array(MYSQLI_NUM)){
             array_push($retArr,array($res[0],$res[1],$res[3],$res[4],$res[6]));
        }
        return $retArr;
        
    }
    public function getWeekStartEndDate(){
        $retArr = array();
        $sql = "select adddate(curdate(), INTERVAL -WEEKDAY(curdate()) DAY) WeekStart;";
        $result = $this->db->query($sql)or trigger_error("Error in $sql");
        $res = $result->fetch_array(MYSQLI_NUM);
        array_push($retArr,$res[0]);
        $sql = "select adddate(curdate(), INTERVAL 1-DAYOFWEEK(curdate()) DAY) WeekEnd";
        $result = $this->db->query($sql)or trigger_error("Error in $sql");
        $res = $result->fetch_array(MYSQLI_NUM);
        array_push($retArr,$res[0]);
        
        return $retArr;
    }
}