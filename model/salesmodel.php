<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class salesModel extends Model{
    
    public function getAll(){
        $retArr = array(array("Category","Product Id","Product Name","Total Sale Price","Total Sale Quantity"));
        $sql="SELECT ct.categoryName,bI.productId,pd.productName,sum(bI.productQuantity*bI.productPrice),sum(bI.productQuantity) from billingInfo bI 
        LEFT JOIN productDetail pd  ON bI.productId=pd.productId  
        LEFT JOIN productCategory pc ON bI.productId=pc.productId and pc.productId=pd.productId
        LEFT JOIN category ct ON ct.categoryId = pc.categoryId
        group by bI.productId";
        
        $result = $this->db->query($sql) or trigger_error("Error in $sql");
        
        while($ret = $result->fetch_array(MYSQLI_NUM)){
            array_push($retArr,array($ret[0],$ret[1],$ret[2],$ret[3],$ret[4]));
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
    public function getToday(){
        $retArr = array(array("Category","Product Id","Product Name","Total Sale Price","Total Sale Quantity"));
        $sql="
        SELECT ct.categoryName,bI.productId,pd.productName,sum(bI.productQuantity*bI.productPrice),sum(bI.productQuantity) from billing bL
        LEFT JOIN billingInfo bI ON bI.billId = bL.billId
        LEFT JOIN productDetail pd  ON bI.productId=pd.productId  
        LEFT JOIN productCategory pc ON bI.productId=pc.productId and pc.productId=pd.productId
        LEFT JOIN category ct ON ct.categoryId = pc.categoryId
        where date(bL.billDate)=date(NOW())
        group by bI.productId  order by ct.categoryName asc";
        $result = $this->db->query($sql) or trigger_error("Error in $sql");
        
        while($ret = $result->fetch_array(MYSQLI_NUM)){
            array_push($retArr,array($ret[0],$ret[1],$ret[2],$ret[3],$ret[4]));
        }
        return $retArr;      
        
    }
        
    public function getApiAll(){
        $retArr = array();
        $sql="SELECT ct.categoryName,sum(bI.productQuantity) from billingInfo bI 
        LEFT JOIN productDetail pd  ON bI.productId=pd.productId  
        LEFT JOIN productCategory pc ON bI.productId=pc.productId and pc.productId=pd.productId
        LEFT JOIN category ct ON ct.categoryId = pc.categoryId
        group by ct.categoryName  order by ct.categoryName asc";
        
        $result = $this->db->query($sql) or trigger_error("Error in $sql");
        
        while($ret = $result->fetch_array(MYSQLI_NUM)){
            array_push($retArr,array($ret[0],$ret[1]));
        }
        return $retArr;        
    }
    public function getApiToday(){
        $retArr = array();
        $sql="
        SELECT ct.categoryName,sum(bI.productQuantity) from billing bL
        LEFT JOIN billingInfo bI ON bI.billId = bL.billId
        LEFT JOIN productDetail pd  ON bI.productId=pd.productId  
        LEFT JOIN productCategory pc ON bI.productId=pc.productId and pc.productId=pd.productId
        LEFT JOIN category ct ON ct.categoryId = pc.categoryId
        where date(bL.billDate)=date(NOW())
        group by ct.categoryName  order by ct.categoryName asc";
        $result = $this->db->query($sql) or trigger_error("Error in $sql");
        
        while($ret = $result->fetch_array(MYSQLI_NUM)){
            array_push($retArr,array($ret[0],$ret[1]));
        }
        return $retArr;      
        
    }
    public function getApiMonth(){
        $retArr = array();
        $sql="
        SELECT ct.categoryName,sum(bI.productQuantity) from billing bL
        LEFT JOIN billingInfo bI ON bI.billId = bL.billId
        LEFT JOIN productDetail pd  ON bI.productId=pd.productId  
        LEFT JOIN productCategory pc ON bI.productId=pc.productId 
        LEFT JOIN category ct ON ct.categoryId = pc.categoryId
        where MONTH(bL.billDate)=MONTH(NOW()) AND YEAR(bL.billDate)=YEAR(NOW())
        group by ct.categoryName  order by ct.categoryName asc";
        $result = $this->db->query($sql) or trigger_error("Error in $sql");
        
        while($ret = $result->fetch_array(MYSQLI_NUM)){
            array_push($retArr,array($ret[0],$ret[1]));
        }
        return $retArr;      
    }
    public function getApiWeek(){
        $retArr =array();
        $sql="
        SELECT ct.categoryName,sum(bI.productQuantity) from billing bL
        LEFT JOIN billingInfo bI ON bI.billId = bL.billId
        LEFT JOIN productDetail pd  ON bI.productId=pd.productId  
        LEFT JOIN productCategory pc ON bI.productId=pc.productId and pc.productId=pd.productId
        LEFT JOIN category ct ON ct.categoryId = pc.categoryId
        where WEEKOFYEAR(bL.billDate)=WEEKOFYEAR(NOW())
        group by ct.categoryName  order by ct.categoryName asc";
        $result = $this->db->query($sql) or trigger_error("Error in [ $sql ]".  mysqli_errno($this->db));
        
        while($ret = $result->fetch_array(MYSQLI_NUM)){
            array_push($retArr,array($ret[0],$ret[1]));
        }
        return $retArr;      
    }    
    public function getWeek(){
        $retArr = array(array("Category","Product Id","Product Name","Total Sale Price","Total Sale Quantity"));
        $sql="
        SELECT ct.categoryName,bI.productId,pd.productName,sum(bI.productQuantity*bI.productPrice),sum(bI.productQuantity) from billing bL
        LEFT JOIN billingInfo bI ON bI.billId = bL.billId
        LEFT JOIN productDetail pd  ON bI.productId=pd.productId  
        LEFT JOIN productCategory pc ON bI.productId=pc.productId and pc.productId=pd.productId
        LEFT JOIN category ct ON ct.categoryId = pc.categoryId
        where WEEKOFYEAR(bL.billDate)=WEEKOFYEAR(NOW())
        group by bI.productId  order by ct.categoryName asc";
        $result = $this->db->query($sql) or trigger_error("Error in $sql");
        
        while($ret = $result->fetch_array(MYSQLI_NUM)){
            array_push($retArr,array($ret[0],$ret[1],$ret[2],$ret[3],$ret[4]));
        }
        return $retArr;      
    }    
    public function getMonth(){
        $retArr = array(array("Category","Product Id","Product Name","Total Sale Price","Total Sale Quantity"));
        $sql="
        SELECT ct.categoryName,bI.productId,pd.productName,sum(bI.productQuantity*bI.productPrice),sum(bI.productQuantity) from billing bL
        LEFT JOIN billingInfo bI ON bI.billId = bL.billId
        LEFT JOIN productDetail pd  ON bI.productId=pd.productId  
        LEFT JOIN productCategory pc ON bI.productId=pc.productId 
        LEFT JOIN category ct ON ct.categoryId = pc.categoryId
        where MONTH(bL.billDate)=MONTH(NOW()) AND YEAR(bL.billDate)=YEAR(NOW())
        group by bI.productId  order by ct.categoryName asc";
        $result = $this->db->query($sql) or trigger_error("Error in $sql");
        
        while($ret = $result->fetch_array(MYSQLI_NUM)){
            array_push($retArr,array($ret[0],$ret[1],$ret[2],$ret[3],$ret[4]));
        }
        return $retArr;      
    }
    
}