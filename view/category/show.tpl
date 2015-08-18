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
                <div class="panel-group" id="accordion">
                <?php 
                $count=0;
                foreach($cdata as $pd){
                    print '<div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse'.$count.'"> &nbsp;<b>'.$pd.'</b> </a>
                                </h3>
                            </div>
                            <div id="collapse'.$count.'" class="panel-collapse collapse out">
                                <div class="panel-body">';
                    
                    ?>
                    <table class="table table-bordered">
                        <thead>
                            <?php
                                foreach($productbycategory['headRow'] as $val){
                                    print '<th>'.$val.'</th>';
                                }
                            ?>
                        </thead>
                        <tbody>
                            <?php                               
                                foreach($productbycategory[$pd] as $arr){
                                    
                                    print '<tr>';
                                        foreach($arr  as $v){
                                            print '<td>'.$v.'</td>';
                                        }
                                    print '</tr>';
                                }
                            ?>                            
                        </tbody>
                    </table>
                            
                    <?php            
                    print '     </div>
                            </div>
                        </div><br/>';
                $count++;
                }
                ?>
                </div>
    </div>
</body>
        