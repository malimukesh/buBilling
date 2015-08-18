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
    <script type="text/javascript">
        $.ajax({asynch:false});
        $(document).ready(function(){
            showAll();
            $('[name="price"]').keypress(function(event) {
                if(event.which == 8 || event.which == 0){
                    return true;
                }
                if(event.which < 46 || event.which > 59) {
                    return false;
                    //event.preventDefault();
                } // prevent if not number/dot

                if(event.which == 46 && $(this).val().indexOf('.') != -1) {
                    return false;
                    //event.preventDefault();
                } // prevent if already dot
            });
        });
        function listProducts(){
            $.get("/buBilling/product/list").done(function(data){

            });
        }
        function saveProduct(t){
            var prdName = $('[name="product[productName]"')[0].value;
            if(prdName.trim() == "" ){
                alert("Enter product Name");
                return false;
            }
            var prdPrice = $('[name="price"')[0].value;
            if(prdPrice.trim() == "" ){
                alert("Enter product Price");
                return false;
            }    
            t.disabled=true;
            t.textContent = "Saving ..";
            var arr=$('[name="addProductForm"]').serializeArray();
            $.post('/buBilling/product/save',arr).done(function(data){
                 var parsedData = JSON.parse(data);
                if(parsedData.success==0){
                    alert("Error");
                    return false;
                }else{
                    showAll();
                    $('[name="addProductForm"]')[0].reset();
                }
             });
             showAll();
             t.disabled=false;
             t.textContent = "Save";
            return true;
        }
        function showAll(){
            $.ajax({
                asynch:false
            });
            $.get('/buBilling/product/showall/').done(function(data){
                var jsonData = JSON.parse(data);
                var str = "<caption> Product Present are </caption>";
                $.each(jsonData,function(num,val){
                    num = parseInt(num)+1;
                     str+='<tr>';
                     $.each(val,function(n,v){
                        str+='<td>'+v+'</td>';
                     });
                     str+='</tr>';
                });
                $("#listProducts").html(str);
            });                   
        }        
    </script>
</head>

    <body>
    <?php include_once 'includes/topnav.php'; ?>
    <div class="container">
        <p> <?php print $body; ?> </p>
        <form name='addProductForm'>
            <table class="table table-bordered">
                <caption>Addproduct</caption>
                <thead>
                    <th> Input Deails </th><th></th>
                </thead>
                <tbody>
                    <tr><th class="text-danger">Product Name : * </th><td><input class="form-control" type="text" name="product[productName]"></td></tr>
                    <tr><th>Product Description: </th><td><input class="form-control" type="text" name="product[description]"></td></tr>   
                    <tr><th>Product Vendor : </th> <td><input class="form-control" type="text" name="product[productVendor]"></td></tr>
                    <tr><th class="text-danger">Product Price : *</th> <td><input class="form-control" type="text" name="price"></td></tr>
                    <tr><th class="text-danger">Categories :</th><td><select class="form-control" name="category">
                    <?php
                        foreach($categories as $cat){
                            print '<option value="'.$cat['value'].'">'.$cat['text'].'</option>';
                        }
                            print '</select></td></tr>';
                    ?>
                    <tr><td></td><td><button class="btn btn-primary" type='button' onclick="return saveProduct(this)"> Save</button> </td>
                </tbody>
            </table>
            <hr/>
            <table class="table table-hover table-bordered" id="listProducts">
                
            </table>
            <p id="demo"></p>
        </form>
    </div> 
    </body>
</html>