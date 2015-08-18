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
<script>
    function removeProduct(t){
        var id = t.value;
        var ret = confirm("Do you want to delte Product of ProductId"+id);
        if(ret == false) return;
        $.get('/buBilling/product/delete/'+id).done(function(data){
                var dt = JSON.parse(data);
                if(dt.success==1){
                   alert("Product Deleted SuccessfullY !!");
                   $(t).parent().parent().remove();
                }else{
                   alert("Error in deleting product");
                }
        }).fail(function(){
            alert("Error in deleting Check for server logs!!")
        });
    }
</script>
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
                        $cnt=0;
                        $pid;
                        foreach($pd as $ptd){
                            if($cnt==0){
                                $pid = $ptd;
                                $cnt++;
                            }
                            print $td.$ptd.$ctd;
                        }
                        if($count!=0)
                            print '<td> <button class="btn btn-sm btn-danger" value="'.trim($pid).'" onclick="removeProduct(this)"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></button>'; 
                        else print '<td></td>';    
                        print '</tr>';
                        $count++;
                    }
                ?>
            </table>
            
        </div>
        
    </div>
</body>
        