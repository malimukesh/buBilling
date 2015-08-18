<!doctype html>
<html>
    <head>
        <title>Bu Billing | Home</title>
        <meta charset="utf-8" />
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
            function calSHA(){
                var pwd = $('[name="pwd"]');
                pwd=pwd[0];
                pwd.value=$.sha256(pwd.value);
                return true;
            }
            
        </script>
    </head>

    <body>
        <div class="container">
            <div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">                        
                        <h1 class="text-center">Bu Billing Login</h1>
                    </div>
                    <div class="modal-body">
                        <form id="authForm" class="form col-md-12 center-block" method="POST" action="/buBilling/auth/index" onsubmit="return calSHA();">
                          <div class="form-group">
                            <input type="text" class="form-control input-lg" placeholder="Username" name="uname">
                          </div>
                          <div class="form-group">
                            <input type="password" class="form-control input-lg" placeholder="Password" name="pwd">
                          </div>
                          <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-lg btn-block">Sign In</button>
                            
                          </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <p class="text-danger"></p>
                    </div>
                </div>
                </div>
              </div>
        </div>

    </body>
</html>
