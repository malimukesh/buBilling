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
    <?php include_once 'includes/topnav.php'; ?>
    <div class="container">        
        <table class="table">
            <caption>Today's Bill</caption>
            <tbody>
             <?php
                $count = count($billData);
                for($i=0;$i<$count;$i++){
                    if($i==0){
                        print '<tr>';
                        print '<td> # </td>';
                        foreach($billData[$i] as $bd){
                            print '<th>'.$bd.'</th>';
                        }
                        print '</tr>';
                    }else{
                        print '<tr>';
                        print '<td>'.($i).'</td>';
                        
                        $cnt = 0;
                        foreach($billData[$i] as $bd){
                            if($cnt == 0){
                                print '<td>'."<a href='/buBilling/billing/show/$bd/'>".$bd.'</a></td>';
                                $cnt++;
                            }else{
                                print '<td>'.$bd.'</td>';
                            }
                        }
                        print '</tr>';
                    }
                }
             ?>
            </tbody>
        </table>        
    </div>  
</body>
</html>    