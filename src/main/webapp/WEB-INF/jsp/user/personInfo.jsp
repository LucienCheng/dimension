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
    <title>普通用户个人信息管理</title>
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
                            <li><a href="<%=basePath%>user/nodeReplace" class="wavesEffect"><i
                                    class="fa fa-file-text m-r-10" aria-hidden="true"></i>点位替换处理</a></li>
                        </ul>
                    </li>
                    <li><a href="<%=basePath%>user/caseAdmin" class="waves-effect"><i
                            class="fa fa-columns m-r-10" aria-hidden="true"></i>案件管理</a></li>
                    <li><a href="<%=basePath%>user/message" class="waves-effect"><i
                            class="fa fa-columns m-r-10" aria-hidden="true"></i>消息处理</a></li>
                    <li><a href="javascript:void(0);" class="waves-effect"><i
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
                    <h3 class="text-themecolor m-b-0 m-t-0">个人信息修改</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item active">个人信息修改</li>
                    </ol>
                </div>

            </div>

            <!-- End Bread crumb and right sidebar toggle -->


            <!-- Start Page Content -->

            <!-- Row -->
            <div class="row">
                <div class="col-sm-12" id="alert">
                    <div class="hidden alert alert-warning alert-dismissible  in modify" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                            <span class="sr-only">Close</span>
                        </button>
                        <strong>修改成功!</strong> 用户已经更新。
                    </div>
                </div>
            </div>
            <div class="row">
                <!-- Column -->
                <div class="col-lg-4 col-xlg-3 col-md-5">
                    <div class="card">
                        <div class="card-block">
                            <form class="form-horizontal form-material">
                                <div class="form-group">
                                    <label class="col-sm-12">所在的部门：</label>
                                    <div class="col-sm-12">
                                        <span class="form-control form-control-line">${user.department.departmentname}</span>

                                    </div>


                                </div>

                                <div class="form-group">
                                    <label class="col-sm-12">角色：</label>
                                    <div class="col-sm-12">
                                        <span class="form-control form-control-line">${user.rolename}</span>

                                    </div>

                                </div>
                                <div class="form-group">
                                    <label class="col-sm-12">生成时间：</label>
                                    <div class="col-sm-12">
                                        <span class="form-control form-control-line">${user.generatortime}</span>

                                    </div>

                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">身份证号：</label>
                                    <div class="col-sm-12">
                                        <span class="form-control form-control-line">${user.identityid}</span>

                                    </div>

                                </div>
                            </form>
                        </div>

                    </div>
                </div>


                <!-- Column -->
                <div class="col-lg-8 col-xlg-9 col-md-7">
                    <div class="card">
                        <div class="card-block">
                            <form class="form-horizontal form-material" id="personInfo">
                                <div class="form-group">
                                    <label class="col-md-12">用户名：</label>
                                    <div class="col-md-12">
                                        <input type="text" placeholder="张三" name="username" id="username"
                                               class="form-control form-control-line" value="${user.username}">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-12">密码：</label>
                                    <div class="col-md-12">
                                        <input type="password" placeholder="123456" name="password" id="password"
                                               class="form-control form-control-line  form-control-success"
                                               value="${user.password}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">确认密码：</label>
                                    <div class="col-md-12">
                                        <input type="password" placeholder="123456" id="repassword"
                                               class="form-control form-control-line" value="${user.password}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">备注信息</label>
                                    <div class="col-md-12">
                                        <textarea rows="5" class="form-control form-control-line"
                                                  disabled>${user.description}</textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <input class="btn btn-success" onclick="sendModify()" value="更改">
                                    </div>
                                </div>
                                <input type="hidden" value="${user.id}" name="id">
                                <input type="hidden" value="${user.identityid}" name="identityid">
                            </form>
                        </div>

                    </div>
                </div>
            </div>
            <!-- Column -->
        </div>
        <!-- Row -->

        <!-- End PAge Content -->

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


<script src="<%=basePath %>/source/js/jquery.validate.js"></script>
<script src="<%=basePath %>/source/js/additional-methods.js"></script>
<script src="<%=basePath %>/source/js/messages_zh.js"></script>
</body>
<style>
    .error {
        color: red;
    }
</style>
<script type="text/javascript">


    $("#repassword").keyup(function () {

        if ($(this).val() != $('#password').val()) {
            console.log("anxia");
            $("#repassword").removeProp("style");
            $("#repassword").prop("style","background-image:linear-gradient(#d02a2a, #d02a2a), linear-gradient(#d02a2a, #d02a2a)");
        }
        else {
            $("#repassword").removeProp("style");
            $("#repassword").prop("style","background-image:linear-gradient(#009efb, #009efb), linear-gradient(#d9d9d9, #d9d9d9)");
        }

    });
    $("#repassword").focus(function () {

        if ($(this).val() != $('#password').val()) {
            console.log("anxia");
            $("#repassword").removeProp("style");
            $("#repassword").prop("style","background-image:linear-gradient(#d02a2a, #d02a2a), linear-gradient(#d02a2a, #d02a2a)");
        }
        else {
            $("#repassword").removeProp("style");
            $("#repassword").prop("style","background-image:linear-gradient(#009efb, #009efb), linear-gradient(#d9d9d9, #d9d9d9)");
        }

    });
    function sendModify() {
        var validator = $("#personInfo").validate();
        var flag = validator.form();
        if (flag){
            if ($("#repassword").val() == $("#password").val()) {
                var form = new FormData(document.getElementById("personInfo"));

                $.ajax({
                    url: '/user/personInfoModify',
                    type: "post",
                    data: form,
                    /* 执行执行的是dom对象 ，不需要转化信息*/
                    processData: false,
                    contentType: false,
                    /* 指定返回类型为json */
                    dataType: 'json',
                    success: function (data) {
                        $("#username").val(data.username);
                        $("#password").val(data.password);
                        $(".modify").removeClass('hidden');
                        $("#alert").append(" <div class=\"hidden alert alert-warning alert-dismissible  in modify\" role=\"alert\">\n" +
                            "                        <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n" +
                            "                            <span aria-hidden=\"true\">&times;</span>\n" +
                            "                            <span class=\"sr-only\">Close</span>\n" +
                            "                        </button>\n" +
                            "                        <strong>修改成功!</strong> 用户已经更新。\n" +
                            "                    </div>");
                    },
                    error: function (e) {
                        console.log("失败");
                    }
                });
            }

        }
        else {
            alert("请输入正确的格式");
        }

    }
    $.validator.addMethod("checkPwd",function(value,element,params){
        var checkPwd = /^\w{6,16}$/g;
        return this.optional(element)||(checkPwd.test(value));
    },"只允许6-16位英文字母、数字或者下画线！");
    validateRule();
    function validateRule() {
        var rule = {
            onkeyup: function(element, event) {
                //去除左侧空格
                var value = this.elementValue(element).replace(/^\s+/g, "");
                $(element).val(value);
            },
            rules: {
                password: {
                    checkPwd: true
                },
                username: {
                    required: true
                },
                repassword: {
                    equalTo: password
                },

            },
            messages: {
                username: {
                    required: "请输入用户名"
                },
                repassword: {
                    equalTo: "两次输入的不一样"
                }
            },
            errorPlacement: function (error, element) { //指定错误信息位置
                if (element.is('select')) { //如果是radio或checkbox
                    error.appendTo(element.parent().parent()); //将错误信息添加当前元素的父元素的父元素后面
                } else {
                    error.insertAfter(element);
                }
            }
        };
        $("#personInfo").validate(rule);
    }

</script>
</body>

</html>
