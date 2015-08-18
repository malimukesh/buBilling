<!doctype html>
<html>
    <head>
        <title>Bu Billing | Home</title>
        <link rel="stylesheet" href="/buBilling/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="/buBilling/assets/css/bootflat.css">
                    
        <!-- Bootstrap -->
        <script src="/buBilling/assets/js/jquery-1.11.0.min.js"></script>
        <script src="/buBilling/assets/js/bootstrap.min.js"></script>
        <script src="/buBilling/assets/js/jsapi.js"></script>

        <!-- Bootflat's JS files.-->
        <script src="/buBilling/assets/js/icheck.min.js"></script>
        <script src="/buBilling/assets/js/jquery.fs.selecter.min.js"></script>
        <script src="/buBilling/assets/js/jquery.fs.stepper.min.js"></script> 
    </head>

    <body>
        <?php $link = 'dashboard' ?>
        <?php include_once 'includes/topnav.php'; ?>
        <div class="container">
            <div class="row text-center">                
                <div class="col-md-6" id="today"> Loading Data .... </div>
                <div class="col-md-6" id="week">  Loading Data .... </div>
            </div>
            <div class="row text-center">
                <div class="col-md-6" id="month"> Loading Data ....  </div>
                <div class="col-md-6" id="all"> Loading Data ....  </div>
            </div>
        </div>
        <script type="text/javascript">
            jQuery.ajaxSetup({async:false});
            var todayrows ;
            var weekrows ;
            var monthrows ;
            var allrows ;
            var divs = ["today","week","month","all"];
            $.get("/buBilling/sales/apiweekly").done(function(dt){
                weekrows=JSON.parse(dt);
            });
            $.get("/buBilling/sales/apimonthly").done(function(dt){
                monthrows=JSON.parse(dt);
            });
            $.get("/buBilling/sales/apitoday").done(function(dt){
                todayrows=JSON.parse(dt);
            });
            $.get("/buBilling/sales/apiall").done(function(dt){
                allrows=JSON.parse(dt);
            });            
            // Load the Visualization API and the piechart package.
            google.load('visualization', '1.0', {'packages':['corechart']});

            // Set a callback to run when the Google Visualization API is loaded.

            google.setOnLoadCallback(drawChart);


            // Callback that creates and populates a data table,
            // instantiates the pie chart, passes in the data and
            // draws it.
            function dC(dv){
                  console.log(dv);
              // Create the data table.
              var data = new google.visualization.DataTable();
              data.addColumn('string', 'Product');
              data.addColumn('number', 'Sales');
              var i =0;
              var rows = [];
              if(dv=="week"){
                  rows = weekrows;
              }
              else if(dv=="month"){
                  rows = monthrows;
              }else if(dv=="today"){
                  rows = todayrows;
              }else if(dv=="all"){
                  rows = allrows;
              }
              for(i=0;i<rows.length;i++){
                data.addRows([[rows[i][0],parseInt(rows[i][1])]]);
              }
        
              // Set chart options
              var options = {'title':'Product Sales '+dv,
                             'width':500,
                             'height':350,
                             'is3D': true,
                             'pieSliceText': 'label'};

              // Instantiate and draw our chart, passing in some options.
              var chart = new google.visualization.PieChart(document.getElementById(dv));
              chart.draw(data, options);
            }
            function drawChart(dv) {
                for(i=0;i<divs.length;i++){
                    dC(divs[i]);
                }
            }
    </script>
    </body>
</html>
