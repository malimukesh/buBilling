<!doctype html>
<html>
<head>
<title><?php print $title; ?></title>
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
    <?php include_once 'includes/topnav.php' ?>
    <div class="container">
        <div class="row">
            
            <table class="table table-bordered">
                <?php
                    $count = 0;
                    foreach ($pdata as $pd){
                        print '<tr>';
                        $td = '<td>';
                        $ctd = '</td>';
                        if($count == 0){
                            $td='<th>';
                            $ctd='</th>';
                        }
                        foreach($pd as $ptd){
                            print $td.$ptd.$ctd;
                        }
                        print '</tr>';
                        $count++;
                    }
                ?>
            </table>
            
        </div>
        
    </div>
</body>
        