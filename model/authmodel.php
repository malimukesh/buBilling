<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class authModel extends Model{
    
    public function authenticate($username,$password){
       $username = trim($username);
       $password = trim($password);
       if($username == "") return FALSE;
       if($password == "") return FALSE;
       
       $sql = "select username,pwd from security where username=? and pwd=?";
       $stmt = $this->db->prepare($sql) or trigger_error("Error in $sql");
       $stmt->bind_param('ss',$username,$password);
       $stmt->execute();
       
       $retusername;
       $retpassword;
       $stmt->bind_result($retusername,$retpassword);
       $stmt->fetch();
       $stmt->close();       
       if((strcmp($username,$retusername)==0) && (strcmp($password, $retpassword)==0) ){
           setcookie('login',1,time()+3600,'/');
           setcookie('username',$retusername,time()+3600,'/');
           return TRUE;
       }else{
           return FALSE;
       }
    }
    public function changePassword($username,$oldpwd,$newpwd){
        $retusername;
        $retpassword;
        $sql = "select username,pwd from security where username=? and pwd=?";
        $stmt = $this->db->prepare($sql) or trigger_error("Error in $sql");
        $stmt->bind_param('ss',$username,$oldpwd);
        $stmt->execute();
        $stmt->bind_result($retusername,$retpassword);
        $stmt->fetch();
        $stmt->close();
        if(strcmp(trim($oldpwd),trim($retpassword))==0){
          $sql = "update security set pwd=? where username=?";
          $this->db->query("BEGIN");
          $stmt = $this->db->prepare($sql) or trigger_error("Error in [ $sql ]". mysqli_error($this->db));
          $stmt->bind_param('ss',$newpwd,$username);
          $stmt->execute();
          $this->db->query("COMMIT");
          $retArr = array("Success"=>1,"Message"=>"Password Changed Successfully for $username !!");
        }else{
            $retArr = array("Success"=>0,"Message"=>"Oldpassword didn't matched  for $username !!");
        }
        
        return $retArr;
    }
    
}