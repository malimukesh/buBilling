<!doctype html>
<html>
<head>
    <title><?php print $title; ?></title>
    <link rel="stylesheet" href="/buBilling/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/buBilling/assets/css/bootflat.css">
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
        <!-- Bootstrap -->
    <script src="/buBilling/assets/js/jquery-1.11.0.min.js"></script>
    <script src="/buBilling/assets/js/bootstrap.min.js"></script>

    <!-- Bootflat's JS files.-->
    <script src="/buBilling/assets/js/icheck.min.js"></script>
    <script src="/buBilling/assets/js/jquery.fs.selecter.min.js"></script>
    <script src="/buBilling/assets/js/jquery.fs.stepper.min.js"></script>
    <script>
        $(document).ready(function(){
            showAll();
         });
        function listCategory(){
            $.get("/buBilling/category/list").done(function(data){

            });
        }
        function saveCategory(){
            var arr=$('[name="addCategoryForm"]').serializeArray();
            $.each(arr,function(obj){
                 if(obj.value=="") return false;
             });
            $.post('/buBilling/category/save',arr).done(function(data){
                var parsedData = JSON.parse(data);                
             }).fail(function(){
                alert("Something went wrong on Server!! Check logs");
            }); ;
             showAll();
             showAll();
            return true;
        }
        function showAll(){
            $.get('/buBilling/category/showall/').done(function(data){
                var jsonData = JSON.parse(data);
                var str = "<caption> Categories Present are </caption>";
                $.each(jsonData,function(num,val){
                    num = parseInt(num)+1;
                    str+='<tr><td>'+num+'</td><td>'+val+'</td></tr>';                           
                });
                $("#listProducts").html(str);
            }).fail(function(){
                alert("Failed !! ");
            });
            
            return true;
        }
    </script>
</head>
<body>
    <?php include_once 'includes/topnav.php'; ?>
    <div class="container">
    <p> <?php print $body; ?> </p>
    <form name='addCategoryForm' action='/buBilling/category/save' method="POST">
        <table class="table table-striped">
            <caption>Add Category</caption>                
            <tbody>
                <tr><th>Category Name : *</th><td> <input class="form-control" type="text" name="categoryName" /></td></tr>
                <tr><td></td><td><button class="btn btn-primary" type='button' onclick="return saveCategory()"> Save</button> </td>
            </tbody>
        </table>
        <hr/>
        <table class="table table-hover" id="listProducts">

        </table>
        <p id="demo"></p>
    </form>
    </div>
</body>
</html>