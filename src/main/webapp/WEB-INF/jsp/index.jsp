<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16"
          href="assets/images/favicon.png">
    <title>Monster Admin Template - The Most Complete & Trusted
        Bootstrap 4 Admin Template</title>
    <!-- Bootstrap Core CSS -->
    <link
            href="<%=basePath %>/source/assets/plugins/bootstrap/css/bootstrap.min.css"
            rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<%=basePath %>/source/css/style.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="<%=basePath %>/source/css/colors/blue.css" id="theme"
          rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

</head>

<body class="fix-header fix-sidebar card-no-border">

<!-- Preloader - style you can find in spinners.css -->

<div class="preloader">
    <svg class="circular" viewBox="25 25 50 50">
        <circle
                class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2"
                stroke-miterlimit="10"/>
    </svg>
</div>

<!-- Main wrapper - style you can find in pages.scss -->

<div id="main-wrapper">

    <!-- Topbar header - style you can find in pages.scss -->

    <header class="topbar">
        <nav
                class="navbar top-navbar navbar-toggleable-sm navbar-light">

            <!-- Logo -->
            <div class="navbar-header">
                <a class="navbar-brand" href="index.html">
                    <img src="<%=basePath %>source/logo.jpg"
                         alt="homepage" style="width:240px;height:71.8px"/>
                    </b> <span> </span>
                </a>
            </div>

            <!-- End Logo -->
            <div class="navbar-collapse">

                <!-- toggle and nav items -->

                <ul class="navbar-nav mr-auto mt-md-0 ">
                    <!-- This is  -->
                    <li class="nav-item"><a
                            class="nav-link nav-toggler hidden-md-up text-muted waves-effect waves-dark"
                            href="javascript:void(0)"><i class="ti-menu"></i></a></li>
                    <li class="nav-item hidden-sm-down">
                        <form class="app-search p-l-20">
                            <input type="text" class="form-control"
                                   placeholder="Search for..."> <a class="srh-btn"><i
                                class="ti-search"></i></a>
                        </form>
                    </li>
                </ul>

                <!-- User profile and search -->

                <ul class="navbar-nav my-lg-0">
                    <li class="nav-item dropdown fa fa-reply"><a
                            class="nav-link dropdown-toggle text-muted waves-effect waves-dark"
                            href="/loginOut">LoginOut</a></li>
                </ul>
            </div>
        </nav>
    </header>

    <!-- End Topbar header -->


    <!-- Left Sidebar - style you can find in sidebar.scss  -->

    <aside class="left-sidebar"> <!-- Sidebar scroll-->
        <div class="scroll-sidebar">
            <!-- Sidebar navigation-->
            <nav class="sidebar-nav">
                <ul id="sidebarnav">
                    <li><a href="<%=basePath %>pagesProfile" class="waves-effect"><i
                            class="fa fa-user m-r-10" aria-hidden="true"></i>个人信息</a></li>
                    <li><a href="<%=basePath %>tableBasic" class="waves-effect"><i
                            class="fa fa-table m-r-10" aria-hidden="true"></i>用户管理</a></li>
                    <li><a href="<%=basePath %>tableBasic" class="waves-effect"><i
                            class="fa fa-table m-r-10" aria-hidden="true"></i>文字点位搜索</a></li>
                    <li><a href="<%=basePath %>map" class="wavesEffect"><i
                            class="fa fa-globe m-r-10" aria-hidden="true"></i>地图搜索点位信息</a></li>
                    <li><a href="<%=basePath %>pagesBlank" class="waves-effect"><i
                            class="fa fa-columns m-r-10" aria-hidden="true"></i>消息处理</a></li>
                    <li><a href="<%=basePath %>pagesBlank" class="waves-effect"><i
                            class="fa fa-columns m-r-10" aria-hidden="true"></i>组长管理</a></li>
                    <li><a href="<%=basePath %>pagesBlank" class="waves-effect"><i
                            class="fa fa-columns m-r-10" aria-hidden="true"></i>案件管理</a></li>
                    <li><a href="<%=basePath %>pagesBlank" class="waves-effect"><i
                            class="fa fa-columns m-r-10" aria-hidden="true"></i>点位处理</a></li>
                </ul>

            </nav>
            <!-- End Sidebar navigation -->
        </div>
        <!-- End Sidebar scroll--> </aside>

    <!-- End Left Sidebar - style you can find in sidebar.scss  -->


    <!-- Page wrapper  -->

    <div class="page-wrapper">

        <!-- Container fluid  -->

        <div class="container-fluid">

            <!-- Bread crumb and right sidebar toggle -->

            <div class="row page-titles">
                <div class="col-md-6 col-8 align-self-center">
                    <h3 class="text-themecolor m-b-0 m-t-0">Dashboard</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item active">Dashboard</li>
                    </ol>
                </div>

            </div>

            <!-- End Bread crumb and right sidebar toggle -->


            <!-- Start Page Content -->

            <!-- Row -->
            <div class="row">
                <!-- Column -->
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-block">
                            <h4 class="card-title">Daily Sales</h4>
                            <div class="text-right">
                                <h2 class="font-light m-b-0">
                                    <i class="ti-arrow-up text-success"></i> $120
                                </h2>
                                <span class="text-muted">Todays Income</span>
                            </div>
                            <span class="text-success">80%</span>
                            <div class="progress">
                                <div class="progress-bar bg-success" role="progressbar"
                                     style="width: 80%; height: 6px;" aria-valuenow="25"
                                     aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Column -->
                <!-- Column -->
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-block">
                            <h4 class="card-title">Weekly Sales</h4>
                            <div class="text-right">
                                <h2 class="font-light m-b-0">
                                    <i class="ti-arrow-up text-info"></i> $5,000
                                </h2>
                                <span class="text-muted">Todays Income</span>
                            </div>
                            <span class="text-info">30%</span>
                            <div class="progress">
                                <div class="progress-bar bg-info" role="progressbar"
                                     style="width: 30%; height: 6px;" aria-valuenow="25"
                                     aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Column -->
            </div>
            <!-- Row -->
            <!-- Row -->
            <div class="row">
                <!-- column -->
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-block">
                            <h4 class="card-title">Revenue Statistics</h4>
                            <div class="flot-chart">
                                <div class="flot-chart-content" id="flot-line-chart"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- column -->
            </div>
            <!-- Row -->
            <!-- Row -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-block">
                            <select class="custom-select pull-right">
                                <option selected>January</option>
                                <option value="1">February</option>
                                <option value="2">March</option>
                                <option value="3">April</option>
                            </select>
                            <h4 class="card-title">Projects of the Month</h4>
                            <div class="table-responsive m-t-40">
                                <table class="table stylish-table">
                                    <thead>
                                    <tr>
                                        <th colspan="2">Assigned</th>
                                        <th>Name</th>
                                        <th>Budget</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td style="width:50px;"><span class="round">S</span></td>
                                        <td>
                                            <h6>Sunil Joshi</h6>
                                            <small class="text-muted">Web
                                                Designer
                                            </small>
                                        </td>
                                        <td>Elite Admin</td>
                                        <td>$3.9K</td>
                                    </tr>
                                    <tr class="active">
                                        <td><span class="round"><img
                                                src="<%=basePath %>source/assets/images/users/2.jpg"
                                                alt="user" width="50"/></span></td>
                                        <td>
                                            <h6>Andrew</h6>
                                            <small class="text-muted">Project
                                                Manager
                                            </small>
                                        </td>
                                        <td>Real Homes</td>
                                        <td>$23.9K</td>
                                    </tr>
                                    <tr>
                                        <td><span class="round round-success">B</span></td>
                                        <td>
                                            <h6>Bhavesh patel</h6>
                                            <small class="text-muted">Developer</small>
                                        </td>
                                        <td>MedicalPro Theme</td>
                                        <td>$12.9K</td>
                                    </tr>
                                    <tr>
                                        <td><span class="round round-primary">N</span></td>
                                        <td>
                                            <h6>Nirav Joshi</h6>
                                            <small class="text-muted">Frontend
                                                Eng
                                            </small>
                                        </td>
                                        <td>Elite Admin</td>
                                        <td>$10.9K</td>
                                    </tr>
                                    <tr>
                                        <td><span class="round round-warning">M</span></td>
                                        <td>
                                            <h6>Micheal Doe</h6>
                                            <small class="text-muted">Content
                                                Writer
                                            </small>
                                        </td>
                                        <td>Helping Hands</td>
                                        <td>$12.9K</td>
                                    </tr>
                                    <tr>
                                        <td><span class="round round-danger">N</span></td>
                                        <td>
                                            <h6>Johnathan</h6>
                                            <small class="text-muted">Graphic</small>
                                        </td>
                                        <td>Digital Agency</td>
                                        <td>$2.6K</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Row -->
            <!-- Row -->
            <div class="row">
                <!-- Column -->
                <div class="col-lg-4">
                    <div class="card">
                        <img class="card-img-top img-responsive"
                             src="<%=basePath %>source/assets/images/big/img1.jpg" alt="Card">
                        <div class="card-block">
                            <ul class="list-inline font-14">
                                <li class="p-l-0">20 May 2016</li>
                                <li><a href="javascript:void(0)" class="link">3
                                    Comment</a></li>
                            </ul>
                            <h3 class="font-normal">Featured Hydroflora Pots Garden
                                &amp; Outdoors</h3>
                        </div>
                    </div>
                </div>
                <!-- Column -->
                <!-- Column -->
                <div class="col-lg-4">
                    <div class="card">
                        <img class="card-img-top img-responsive"
                             src="<%=basePath %>source/assets/images/big/img2.jpg" alt="Card">
                        <div class="card-block">
                            <ul class="list-inline font-14">
                                <li class="p-l-0">20 May 2016</li>
                                <li><a href="javascript:void(0)" class="link">3
                                    Comment</a></li>
                            </ul>
                            <h3 class="font-normal">Featured Hydroflora Pots Garden
                                &amp; Outdoors</h3>
                        </div>
                    </div>
                </div>
                <!-- Column -->
                <!-- Column -->
                <div class="col-lg-4">
                    <div class="card">
                        <img class="card-img-top img-responsive"
                             src="<%=basePath %>source/assets/images/big/img4.jpg" alt="Card">
                        <div class="card-block">
                            <ul class="list-inline font-14">
                                <li class="p-l-0">20 May 2016</li>
                                <li><a href="javascript:void(0)" class="link">3
                                    Comment</a></li>
                            </ul>
                            <h3 class="font-normal">Featured Hydroflora Pots Garden
                                &amp; Outdoors</h3>
                        </div>
                    </div>
                </div>
                <!-- Column -->
            </div>
            <!-- Row -->

            <!-- End PAge Content -->

        </div>

        <!-- End Container fluid  -->



    </div>

    <!-- End Page wrapper  -->

</div>

<!-- End Wrapper -->


<!-- All Jquery -->

<script src="<%=basePath %>/source/assets/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script
        src="<%=basePath %>/source/assets/plugins/bootstrap/js/tether.min.js"></script>
<script
        src="<%=basePath %>/source/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- slimscrollbar scrollbar JavaScript -->
<script src="<%=basePath %>/source/js/jquery.slimscroll.js"></script>
<!--Wave Effects -->
<script src="<%=basePath %>/source/js/waves.js"></script>
<!--Menu sidebar -->
<script src="<%=basePath %>/source/js/sidebarmenu.js"></script>
<!--stickey kit -->
<script
        src="<%=basePath %>/source/assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
<!--Custom JavaScript -->
<script src="<%=basePath %>/source/js/custom.min.js"></script>

<!-- This page plugins -->

<!-- Flot Charts JavaScript -->
<script src="<%=basePath %>/source/assets/plugins/flot/jquery.flot.js"></script>
<script
        src="<%=basePath %>/source/assets/plugins/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
<script src="<%=basePath %>/source/js/flot-data.js"></script>

<!-- Style switcher -->

<script
        src="<%=basePath %>/source/assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>

</body>

</html>
