<!doctype html>
<html>
    <head>
        <title>Bu Billing | Home</title>
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
        <?php $link = 'doc' ?>
        <?php include_once 'includes/topnav.php'; ?>
        <div class="container">
            <div class="row ">
                <div class="col-lg-4">
                    <div role="tablpanel">
                        <ul class="nav nav-pills nav-stacked" role="tablist"> 
                            <li role="presentation" class="active"><a href="#introduction" aria-controls="introduction" role="tab" data-toggle="tab">Introduction</a></li>
                            <li role="presentation"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home</a></li>
                            <li role="presentation"><a href="#newbill" aria-controls="newbill" role="tab" data-toggle="tab">New Bill</a></li>
                            <li role="presentation"><a href="#sales" aria-controls="sales" role="tab" data-toggle="tab">Sales</a></li>
                            <li role="presentation"><a href="#report" aria-controls="report" role="tab" data-toggle="tab">Report</a></li>
                            <li role="presentation"><a href="#products" aria-controls="products" role="tab" data-toggle="tab">Products</a></li>
                            <li role="presentation"><a href="#category" aria-controls="category" role="tab" data-toggle="tab">Category</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="introduction">
                            <div> 
                                <p><h2>What is BuBilling ? </h2></p>
                                <ul>
                                    <li>Open Source Software to manage billing for small shops.</li>
                                    <li>It provides sales report and billing data.</li>
                                    <li>It generates weekly monthly and All reports.</li>
                                </ul>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="home">
                            <div>
                                <p><h3>Home Section</h3></p>
                                <ul>
                                    <li>Quick links</li>
                                </ul>
                            
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="newbill">
                            <div> 
                                <p><h3>Customer Detail Section</h3></p>
                                <ul>
                                    <li> Customer Name required otherwise bill will not be submitted.</li>
                                    <li> Customer Contact Optional.</li>
                                    <li> Customer Address Optional.</li>
                                </ul>
                                <p><h3>Enter Product Detail Section</h3></p>
                                <ul>
                                    <li> Product Name required.</li>
                                    <ul>
                                        <li>As you type product names will be suggested.</li>
                                        <li>Product name must be in our database otherwise bill will not be submitted.</li>
                                    </ul>
                                    <li> Product Price will be fetched from database</li>
                                    <li> Product Qunatity required (Default is 0)</li>
                                    <li> Total bill amount must be greater than zero then only bill will be submitted.</li>
                                </ul>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="sales">
                            <div> 
                                <p><h3>Sales Section</h3></p>
                                <ul>
                                    <li>This section generates sales reports.</li>
                                    <li>Today,weekly (current week),Month (Current Month), All (Till now sold) product sales report will be generated </li>                                    
                                </ul>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="report">
                            <div>
                                <p><h3>Report</h3></p>
                                <ul>
                                    <li>This section generates billing reports.</li>
                                    <li>Today,weekly (current week),Month (Current Month), All (Till now) generated bill reports will be generated </li>                                    
                                </ul>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="products">
                            <div>
                                <p><h3>Products</h3></p>
                                <ul>
                                    <li><h5>List Product</h5></li>
                                    <ul>
                                        <li>Lists All products available to sold</li>
                                    </ul>
                                    <li><h5>Add Product</h5></li>
                                    <ul>
                                        <li>User can add new product if product is not available in product list.</li>
                                    </ul>
                                    <li><h5>Remove Product</h5></li>
                                    <ul>
                                        <li>User can delete product if user is not willing to sell product.</li>
                                    </ul>
                                </ul>
                            </div>
                        </div> 
                        <div role="tabpanel" class="tab-pane" id="category">
                            <div> 
                                <p><h3>Category</h3>
                                <ul>
                                    <li><h5>List Category</h5></li>
                                    <ul>
                                        <li>Lists product categories and product available in each category</li>
                                    </ul>
                                    <li><h5>Add Category</h5></li>
                                    <ul>
                                        <li>Add product category </li>
                                    </ul>
                                </ul>
                            </div>
                        </div>  
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
