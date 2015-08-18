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
    <?php 
        $link="report";
        include_once 'includes/topnav.php'; 
    ?>
    <div class="container">        
        <div class="row">
            <table class="table">
                <caption>Reports</caption>
                <tbody>
                 <?php
                    foreach ($report as  $rt){
                        print '<tr>';
                        foreach ($rt as $data=>$value){
                            print '<th>'.$data.'</th><td>'.$value.'</td>';
                        }
                        print '</tr>';
                    }
                 ?>
                </tbody>
            </table>        
        </div>
        <div class="row">
            <div class="well well-sm">
                <h5> Billing Reports </h5>
            </div>
            <div role="tabpanel">
                <!-- Nav tabs -->
                <ul class="nav nav-pills" role="tablist">
                  <li role="presentation" class="active"><a href="#today" aria-controls="today" role="tab" data-toggle="tab">Today</a></li>
                  <li role="presentation"><a href="#week" aria-controls="week" role="tab" data-toggle="tab">Week</a></li>
                  <li role="presentation"><a href="#month" aria-controls="month" role="tab" data-toggle="tab">Month</a></li>
                  <li role="presentation"><a href="#all" aria-controls="all" role="tab" data-toggle="tab">All</a></li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="today">
                        <table class="table">
                            <caption class="info"> Today's <b>[ <?php print $today; ?> ] </b>Sales Reports</caption>
                            <tbody>
                             <?php
                                $cnt = 0;                                
                                foreach ($todayreport as  $rt){
                                    print '<tr>';
                                    $count=0;
                                    foreach($rt as $r){
                                        $count++;
                                        if($cnt==0) {
                                            print '<th>'.$r.'</th>';
                                        }else{
                                           if($count!=1){                                           
                                                print '<td>'.$r.'</td>';
                                            }else{
                                                print '<td><a href="/buBilling/billing/show/'.$r.'">'.$r.'</a></td>';
                                            }
                                        }
                                    }
                                    $cnt++;
                                    print '</tr>';
                                }
                             ?>
                            </tbody>
                        </table>                                                                                          
                    </div>
                    <div role="tabpanel" class="tab-pane" id="week">
                        <table class="table">
                            <caption> This Week Sales Reports <strong><?php print "[ $weekstartdate ] - [ $weekenddate ]"; ?></strong> </caption>
                            <tbody>
                             <?php
                                $cnt=0;
                                foreach ($weekreport as  $rt){
                                    print '<tr>';
                                    $count=0;
                                    foreach($rt as $r){
                                        $count++;
                                        if($cnt==0) {
                                            print '<th>'.$r.'</th>';
                                        }else{
                                           if($count!=1){                                           
                                                print '<td>'.$r.'</td>';
                                            }else{
                                                print '<td><a href="/buBilling/billing/show/'.$r.'">'.$r.'</a></td>';
                                            }
                                        }
                                    }
                                    $cnt++;
                                    print '</tr>';
                                }
                             ?>
                            </tbody>
                        </table>                        
                    </div>
                    <div role="tabpanel" class="tab-pane" id="month">
                        <table class="table">
                            <caption> This Month Sales Reports</caption>
                            <tbody>
                             <?php
                                $cnt=0;
                                foreach ($monthreport as  $rt){
                                    print '<tr>';
                                    $count=0;
                                    foreach($rt as $r){
                                        $count++;
                                        if($cnt==0) {
                                            print '<th>'.$r.'</th>';
                                        }else{
                                           if($count!=1){                                           
                                                print '<td>'.$r.'</td>';
                                            }else{
                                                print '<td><a href="/buBilling/billing/show/'.$r.'">'.$r.'</a></td>';
                                            }
                                        }
                                    }
                                    $cnt++;
                                    print '</tr>';
                                }
                             ?>
                            </tbody>
                        </table>                                                
                    </div>
                    <div role="tabpanel" class="tab-pane" id="all">
                        <table class="table">
                            <caption> Total Sales Reports</caption>
                            <tbody>
                             <?php
                                $cnt=0;
                                foreach ($allreport as  $rt){
                                    print '<tr>';
                                    $count=0;
                                    foreach($rt as $r){
                                        $count++;
                                        if($cnt==0) {
                                            print '<th>'.$r.'</th>';
                                        }else{
                                           if($count!=1){                                           
                                                print '<td>'.$r.'</td>';
                                            }else{
                                                print '<td><a href="/buBilling/billing/show/'.$r.'">'.$r.'</a></td>';
                                            }
                                        }
                                    }
                                    $cnt++;
                                    print '</tr>';
                                }
                             ?>
                            </tbody>
                        </table>                                           
                  </div>
                </div>
            </div> <!-- Tab Panel -->
        </div>
    </div>
    
</body>
</html>    