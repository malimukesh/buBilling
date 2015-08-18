<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class categoryModel extends Model{
    
    
   public function saveCategory($name){
       $name=trim($name);
       if($name == ""){  
           $retArr['success']=0;
           $retArr['message'] = "Catgory name shouldn't be emplty";
           return $retArr;
       }       
       $count=0;
       $retArr = array();
       $retArr['success'] = 0;
       $name = mysqli_escape_string($this->db, $name);
       $sql = "select count(*) from category where categoryName='$name'";
       
       $result=$this->db->query($sql);
       $res = $result->fetch_array(MYSQLI_NUM);
       $count = $res[0];
       
       $this->db->query("BEGIN");      
       if($count==0){
           $sql = "insert into category (categoryId,categoryName) values ('null',?)";
           $stmt = $this->db->prepare($sql);
           $stmt->bind_param('s',$name);
           $stmt->execute() or trigger_error($sql);
           $retArr['success']=1;
           $retArr['message'] = "Catgory $name Added Successfully";
           $stmt->close();
       }else{
           $retArr['success']=0;
           $retArr['message'] = "Catgory $name already present ";
       }
		$this->db->query("commmit");
      return $retArr;
   }
    public function getAttributes(){        
        
        $dataArr = array();        
        $sql = "describe category"; 
        $result = mysqli_query($this->db, $sql) or trigger_error("Error in $sql");
        $res = $result->fetch_array(MYSQLI_NUM);
        while($res = $result->fetch_array(MYSQLI_NUM)){
            array_push($dataArr,$res[0]);          
        }
        return $dataArr;            
    }
    public function getAll(){
        $dataArr = array();
        
        $sql = "select categoryName from category";
        $result = $this->db->query($sql);
        while($res = $result->fetch_array(MYSQLI_NUM)){
            array_push($dataArr, $res[0]);
        }
        return $dataArr;
    }
    public function getAllProcuctByCategoty(){
        $dataArr = array();
        $dataArr['headRow']=array("ProductId","Product Price On Date","Category","Product Name","Product Description","Product Vendor","Price");
        /*
        $sql = "SELECT  pd.productId,ct.categoryName,pd.productName,pd.description,
                    pd.productVendor,pp.priceOnDate,pp.productPrice 
                FROM productDetail pd,productPrice  pp,productCategory pc,category ct
                where pd.productId=pd.productId and pd.productId=pc.productID and pc.categoryId=ct.categoryId; ";         
         */
        $sql =  "SELECT pd.productId,pp.priceOnDate,ct.categoryName,pd.productName as name,
                        pd.description as description,pd.productVendor as vendor,pp.productPrice as price  
                FROM productDetail pd
                JOIN productPrice pp 
                ON pd.productId=pp.productId 
                LEFT JOIN productCategory pc 
                ON pd.productId=pc.productId
                LEFT JOIN category as ct 
                ON pc.categoryId=ct.categoryId
                where pd.showProduct='1'";
        $result = $this->db->query($sql)  or trigger_error("Error in $sql ");
        while($res = $result->fetch_array(MYSQLI_NUM)){
            if(!isset($dataArr[$res['2']])) {
                $dataArr[$res['2']]= array();                               
            }
            array_push($dataArr[$res['2']],$res);            
        }
        return $dataArr;
    }
}