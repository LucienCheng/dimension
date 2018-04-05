<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
          href="<%=basePath %>source/assets/images/favicon.png">
    <title>管理员点位替换</title>
    <!-- Bootstrap Core CSS -->
    <link
            href="<%=basePath %>source/assets/plugins/bootstrap/css/bootstrap.min.css"
            rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<%=basePath %>source/css/style.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="<%=basePath %>source/css/colors/megna.css" id="theme"
          rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

</head>

<body class="fix-header card-no-border">

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
                <a class="navbar-brand" href="/index">
                    <img src="<%=basePath %>source/logo.jpg"
                         alt="homepage" style="width:240px;height:71.8px"/>
                    </b> <span> </span>
                </a>
            </div>

            <!-- End Logo -->
            <div class="navbar-collapse">

                <!-- toggle and nav items -->


                <!-- User profile and search -->

                <ul class="navbar-nav ml-auto my-lg-0">
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
                    <li><a href="<%=basePath%>user/nodeText" class="waves-effect"><i
                            class="fa fa-table m-r-10" aria-hidden="true"></i>文字点位搜索</a></li>
                    <li><a href="<%=basePath%>user/nodeMap" class="wavesEffect"><i
                            class="fa fa-globe m-r-10" aria-hidden="true"></i>地图搜索点位信息</a></li>
                    <li><a href="#" data-toggle="collapse" data-target="#submenu1"><i
                            class="fa   fa-cog  "></i> <span>点位助手</span><i
                            class="fa  fa-angle-double-down m-l-10 "></i></a>
                        <ul id="submenu1" class="collapse">
                            <li><a href="<%=basePath%>user/nodeCompare" class="wavesEffect"><i
                                    class="fa fa-clipboard m-r-10" aria-hidden="true"></i>点位比较服务</a></li>
                            <li><a href="javascript:void(0);" class="wavesEffect"><i
                                    class="fa fa-file-text m-r-10" aria-hidden="true"></i>点位替换处理</a></li>
                        </ul>
                    </li>
                    <li><a href="<%=basePath%>user/caseAdmin" class="waves-effect"><i
                            class="fa fa-columns m-r-10" aria-hidden="true"></i>案件管理</a></li>
                    <li><a href="<%=basePath%>user/message" class="waves-effect"><i
                            class="fa fa-columns m-r-10" aria-hidden="true"></i>消息处理</a></li>
                    <li><a href="<%=basePath%>user/personInfo" class="waves-effect"><i
                            class="fa fa-user m-r-10" aria-hidden="true"></i>个人信息</a></li>
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
                    <h3 class="text-themecolor m-b-0 m-t-0">基本点位替换</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item active">基本点位替换</li>
                    </ol>
                </div>

            </div>

            <!-- End Bread crumb and right sidebar toggle -->


            <!-- Start Page Content -->

            <div class="card">
                <div class="card-block">
                    <div class="row" style="margin-bottom: 15px;">

                        <div class="form-group  col-sm-2">
                        <select class="form-control c-select">
                            <option selected>基本点选择</option>
                            <option value="1">基本点1</option>
                            <option value="2">基本点2</option>
                            <option value="3">基本点3</option>
                        </select>
                        </div>
                        <div class="col-sm-8">
                            <input class=" btn btn-success " type="button" value="计算相似度"
                                   style="margin-left: 15px;">

                            <label class="form-control-label col-sm-2">计算结果：</label>
                            <span class=" form-control-label col-sm-2">80%</span>
                        </div>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="container col-sm-6">
                    <div class="card">
                        <div class="card-block">
                            <form class="form-horizontal ">
                                <div class="form-group row">
                                    <label class="col-sm-4 form-control-label">经度：</label>
                                    <span class=" col-sm-8 form-control-label">110.000</span>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 form-control-label">纬度：</label>
                                    <span class=" col-sm-8 form-control-label">110.000</span>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 form-control-label">基本点位名称：</label>
                                    <span class=" col-sm-8 form-control-label">岳麓区大学城</span>

                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 form-control-label">基本点位地址：</label>
                                    <span class=" col-sm-8 form-control-label">天马公寓</span>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-4 form-control-label">基本点位类型：</label>
                                    <span class=" col-sm-8 form-control-label">atm</span>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-4 form-control-label">基本点描述：</label>
                                    <span class=" col-sm-8 form-control-label">发生于。。。。</span>
                                </div>

                                <div class="form-group">
                                    <input class=" btn btn-info" type="button" value="查看详细信息">
                                        <input class=" btn btn-warning " type="button" value="提交更改"
                                               style="margin-left: 15px;">
                                </div>

                            </form>
                        </div>

                    </div>
                </div>
                <div class="container col-sm-6">
                    <div class="card">
                        <div class="card-block">
                            <form class="form-horizontal ">

                                <div class="form-group row">
                                    <label class="col-sm-4 form-control-label">经度：</label>
                                    <span class=" col-sm-8 form-control-label">110.000</span>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 form-control-label">纬度：</label>
                                    <span class=" col-sm-8 form-control-label">110.000</span>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 form-control-label">基本点位名称：</label>
                                    <span class=" col-sm-8 form-control-label">岳麓区大学城</span>

                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 form-control-label">基本点位地址：</label>
                                    <span class=" col-sm-8 form-control-label">天马公寓</span>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 form-control-label">基本点位类型：</label>
                                    <span class=" col-sm-8 form-control-label">atm</span>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-4 form-control-label">基本点描述：</label>
                                    <span class=" col-sm-8 form-control-label">发生于。。。。</span>
                                </div>

                                <div class="form-group">
                                    <input class=" btn btn-info" type="button" value="查看详细信息">
                                </div>

                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- End Page wrapper  -->

</div>

<!-- End Wrapper -->


<!-- All Jquery -->

<script src="<%=basePath %>source/assets/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script
        src="<%=basePath %>source/assets/plugins/bootstrap/js/tether.min.js"></script>
<script
        src="<%=basePath %>source/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- slimscrollbar scrollbar JavaScript -->
<script src="<%=basePath %>source/js/jquery.slimscroll.js"></script>
<!--Wave Effects -->
<script src="<%=basePath %>source/js/waves.js"></script>
<!--Menu sidebar -->
<script src="<%=basePath %>source/js/sidebarmenu.js"></script>
<!--stickey kit -->
<script
        src="<%=basePath %>source/assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
<!--Custom JavaScript -->
<script src="<%=basePath %>source/js/custom.min.js"></script>

<!-- Style switcher -->

<script
        src="<%=basePath %>source/assets/plugins/style/switcher/jQuery.style.switcher.js"></script>
</body>

</html>
