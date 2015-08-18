<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class productModel extends Model {
    
    public function getAttributes(){        
        
        $dataArr = array();        
        $sql = "describe productDetail"; 
        $result = mysqli_query($this->db, $sql) or trigger_error("Error in $sql");
        $res = $result->fetch_array(MYSQLI_NUM);
        while($res = $result->fetch_array(MYSQLI_NUM)){
            array_push($dataArr,$res[0]);          
        }
        return $dataArr;
    
        
    }
    public function getCategories(){
        $catArr = array();        
        $sql = "select categoryId,categoryName from category";
        $result=$this->db->query($sql) or trigger_error("Error in $sql");
        while($res = $result->fetch_array(MYSQLI_ASSOC)){
            array_push($catArr,array("value"=>$res['categoryId'],"text"=>$res['categoryName']));
        }        
        return $catArr;
    }
    public function delProduct($pid){
        $retArr = array();
        $sql = "update productDetail set showProduct='0' where productId='$pid'";
        $this->db->query($sql) or trigger_error("Error in $sql".  mysqli_error($this->db));
        $retArr['success']=1;
        $retArr['message']=" $pid hidden successfully";
        return $retArr;
    }
    public function getAll(){
        $dataArr = array();
        array_push($dataArr,array("ProductId","Product Price On Date","Category","Product Name","Product Description","Product Vendor","Price"));
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
            array_push($dataArr, $res);
        }
        return $dataArr;
    }
    public function checkProduct(array $data){
        $productData = $data['product'];
        $id;
        if(isset($productData['productName'])){
            $productName = trim($productData['productName']);
            if($productName == "") return 0;
            $productName = mysqli_escape_string($this->db, $productName);
            $sql = "select count(productId) from productDetail where productName='".$productName."' and showProduct='1'";
            $result = $this->db->query($sql) or trigger_error("Error in $sql ");            
            $res = $result->fetch_array(MYSQLI_NUM);
            $id = $res[0];            
            if($id ==0 ){
                return 1;
            }else{
                return 0;
            }
        }else{
            return 0;
        }
        
        
    }
    public function saveAttributes(array $data){
        
        $dataArr = array();
        $productData = $data['product'];
        $catgoryId = (int)$data['category'];
        $price = (float)$data['price'];
        $this->db->query("BEGIN");
        $keys = array_keys($productData);
        $str = implode(", ", $keys);
        $sql = "insert into productDetail (productId,$str) values ('null',";
        $str = "";
        foreach($keys as $key ){
            $str.= '\''.mysqli_escape_string($this->db,$productData[$key]).'\',';
        }
        $str=rtrim($str,"'");
        $str=rtrim($str,",");
        $sql.=$str.")";        
        mysqli_query($this->db, $sql) or trigger_error("Error in $sql".mysqli_error($this->db));
        
        $productId = mysqli_insert_id($this->db);
        $productId = (int) $productId;
        
        $sql = "insert into productCategory (productId,categoryId) values ('".$productId."','".$catgoryId."')";
        $this->db->query($sql) or trigger_error("Error in $sql ".  mysqli_error($this->db));
        
        $sql = "insert into productPrice (priceOnDate,productId,productPrice) values (NOW(),'".$productId."','".$price."')";
        $this->db->query($sql) or trigger_error("Error in $sql ".mysqli_error($this->db));
        
        $this->db->query("COMMIT");
        $dataArr['success']=1;
        return $dataArr;
    }
}