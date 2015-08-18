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
        <p>
            <?php print $body; ?>
        </p>
        <table class="table">
            <caption><h4>Details</h4></caption>
            <tbody>               
                <tr><td>Bill Number : </td><td> <?php print nl2br($cust['billNumber']); ?> </td></tr>
                <tr><td>Biller : </td><td> <?php print nl2br($cust['billerName']); ?> </td></tr>
                <tr><td>Bill Date : </td><td> <?php print $cust['billDate']; ?> </td></td>
                <tr><td>Customer Name :</td><td> <?php print nl2br($cust['customerName']); ?></td></tr>
                <tr><td>Customer Contact :</td><td><?php print nl2br($cust['customerContact']); ?></td></tr>
                <tr><td>Customer Address :</td><td><?php print nl2br($cust['customerAddress']); ?></td></tr> 
                <tr><td>Total :</td><td><b><?php print $total; ?>/-Rs</b></td></tr> 
            </tbody>
        </table>
        <hr/>
        <?php $keys= array_keys($bill[0]) ?>
        <table class="table table-striped">
            <caption><h4>Product Buying Details</h4></caption>
            <thead>
                <tr>
                    <th> S.No </th>
               <?php
                foreach($keys as $key){
                    print '<th>'.$key.'</th>';
                }
               ?>
                </tr>
            </thead>
            <tbody>
                <?php
                    $count=1;
                    foreach($bill as $bl){
                        print '<tr>';
                        print '<td>'.$count++.'</td>';
                        foreach($bl as $vl){
                            print '<td>'.$vl.'</td>';
                        }
                        print '</tr>';
                    }
                ?>
            </tbody>
            <tfoot>
                <tr>
                <?php
                $cnt = count($keys);
                for($i=0;$i<$cnt-2;$i++){
                    print '<td></td>';
                }
                print '<td> Total </td><td>'.$total.'</td>';
                ?>
                </tr>
            </tfoot>
        </table>
    </div>  
</body>
</html>    