<html lang="en">
    <title> <?php print $title; ?> </title>
    <head> 
    <link rel="stylesheet" href="/buBilling/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/buBilling/assets/css/bootflat.css">
    <link rel="stylesheet" href="/buBilling/assets/css/jquery-ui.css">

    <!-- Bootstrap -->
    <script src="/buBilling/assets/js/jquery-1.11.0.min.js"></script>
    <script src="/buBilling/assets/js/bootstrap.min.js"></script>
    <script src="/buBilling/assets/js/jquery-ui.js"></script>

    <!-- Bootflat's JS files.-->
    <script src="/buBilling/assets/js/icheck.min.js"></script>
    <script src="/buBilling/assets/js/jquery.fs.selecter.min.js"></script>
    <script src="/buBilling/assets/js/jquery.fs.stepper.min.js"></script> 
    <script>
        var products = {};
        var pname = [];
        function validateQuantity(event){
            
                if(event.which == 8 || event.which == 0){
                    return true;
                }
                if(event.which <= 46 || event.which > 59) {
                    return false;
                    //event.preventDefault();
                } // prevent if not number/dot                
            
        }
        function addRow(t){
            calTotal();
            var prnt = t.parentNode.parentNode.parentNode;
            var node = document.createElement('tr');
            node.innerHTML=$("#rowPaste").html();
            prnt.appendChild(node);
        }
        function delRow(t){
            calTotal();
            var prnt = t.parentNode.parentNode;                   
            prnt.remove();
            calTotal();
        }
        function getPrice(t){
            var priceElement= $(t).parent().next().children()[0];           
            var val=0;
            var idElement=$(t).next()[0];
            var id = -1;
            if(t.value in products){
                val= products[t.value].price;
                id = products[t.value].id;
            }                        
            idElement.setAttribute('value',id);
            priceElement.setAttribute('value',val);

        }
        function autoc(t){
            $(t).autocomplete({
                source : pname,
                change: function( event, ui ) {getPrice(t);},
            });
        }
        function calprice(t){
            var prev = $(t).parent().prev().children()[0];
            var next = $(t).parent().next().children()[0];

            var val=(t.value * prev.value);
            next.setAttribute('value',val);
            calTotal();
        }
        function validateProductIds(){
            var pids=$('[name="prd[pid][]"]');
            var len = pids.length;
            var i;
            for(i=0;i<len-1;i++){
                if(pids[i].value==-1) return false;
            }
           return true;
        }
        function calTotal(){
            var val=0.0;
            var tp = $('.tp');
            for(i=0;i<tp.length-1;i++){
                val += parseFloat(tp[i].value);
            }
            val=val.toFixed(2);
            $("#total").html(val);
            return val;
        }
        function saveBill(t){
           if(validateProductIds()==false){ alert("Enter correct Product information"); return false;}
           var ttl=calTotal();
           if(ttl<=0.0) {
               alert("Total amount must be greater that 0.0");
               return false;
           }
           t.disabled = true;
           $(t).addClass("disabled");
           var arr1 = $("#customerdata").serializeArray();
           var arr2 = $("#productData").serializeArray();
           arr1=arr1.concat(arr2);
           $.post('/buBilling/billing/save',arr1).done(function(data){
                var dt = JSON.parse(data);                 
                if(dt.success==1){
                   window.location='/buBilling/billing/show/'+dt.id;
                }
                else{
                   alert("Error in saving");
                }
           }).fail(function(){
                alert("Something went wrong on Server!! Check logs");
            }); ;
           $(t).removeClass("disabled");
           t.disabled = false;
        }
        
            $.get('/buBilling/product/showall/')
            .done(function(data){
                     var jsonData = JSON.parse(data);
                     $.each(jsonData,function(num,val){
                         num = parseInt(num);
                         if(num!=0){
                            products[val[3]]={'price':val[6],'id':val[0]};
                            pname.push(val[3]);
                        }
                     });
            })
            .fail(function(){
                alert("Something went wrong on Server!! Check logs");
            });                                            
        
    </script>
    </head>
    <body>
        <?php 
        $link="newbill";
        include_once 'includes/topnav.php'; 
        ?>
        <div class="container">
        <form id="customerdata">
            <table class="table">
                <caption><h4>Customer Details</h4></caption>

                <tbody>
                    <tr>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1"> Customer Name <span class="glyphicon glyphicon-user"></span><spna class="text-danger"> <strong> * </strong> </span> </span>
                                    <input type="text" class="form-control" name="cust[Customer_Name]"> </input>
                            </div>
                        </td>
                    </tr>                    
                    <tr>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1"> Customer Contact </span>
                                    <input type="text" class="form-control" name="cust[Customer_Contact]"> </input>
                            </div>
                        </td>
                    </tr>                                        
                    <tr>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon1"> Customer Address <span class="glyphicon glyphicon-envelope"></span></span>
                                    <input type="text" class="form-control" name="cust[Customer_Address]"> </input>
                            </div>
                        </td>                        
                    </tr>
                </tbody>
            </table>
        </form>
        <hr/>    
        <form id="productData">
            <table class="table table-bordered">
                <caption><h4>Enter Product Detail</h4></caption>            
                <thead>
                    <?php
                    $count = 0;
                    foreach($productDetails as $pd ){
                        print '<th>'.$pd.'</th>';
                    $count++;    
                    }
                    print '<th></th>';
                ?>
                </thead>
                <tbody align="center">
                    <tr>
                        <td><input type="text" class="form-control" name="prd[Name][]" onkeypress="autoc(this)" value=""/><input type="hidden" name="prd[pid][]" value="-1"></td>
                        <td><input type="text" class="form-control" name="prd[Price][]" readonly=""></td>
                        <td><input type="text" class="form-control" name="prd[Quantity][]" onfocus="calprice(this)" onchange="calprice(this)" onkeypress="return validateQuantity(event);"></td>
                        <td><input type="text" class="form-control tp" value="0" readonly=""></td>
                        <td><button type="button" onclick="addRow(this)"><b>+</b></button></td>
                    </tr>                 
                </tbody>
                <tfoot>
                    <tr><td colspan="2" align="center"><button class="btn btn-primary" type="button" onclick="saveBill(this)"> Submit Bill </button></td><td colspan="3" align="center"> Total : <span id="total"></span></td></tr>
                </tfoot>
            </table>
        </form>
        <table style="display:none">
            <tr id="rowPaste">
                <td><input type="text" class="form-control" name="prd[Name][]" onkeypress="autoc(this)" value="" onchange="getPrice(this)" /><input type="hidden" name="prd[pid][]" value="-1"></td>
                <td><input type="text" class="form-control" name="prd[Price][]" readonly=""></td>
                <td><input type="text" class="form-control" name="prd[Quantity][]" onfocus="calprice(this)" onchange="calprice(this)" onkeypress="return validateQuantity(event);"></td>
                <td><input type="text" class="form-control tp" value="0" readonly=""></td>
                <td><button type="button" onclick="addRow(this)"><b>+</b></button><button type="button" onclick="delRow(this)"><b>-</b></button></td>
            </tr>              
        </table>
        <p id="demo"></p>
    </div>
    </body>
</html>