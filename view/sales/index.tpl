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
        $link = "sales";
        include_once 'includes/topnav.php'; 
    ?>
    <div class="container">        
        <div class="row">
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
                                foreach ($todaysales as  $rt){
                                    print '<tr>';
                                    foreach($rt as $r){
                                        if($cnt==0) {
                                            print '<th>'.$r.'</th>';
                                        }else{
                                            print '<td>'.$r.'</td>';
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
                                foreach ($weeksales as  $rt){
                                    print '<tr>';
                                    foreach($rt as $r){
                                        if($cnt==0) {
                                            print '<th>'.$r.'</th>';
                                        }else{
                                            print '<td>'.$r.'</td>';
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
                                foreach ($monthsales as  $rt){
                                    print '<tr>';
                                    foreach($rt as $r){
                                        if($cnt==0) {
                                            print '<th>'.$r.'</th>';
                                        }else{
                                            print '<td>'.$r.'</td>';
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
                                foreach ($allsales as  $rt){
                                    print '<tr>';
                                    foreach($rt as $r){
                                        if($cnt==0) {
                                            print '<th>'.$r.'</th>';
                                        }else{
                                            print '<td>'.$r.'</td>';
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
        <div class="row">
            
        </div>
    </div>  
</body>
</html>    