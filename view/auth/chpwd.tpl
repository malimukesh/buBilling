<!doctype html>
<html>
    <head>
        <title>Bu Billing | Home</title>
        <link rel="stylesheet" href="/buBilling/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="/buBilling/assets/css/bootflat.css">
                    
        <!-- Bootstrap -->
        <script src="/buBilling/assets/js/jquery-1.11.0.min.js"></script>
        <script src="/buBilling/assets/js/bootstrap.min.js"></script>
        <script src="/buBilling/assets/js/custom.js"></script>

        <!-- Bootflat's JS files.-->
        <script src="/buBilling/assets/js/icheck.min.js"></script>
        <script src="/buBilling/assets/js/jquery.fs.selecter.min.js"></script>
        <script src="/buBilling/assets/js/jquery.fs.stepper.min.js"></script>         
        <script type="text/javascript">
            function verifyForm(){
                var oldpwd = $("#oldpwd")[0];
                var newpwd = $("#newpwd")[0];
                var cnfnewpwd = $("#cnfnewpwd")[0];
                var oldval = oldpwd.value.trim();
                var newval = newpwd.value.trim();
                var cnfval = cnfnewpwd.value.trim();
                
                if( oldval !="" && newval!=oldval && newval!="" && cnfval==newval){                    
                    oldpwd.value = $.sha256(oldval);
                    newpwd.value = $.sha256(newval);
                    cnfnewpwd.value = $.sha256(cnfval);
                    return true;
                }else{
                    alert("Enter correct information");
                    return false;
                }                
                
                return false;
            }
        </script>
    </head>

    <body>
        <?php $link = 'chpwd' ?>
        <?php include_once 'includes/topnav.php'; ?>
        <div class="container">
            <div class="row" id="chpwddiv">
                  <h2>Change Password</h2>
                  <form role="form" action="/buBilling/auth/changepwd" onsubmit="return verifyForm();" method="POST">                      
                      <div class="form-group">
                        <label for="pwd">Old Password:</label>
                        <input type="password" class="form-control" id="oldpwd" name="oldpwd" placeholder="Enter Old password">
                      </div>
                      <div class="form-group">
                        <label for="pwd">New Password:</label>
                        <input type="password" class="form-control" id="newpwd" name="newpwd" placeholder="Enter new password">
                      </div>
                      <div class="form-group">
                        <label for="pwd">Confirm New Password:</label>
                        <input type="password" class="form-control" id="cnfnewpwd" name="cnfnewpwd" placeholder="Confirm new password">
                      </div>
                      <button type="submit" class="btn btn-primary">Change Password</button>
                    </form>
            </div>
        </div>

    </body>
</html>
