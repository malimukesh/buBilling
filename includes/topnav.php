<style>
body { padding-bottom: 70px; }
.navbar-default {
  background-color: #09283c;
  border-color: #161414;
}
.navbar-default .navbar-brand {
  color: #eef3f4;
}
.navbar-default .navbar-brand:hover, .navbar-default .navbar-brand:focus {
  color: #ffbbbc;
}
.navbar-default .navbar-text {
  color: #eef3f4;
}
.navbar-default .navbar-nav > li > a {
  color: #eef3f4;
}
.navbar-default .navbar-nav > li > a:hover, .navbar-default .navbar-nav > li > a:focus {
  color: #ffbbbc;
}
.navbar-default .navbar-nav > li > .dropdown-menu {
  background-color: #09283c;
}
.navbar-default .navbar-nav > li > .dropdown-menu > li > a {
  color: #eef3f4;
}
.navbar-default .navbar-nav > li > .dropdown-menu > li > a:hover,
.navbar-default .navbar-nav > li > .dropdown-menu > li > a:focus {
  color: #ffbbbc;
  background-color: #161414;
}
.navbar-default .navbar-nav > li > .dropdown-menu > li > .divider {
  background-color: #09283c;
}
.navbar-default .navbar-nav > .active > a, .navbar-default .navbar-nav > .active > a:hover, .navbar-default .navbar-nav > .active > a:focus {
  color: #ffbbbc;
  background-color: #161414;
}
.navbar-default .navbar-nav > .open > a, .navbar-default .navbar-nav > .open > a:hover, .navbar-default .navbar-nav > .open > a:focus {
  color: #ffbbbc;
  background-color: #161414;
}
.navbar-default .navbar-toggle {
  border-color: #161414;
}
.navbar-default .navbar-toggle:hover, .navbar-default .navbar-toggle:focus {
  background-color: #161414;
}
.navbar-default .navbar-toggle .icon-bar {
  background-color: #eef3f4;
}
.navbar-default .navbar-collapse,
.navbar-default .navbar-form {
  border-color: #eef3f4;
}
.navbar-default .navbar-link {
  color: #eef3f4;
}
.navbar-default .navbar-link:hover {
  color: #ffbbbc;
}

@media (max-width: 767px) {
  .navbar-default .navbar-nav .open .dropdown-menu > li > a {
    color: #eef3f4;
  }
  .navbar-default .navbar-nav .open .dropdown-menu > li > a:hover, .navbar-default .navbar-nav .open .dropdown-menu > li > a:focus {
    color: #ffbbbc;
  }
  .navbar-default .navbar-nav .open .dropdown-menu > .active > a, .navbar-default .navbar-nav .open .dropdown-menu > .active > a:hover, .navbar-default .navbar-nav .open .dropdown-menu > .active > a:focus {
    color: #ffbbbc;
    background-color: #161414;
  }
}
</style>
<nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/buBilling/">Business Simplified </a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <?php if(strcmp($link,"home")==0){                
                        print '<li class="active"><a href="/buBilling/"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a></li>';
                    }else{
                        print '<li><a href="/buBilling/"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a></li>';
                    }
                    if(strcmp($link,"newbill")==0){  
                        print '<li class="active"><a href="/buBilling/billing/"><span class="glyphicon glyphicon-new-window" aria-hidden="true"></span> New Bill</a></li>';
                    }else {
                        print '<li><a href="/buBilling/billing/"><span class="glyphicon glyphicon-new-window" aria-hidden="true"></span> New Bill</a></li>';                        
                    }
                    if(strcmp($link,"sales")==0){  
                      print '<li class="active"><a href="/buBilling/sales/"><span class="glyphicon glyphicon-stats" aria-hidden="true"></span> Sales</a></li>';
                    }else{
                      print '<li><a href="/buBilling/sales/"><span class="glyphicon glyphicon-stats" aria-hidden="true"></span> Sales</a></li>';
                    }
                    if(strcmp($link,"report")==0){  
                        print '<li class="active"><a href="/buBilling/report/"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> Report</a></li>';
                    }else{
                        print '<li><a href="/buBilling/report/"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> Report</a></li>';
                    }
                    if(strcmp($link,"dashboard")==0){  
                        print '<li class="active"><a href="/buBilling/dashboard/"><span class="glyphicon glyphicon-dashboard" aria-hidden="true"></span> Dashboard</a></li>';
                    }else{
                        print '<li><a href="/buBilling/dashboard/"><span class="glyphicon glyphicon-dashboard" aria-hidden="true"></span> Dashboard</a></li>';
                    }
            ?>              
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>Products <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="/buBilling/product/show"><span class="glyphicon glyphicon-list" aria-hidden="true"></span> List</a></li>
                  <li><a href="/buBilling/product/add"><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span> Add</a></li>
                  <li><a href="/buBilling/product/remove"><span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span> Remove</a></li>                                    
                </ul>
              </li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Category <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="/buBilling/category/show"><span class="glyphicon glyphicon-list" aria-hidden="true"></span> List</a></li>
                  <li><a href="/buBilling/category/add"><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span> Add</a></li>                                                      
                </ul>
              </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Hi <?php print $_COOKIE['username']; ?> <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="/buBilling/auth/chpwd"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span> Change Password </a></li>
                    <li><a href="/buBilling/doc/"><span class="glyphicon glyphicon-book" aria-hidden="true"></span> Documentation </a></li>
                    <li><a href="/buBilling/auth/logout"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span> Logout </a></li>
                </ul>
                </li>
            </ul>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
</nav>
<nav class="navbar navbar-default navbar-fixed-bottom">
  <div class="container">
      <p class="text-info text-center"> &COPY; 2015 Designed By <a href="http://www.busimplified.com">Business Simplified</a> <p> 
  </div>
</nav>