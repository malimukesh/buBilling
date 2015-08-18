<!doctype html>
<html>
    <head>
        <title>Bu Billing | Home</title>
        <link rel="stylesheet" href="/buBilling/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="/buBilling/assets/css/bootflat.css">
                    
        <!-- Bootstrap -->
        <script src="/buBilling/assets/js/jquery-1.11.0.min.js"></script>
        <script src="/buBilling/assets/js/bootstrap.min.js"></script>        

        <!-- Bootflat's JS files.-->
        <script src="/buBilling/assets/js/icheck.min.js"></script>
        <script src="/buBilling/assets/js/jquery.fs.selecter.min.js"></script>
        <script src="/buBilling/assets/js/jquery.fs.stepper.min.js"></script>         
    </head>

    <body>
        <?php $link = 'home' ?>
        <?php include_once 'includes/topnav.php'; ?>
        <div class="container">

            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><span class="glyphicon glyphicon-pencil"> </span> &nbsp; <a href="/buBilling/billing">New Billing</a></h3>
                        </div>                        
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><span class="glyphicon glyphicon-signal"> </span> &nbsp; <a href="/buBilling/report/daily">Daily Reports</a></h3>
                        </div>                        
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><span class="glyphicon glyphicon-signal"> </span> &nbsp; <a href="/buBilling/report/monthly">Monthly Reports</a></h3>
                        </div>                        
                    </div>                    
                </div>
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><span class="glyphicon glyphicon-signal"> </span> &nbsp; <a href="/buBilling/report/weekly">Weekly Reports</a></h3>
                        </div>                        
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><span class="glyphicon glyphicon-plus-sign"> </span> &nbsp; <a href="/buBilling/product/add">Add Products</a></h3>
                        </div>                        
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><span class="glyphicon glyphicon-remove"></span> &nbsp; <a href="/buBilling/product/remove">Remove Products</a></h3>
                        </div>                        
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"> <span class="glyphicon glyphicon-plus-sign"> </span> &nbsp; <a href="/buBilling/category/add">Add Product Category</a></h3>
                        </div>                        
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
