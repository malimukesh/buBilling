<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class billingModel extends Model{
    public function getCustomerInputDetail(){
        return array("Customer Name","Customer Contact","Customer Address");        
    }
    public function getProductInputDetail(){
        return array("Name","Price","Quantity","Total");
    }
    public function getCustomerDetail($id){
        $retArr = array();
        $id = (int)$id;
        $sql = "select * from billing where billId='".$id."'";
        $result = $this->db->query($sql) or trigger_error("Error in $sql");
        if($result->num_rows == 1){
            $res = $result->fetch_array(MYSQLI_ASSOC);
            $retArr = array ("billNumber" => $res['billId'],"billDate"=>$res['billDate'],
                             "billerName" => $res['billerName'],
                            "customerName"=>$res['customerName'],
                            "customerContact"=>$res['customerContact'],
                            "customerAddress"=>$res['customerAddress']);
        }
        return $retArr;
    }
    public function getBillingDetail($id){
        $retArr = array();
        $id = (int)$id;
        $sql ="select * from billingInfo where billId='".$id."'";
        $result = $this->db->query($sql) or trigger_error("Error in $sql ");
        while($res = $result->fetch_array(MYSQLI_ASSOC)){
            array_push($retArr, array("Product Name"=>$this->getProductName($res['productId']),"Unit Price"=>$res['productPrice'],"Quantity"=>$res['productQuantity'],"Total"=>($res['productPrice']*$res['productQuantity'])));
        }
        return $retArr;
    }
    private function getProductName($id){
        $id = (int) $id;
        $sql = "select productName from productDetail where productId='$id'";
        $result = $this->db->query($sql) or trigger_error("Error in $sql");
        $res = $result->fetch_array(MYSQLI_NUM);
        return $res[0];
    }
    public function saveCustDetail(array $custDetail){
        $retArr = array("success"=>"0","id"=>-1);        
        $biller = $_COOKIE['username'];
        $name = $custDetail['Customer_Name'];
        $name = trim($name);
        if($name =="") return $retArr;
        $contact= $custDetail['Customer_Contact'];
        $address = $custDetail['Customer_Address'];        
        $sql = "insert into  billing (billId,billDate,billerName,customerName,customerContact,customerAddress,billAmount) "
                . "values('null',NOW(),?,?,?,?,'-1')";
        $stmt = $this->db->prepare($sql) or trigger_error(mysqli_error($this->db));
        $stmt->bind_param('ssss',$biller,$name,$contact,$address);
        $stmt->execute();
        $id = mysqli_insert_id($this->db);
        $id = (int) $id;
        $retArr['success']=1;
        $retArr['id']=$id;
        return $retArr;                  
    }
    public function saveBillDetail(array $custDetail,array $prdDetail){
        $this->db->query("START TRANSACTION");
        $retArr = array("success"=>0,"id"=>-1);
        $retArr = $this->saveCustDetail($custDetail);
        if(!($retArr['success']==1 && $retArr['id']!=-1)){
            $retArr['success']==0;
            return $retArr;
        }
        $id = $retArr['id'];
        $billId = (int)$id;         
        $pidArr = $prdDetail['pid'];
        $priceArr = $prdDetail['Price'];
        $qtyArr = $prdDetail['Quantity'];
        $count = 0;
        $retArr['success']=0;
        foreach ($pidArr as $pid){
            $pid = (int)$pid;
            if($pid<=0) return $retArr;
            $price = $this->getPrice($pid);
            $quantity = (int)$qtyArr[$count];
            $sql = "insert into billingInfo (billId,productId,productPrice,productQuantity) values(?,?,?,?)";
            $stmt = $this->db->prepare($sql);
            $stmt->bind_param('iidi',$billId,$pid,$price,$quantity);
            $stmt->execute();    
            $count++;
        }        
        $this->saveTotal($id);
        $retArr = array("success"=>1,"id"=>$id);
        $this->db->query("COMMIT");
        return $retArr;
    }
    public function getPrice($pid){
        $pid = (int) $pid;
        $price = (float) 0;
        $sql = "select productPrice from productPrice where productId=?";
        $stmt = $this->db->prepare($sql) or trigger_error("Error in $sql");
        $stmt->bind_param("i",$pid);
        $stmt->execute() or trigger_error(mysqli_error($this->db));
        $stmt->bind_result($price);
        $stmt->fetch();
        $stmt->close();
        return $price;
    }
    public function saveTotal($id){
        $retArr =array ("success"=>0,"id"=>$id);
        $id = (int)$id;
        $sql = "select sum(productPrice * productQuantity) from billingInfo where billId='$id' group by billId";
        $result = $this->db->query($sql);
        $res = $result->fetch_array(MYSQLI_NUM);
        $total = (float) $res[0];
        $sql = "update billing set billAmount='$total' where billId='".$id."'";
        $this->db->query($sql);
        $retArr['success']=1;
        return $retArr;
    }
    public function getTotal($id){
        
        $id = (int)$id;
        $sql = "select sum(productPrice * productQuantity) from billingInfo where billId='$id' group by billId";
        $result = $this->db->query($sql);
        $res = $result->fetch_array(MYSQLI_NUM);
        $total = (float) $res[0];
        return $total;
    }
}