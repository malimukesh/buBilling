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
    </head>

    <body>
        <?php $link = 'chpwd' ?>
        <?php include_once 'includes/topnav.php'; ?>
        <div class="container">
            <p>  <?php print $Success;?> </p>
            <p>  <?php print $Message;?> </p>
               
        </div>

    </body>
</html>
