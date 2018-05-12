<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
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
          href="<%=basePath%>source/assets/images/favicon.png">
    <title>普通用户案件管理</title>
    <!-- Bootstrap Core CSS -->
    <link
            href="<%=basePath%>source/assets/plugins/bootstrap/css/bootstrap.min.css"
            rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<%=basePath%>source/css/style.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="<%=basePath%>source/css/colors/megna.css" id="theme"
          rel="stylesheet">

    <link rel="stylesheet" href="<%=basePath %>/source/css/bootstrap-select.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>source/css/daterangepicker.css"/>
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
            <nav class="sidebar-nav ">
                <ul id="nav navbar-nav sidebarnav">
                    <li><a href="<%=basePath%>user/nodeText" class="waves-effect"><i
                            class="fa fa-table m-r-10" aria-hidden="true"></i>文字点位搜索</a>
                    </li>
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
                    <li><a href="javascript:void(0);" class="waves-effect"><i
                            class="fa fa-columns m-r-10" aria-hidden="true"></i>案件管理</a></li>
                    <li><a href="<%=basePath%>user/message" class="waves-effect"><i
                            class="fa fa-columns m-r-10" aria-hidden="true"></i>消息处理</a></li>

                    <li><a href="<%=basePath%>user/personInfo"
                           class="waves-effect"><i class="fa fa-user m-r-10" aria-hidden="true"></i>个人信息</a></li>


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
                    <h3 class="text-themecolor m-b-0 m-t-0">案件管理</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item active">案件管理</li>
                    </ol>
                </div>

            </div>

            <!-- End Bread crumb and right sidebar toggle -->


            <!-- Start Page Content -->

            <div class="row">
                <div class="col-sm-12">
                    <div class="hidden alert alert-warning alert-dismissible  in modify" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                            <span class="sr-only">Close</span>
                        </button>
                        <strong>修改成功!</strong> 案件已经更新。
                    </div>
                    <div class="hidden alert alert-warning alert-dismissible  in delete" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                            <span class="sr-only">Close</span>
                        </button>
                        <strong>删除成功!</strong>
                    </div>

                </div>
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-block">
                            <form id="searchForm">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group row">
                                            <label class="col-sm-2 form-control-label">案件名称</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="casename"
                                                       placeholder="案件名称">
                                            </div>
                                            <label class="col-sm-2 form-control-label">案件类型</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" placeholder="案件类型"
                                                       name="casetype">
                                            </div>

                                        </div>


                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group row">

                                            <label
                                                    class="col-sm-2 form-control-label">选择时间</label>
                                            <div class=" col-sm-10">
                                                <input id="daterange" type="text" class="form-control "
                                                       placeholder="选择起始时间和终止时间">
                                            </div>
                                            <input type="hidden" value="" id="beginTime">
                                            <input type="hidden" value="" id="endTime">
                                            <div class="col-sm-2"></div>
                                            <div class="col-sm-10" style="margin-top: 10px;">
                                                <input onclick="searchPage(1);" class="btn btn-info" value="搜索">
                                            </div>

                                        </div>
                                    </div>
                                </div>


                            </form>


                        </div>
                    </div>
                </div>
                <!-- column -->
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-block">
                            <h4 class="card-title">案件</h4>

                            <div>
                                <table class="table table-hover">
                                    <thead>
                                    <tr class="row">
                                        <th class="col-sm-1">#</th>
                                        <th class="col-sm-2">案件名称</th>
                                        <th class="col-sm-1">案件类型</th>
                                        <th class="col-sm-2">案件开始时间</th>
                                        <th class="col-sm-2">案件结束时间</th>
                                        <th class="col-sm-4">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="Table">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-12" id="Page">
                    <%--比较点位--%>

                </div>

                <div class="col-sm-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                比较案件
                                <a data-toggle="collapse" data-parent="#accordion"
                                   href="#compare" style="color:#0f1111;">
                                    <i class="fa  fa-angle-double-down m-l-10 pull-right"></i>
                                </a>

                            </h4>
                        </div>
                        <div id="compare" class="panel-collapse collapse ">
                            <div class="panel-body">
                                <div class="card-block">
                                    <div class="form-group row">

                                        <div class="col-sm-5">
                                            <button id="compute" class=" btn btn-success " type="button"
                                                    onclick="compareCase();"
                                            >计算相似度
                                            </button>
                                            <label class="form-control-label ">计算结果：</label>
                                            <span class=" form-control-label" id="result"></span>
                                            <span id="loading"></span>
                                        </div>


                                    </div>

                                    <div class="row">
                                        <div class="container col-sm-6">
                                            <div class="card" style="border: 1px solid rgba(0, 0, 0, 0.125)">
                                                <div class="card-block">
                                                    <form id="firstForm">
                                                        <div class="form-group">
                                                            <div class="form-group row">
                                                                <label class="col-sm-4 form-control-label">案件编号：</label>
                                                                <span class=" col-sm-4 form-control-label"
                                                                      id="firstCaseid"></span>
                                                                <div class="col-sm-4 ">
                                                                    <button type="button"
                                                                            class="btn btn-warning pull-right"
                                                                            onclick="removeCompare(1)">清除
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="form-group row">
                                                                <label class="col-sm-4 form-control-label">案件名称：</label>
                                                                <span class=" col-sm-8 form-control-label"
                                                                      id="firstCasename"></span>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <div class="form-group row">
                                                                <label class="col-sm-4 form-control-label">案件类型：</label>
                                                                <span class=" col-sm-8 form-control-label"
                                                                      id="firstCasetype"></span>
                                                            </div>
                                                        </div>


                                                        <div class="form-group row">

                                                            <label class="col-sm-12">案件信息:</label>
                                                            <div class="col-sm-12">
                                                                    <textarea rows="5"
                                                                              class="form-control form-control-line"
                                                                              id="firstDescription"></textarea>
                                                            </div>
                                                        </div>

                                                    </form>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="container col-sm-6">
                                            <div class="card" style="border: 1px solid rgba(0, 0, 0, 0.125)">
                                                <div class="card-block">
                                                    <form id="secondForm">

                                                        <div class="form-group row">
                                                            <label class="col-sm-4 form-control-label">案件编号：</label>
                                                            <span class=" col-sm-4 form-control-label"
                                                                  id="secondCaseid"></span>
                                                            <div class="col-sm-4 ">
                                                                <button type="button"
                                                                        class="btn btn-warning pull-right"
                                                                        onclick="removeCompare(2)">清除
                                                                </button>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="form-group row">
                                                                <label class="col-sm-4 form-control-label">案件名称：</label>
                                                                <span class=" col-sm-8 form-control-label"
                                                                      id="secondCasename"></span>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <div class="form-group row">
                                                                <label class="col-sm-4 form-control-label">案件类型：</label>
                                                                <span class=" col-sm-8 form-control-label"
                                                                      id="secondCasetype"></span>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-sm-12">案件信息:</label>
                                                            <div class="col-sm-12">
                                                                    <textarea rows="5"
                                                                              class="form-control form-control-line"
                                                                              id="secondDescription"></textarea>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--下面都是模态框--%>
                <div class="col-sm-12">
                    <div id="updateModel" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <form id="updateForm">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title" id="exampleModalLabel">具体信息</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                            <span class="sr-only">Close</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group row">
                                            <label class="col-sm-3 form-control-label">案件名称</label>
                                            <input id="casename" name="casename" type="text"
                                                   class="col-sm-8 form-control" placeholder="案件名称">
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 form-control-label">案件类型</label>
                                            <input id="casetype" name="casetype" type="text"
                                                   class="col-sm-8 form-control" placeholder="案件类型">
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-12">备注信息:</label>
                                            <div class="col-sm-12">
                                                <textarea id="description" rows="5"
                                                          class="form-control form-control-line"
                                                          name="description"></textarea>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default"
                                                data-dismiss="modal">关闭
                                        </button>
                                        <button type="button" class="btn btn-primary" id="updateButton"
                                                onclick="update($(this).val());">
                                            提交更改
                                        </button>
                                    </div>
                                </div><!-- /.modal-content -->
                            </form>
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                </div>
                <%--添加组员的操作--%>
                <div class="col-sm-12">
                    <div id="addGroupModel" class="modal fade" tabindex="-1" role="dialog"
                         aria-labelledby="myModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">设置组员</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                        <span class="sr-only">Close</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="col-sm-12">
                                        <div class="hidden alert alert-warning alert-dismissible  in modify"
                                             role="alert">
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                                <span class="sr-only">Close</span>
                                            </button>
                                            <strong>修改成功!</strong> 点位信息已经更改
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label class="col-sm-4 form-control-label">案件名称：</label>
                                        <label class="col-sm-4 form-control-label">测试</label>
                                    </div>
                                    <div class="form-group row">
                                        <label class="form-control-label col-sm-4 ">组员选择:</label>
                                        <select id="grouperSelect" name="userid"
                                                class="selectpicker col-sm-4"
                                                data-live-search="true">
                                        </select>
                                        <div class="col-sm-4">
                                            <button onclick="addGroupHtml($(this).val());"
                                                    class=" btn btn-success form-control"
                                                    id="addUserButton" type="button" class="close pull-left"
                                                    style="color:#fff">添加
                                            </button>
                                        </div>
                                    </div>
                                    <div id="addGrouperForm">

                                    </div>


                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default"
                                            data-dismiss="modal">关闭
                                    </button>
                                </div>
                            </div>
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                </div>
                <div class="col-sm-12">
                    <div id="deleteModel" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">提示</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                        <span class="sr-only">Close</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    确定删除？
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default"
                                            data-dismiss="modal">关闭
                                    </button>
                                    <button type="button" class="btn btn-primary" id="deleteButton"
                                            onclick="delete1($(this).val())">
                                        删除
                                    </button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                </div>

                <%--结束模态框--%>
            </div>

            <!-- End PAge Content -->

        </div>

        <!-- End Container fluid  -->


    </div>

    <!-- End Page wrapper  -->

</div>

<!-- End Wrapper -->


<!-- All Jquery -->

<script src="<%=basePath%>source/assets/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script
        src="<%=basePath%>source/assets/plugins/bootstrap/js/tether.min.js"></script>
<script
        src="<%=basePath%>source/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- slimscrollbar scrollbar JavaScript -->
<script src="<%=basePath%>source/js/jquery.slimscroll.js"></script>
<!--Wave Effects -->
<script src="<%=basePath%>source/js/waves.js"></script>
<!--Menu sidebar -->
<script src="<%=basePath%>source/js/sidebarmenu.js"></script>
<!--stickey kit -->
<script
        src="<%=basePath%>source/assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
<!--Custom JavaScript -->
<script src="<%=basePath%>source/js/custom.min.js"></script>


<script src="<%=basePath %>source/js/bootstrap-select.min.js"></script>

<script type="text/javascript" src="<%=basePath%>source/js/moment.min.js"></script>
<script type="text/javascript" src="<%=basePath%>source/js/daterangepicker.js"></script>

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
    Array.prototype.indexOf = function (val) {
        for (var i = 0; i < this.length; i++) {
            if (this[i].id == val.id)
                return i;
        }
        return -1;
    };
    Array.prototype.remove = function (val) {
        var index = this.indexOf(val);
        if (index > -1) {
            this.splice(index, 1);
        }
    };
    var caseGrouperArray = new Array();
    var DepartGrouper = new Array();

    function updateGrouper(caseId) {
        console.log(DepartGrouper)
        var str = "";
        $.each(caseGrouperArray, function (index, item) {
            str += "  <div class=\"form-group row\">\n" +
                "                                            <label class=\"form-control-label col-sm-4 \">组员" + (index + 1) + ":</label>\n" +
                "                                            <label class=\"form-control-label col-sm-4 \">" + item.username + "</label>\n" +
                "                                            <div class=\"col-sm-4\">\n" +
                "                                                <input type=\"button\" value=\"删除\" class=\" btn btn-danger form-control\"\n" +
                "                                                       onclick=\"removeTr($(this)," + item.id + ","+caseId+");\" style=\"color:#fff\">\n" +
                "                                            </div>\n" +
                "                                        </div>";


        });
        $('#addGrouperForm').html(str);
    }

    function updateSelectUser() {
        var str = '';
        $.each(DepartGrouper, function (index, item) {
            str += '<option value="' + item.userid + '">' + item.username + '</option>';
        })
        $('#grouperSelect').html(str);
        $('#grouperSelect').selectpicker('refresh');
        $('#grouperSelect').selectpicker('show');
    }

    function addGroupModel(caseId, groupid) {
        $.ajax({
            url: '<%=basePath%>user/caseAdmin/getGrouperByCaseId/' + caseId,
            type: "post",
            dataType: 'json',
            success: function (d) {
                caseGrouperArray = d.groupers;
                DepartGrouper = d.selectUsers;
                updateGrouper(caseId);
                updateSelectUser();
                $('#addGroupModel').modal('toggle');
                $('#addUserButton').val(groupid);
            },
            error: function (e) {
                console.log("失败");
            }
        });

    }

    //删除属性的一块
    function removeTr(object, groupuserId,caseId) {
        $.ajax({
            url: '<%=basePath%>user/caseAdmin/deleteUser/' + groupuserId+"/"+caseId,
            type: "post",
            dataType: 'json',
            success: function (d) {
                //需要更新一下caseGrouperArray和DepartGrouper
                var t = new Object();
                $.each(caseGrouperArray, function (index, item) {
                    if (item.id == groupuserId) {
                        t.userid = item.userid;
                        t.username = item.username;
                        t.id = item.id;
                        t.groupid = item.groupid;
                        return;
                    }
                });
                caseGrouperArray.remove(t);
                t.id = t.userid;
                t.groupid = null;
                DepartGrouper.push(t);
                updateGrouper();
                updateSelectUser();
            },
            error: function (e) {
                console.log("失败");
            }
        });

    }

    function addGroupHtml(groupid) {
        var groupUser = new Object();
        groupUser.groupid = groupid;
        groupUser.userid = $('#grouperSelect').val();
        $.ajax({
            url: '<%=basePath%>user/caseAdmin/addUser/',
            type: "post",
            dataType: 'json',
            data: {"groupid": groupid, "userid": $('#grouperSelect').val()},
            success: function (d) {
                d.grouper.username = $('#grouperSelect option:selected').text();
                console.log(d);
                caseGrouperArray.push(d.grouper);
                groupUser.id = $('#grouperSelect').val();
                DepartGrouper.remove(groupUser);
                updateGrouper();
                updateSelectUser();
            },
            error: function (e) {
                console.log("失败");
            }
        });

    }

    /*初始化参数*/
    var data = new Object();
    data.currentPage =${currentPage};
    data.totalPage =${totalPage};
    data.cases =${casesJson};
    updateTable(data);
    updatePage(data)
    var firstCase = null;
    var secondCase = null;

    //发送案件的id号过去，实现两个案件的信息具体的比较
    function compareCase() {
        if (firstCase != null && secondCase != null) {
            $.ajax({
                url: '<%=basePath%>user/caseAdmin/compute',
                type: "post",
                dataType: 'json',
                data: {'firstCaseid':  $('#firstCaseid').text(), 'secondCaseid':  $('#secondCaseid').text()},
                beforeSend: function (XMLHttpRequest) {
                    $("#loading").html("<i class=\"fa fa-spinner fa-spin\"></i>"); //在后台返回success之前显示loading图标
                },
                success: function (d) {
                    $("#loading").empty(); //ajax返回成功，清除loading图标
                    console.log("成功");
                    $('#result').text(d.result);
                    console.log(d);
                },
                error: function (e) {
                    console.log("失败");
                }
            });
        }
    }

    //表示下面的案件框，如果存在了案件，就为1，初始为0；
    var first = 0;
    var second = 0;

    function removeCompare(flag) {
        if (flag == 1) {
            $('#firstCaseid').text("");
            $('#firstCasename').text("");
            $('#firstCasetype').text("");
            $('#firstDescription').text("");
            first = 0;
            firstCaseId = null;
        }
        else {
            $('#secondCaseid').text("");
            $('#secondCasename').text("");
            $('#secondCasetype').text("");
            $('#secondDescription').text("");
            second = 0;
            secondCaseId = null;
        }
        check();
    }

    function addCaseCompare(caseid) {
        $.each(data.cases, function (index, item) {
            if (item.id == caseid) {
                if (first == 0) {
                    $('#firstCaseid').text(item.id);
                    $('#firstCasename').text(item.casename);
                    $('#firstCasetype').text(item.casetype);
                    $('#firstDescription').text(item.description);
                    firstCase = "" + item.description;
                    first = 1;
                }
                else if (second == 0) {
                    $('#secondCaseid').text(item.id);
                    $('#secondCasename').text(item.casename);
                    $('#secondCasetype').text(item.casetype);
                    $('#secondDescription').text(item.description);
                    secondCase = "" + item.description;
                    second = 1;
                }
            }
        });

        check();
    }
    check();
    function check() {
        console.log(first + "," + second);
        if ((first == null && second == null) || (first == 0 && second == 0)) {
            $('#compute').attr('disabled', 'true');
        }
        //检查一下是否满了，满了就设置按钮为不可使用
        if (first == 1 && second == 1) {
            $('#Table').find('.compare').attr('disabled', 'true');
            $('#compute').removeAttr('disabled');

        } else {
            $('#Table').find('.compare').removeAttr('disabled');
            $('#compute').attr('disabled', 'true');
        }
    }

    /*一下是关于更新的操作
        触发更新模态框*/
    function updateModel(id) {
        $.each(data.cases, function (index, item) {
            if (item.id == id) {
                $("#casename").val(item.casename);
                $("#casetype").val(item.casetype);
                $("#description").val(item.description);
                return false;
            }
        })
        $('#updateModel').modal('show');
        $('#updateButton').val(id);
    }

    /*发送更新某一个对象的ajax的请求*/
    function update(id) {
        if ($("#updateForm").validate().form()) {
            var form = new FormData($("#updateForm")[0]);
            form.append("id", id);
            $.ajax({
                url: '<%=basePath%>user/updateCase',
                type: "post",
                data: form,
                /* 执行执行的是dom对象 ，不需要转化信息*/
                processData: false,
                contentType: false,
                /* 指定返回类型为json */
                dataType: 'json',
                success: function (d) {
                    //更新data中case的内容，重新刷新一遍
                    $.each(data.cases, function (index, case1) {
                        if (case1.id == d.case1.id) {
                            case1.casename = d.case1.casename;
                            case1.casetype = d.case1.casetype;
                            case1.description = d.case1.description;
                        }
                    });
                    updateTable(data);
                    //更新模态框隐藏
                    $("#updateModel").modal("hide");
                    $(".modify").removeClass("hidden");
                },
                error: function (e) {
                    console.log("失败");
                }
            });

        }
        else {
            alert("请输入正确的格式");
        }

    }

    /*结束更新ajax请求*/
    /*异步接收数据之后更新表*/
    function updateTable(data) {
        var table = $("#Table");
        var str = "";

        if (data.cases.length != 0) {
            $.each(data.cases, function (index, item) {
                str += "<tr class='row'>";
                str += "<td class=\"col-sm-1\">" + (index + 1) + "</td>";
                str += "<td class=\"col-sm-2\">" + item.casename + "</td>";
                str += "<td class=\"col-sm-1\">" + item.casetype + "</td>";
                str += "<td class=\"col-sm-2\">" + item.begintime + "</td>";
                str += "<td class=\"col-sm-2\">" + item.endtime + "</td>";
                str += '<td class="col-sm-4">' +
                    '<button  onclick="addCaseCompare(' +
                    item.id +
                    ')" class="btn btn-success compare">添加比较</button>\n' +
                    '<button  onclick="deleteModel(' +
                    item.id +
                    ')" class="btn btn-danger">删除</button>\n' +
                    '<button  onclick="addGroupModel(' +
                    item.id +
                    ',' + item.groupid + ')" class="btn btn-success">设置组员</button>' +
                    ' <button onclick="updateModel(' +
                    item.id +
                    ');" class="btn btn-warning" >查看</button></td>';
                str += ' </tr>';
            });


        }
        table.html(str);
    }

    /*结束更新表*/


    /*更新页表*/
    function updatePage(data) {
        var currentPage = data.currentPage;
        var totalPage = data.totalPage;


        var s = " <ul class=\"pagination\"> ";
        if (currentPage == 1)
            s += "<li class='page-item disabled'><a class=\"page-link\" href='javascript:void(0) '>上一页</a></li>";
        else {
            s += "<li class=\"page-item\" ><a  class=\"page-link\" href='javascript:void(0)'rel=" + (currentPage - 1) + ">上一页</a></li>";
        }

        //如果总的页数在6页只能就可以这样
        if (totalPage <= 6) {
            for (var i = 1; i <= totalPage; i++) {
                if (currentPage == i) {
                    s += "<li class='page-item disabled' ><a class=\"page-link\" href='javascript:void(0)'>" + i + "</a></li>";
                } else {
                    s += "<li class=\"page-item\" ><a class=\"page-link\" href='javascript:void(0)'rel=" + i + ">" + i + "</a></li>";
                }
            }

        }
        //这个是页面大于6的时候
        else {
            var base = 0;
            if ((currentPage - 3 >= 0) && (currentPage + 3 <= totalPage))
                base = currentPage - 3;
            else if ((currentPage + 3) > totalPage) {

                base = totalPage - 6;

            }

            for (var i = base + 1; i <= base + 6; i++) {
                if (currentPage == i) {
                    s += "<li class='page-item disabled'><a class=\"page-link\" href='javascript:void(0)'>" + i + "</a></li>";
                } else {
                    s += "<li class=\"page-item\" ><a class=\"page-link\" href='javascript:void(0)'rel=" + i + ">" + i + "</a></li>";
                }
            }
        }

        if (currentPage >= totalPage)
            s += "<li class='page-item disabled'><a class=\"page-link\" href='javascript:void(0)'>下一页</a></li>";
        else {
            s += "<li class=\"page-item\" ><a  class=\"page-link\" href='javascript:void(0)'rel=" + (currentPage + 1) + ">下一页</a></li>";
        }

        s += "</ul>";
        $("#Page").html(s);

        $("#Page ul li a").bind('click', function () {
            var rel = $(this).attr("rel");
            window.history.pushState(null, null, "<%=basePath%>user/caseAdmin/" + rel);
            searchPage(rel);
        });
    }

    /*结束更新分页*/





    //地址栏变化
    window.addEventListener("popstate",
        function (e) {
            var link = location.pathname;
            var linkSplit = link.split('/').pop();
            searchPage(linkSplit);
        }
    );

    //按照页面，条件搜索
    function searchPage(rel) {
        var form = new FormData($('#searchForm')[0]);
        if ($('#beginTime').val() != '') {
            form.append('beginTime', $('#beginTime').val());
            form.append('endTime', $('#endTime').val());
        }
        $.ajax({
            url: '<%=basePath%>user/caseAdmin/' + rel,
            type: "post",
            data: form,
            /* 执行执行的是dom对象 ，不需要转化信息*/
            processData: false,
            contentType: false,
            /* 指定返回类型为json */
            dataType: 'json',
            success: function (d) {
                console.log(d);
                data = d;
                updateTable(d);
                updatePage(d);
            },
            error: function (e) {
                console.log("失败");
            }
        });

    }

    //触发删除模态框
    function deleteModel(id) {
        $('#deleteModel').modal('show');
        $('#deleteButton').val(id);

    }

    //发送删除某一个对象请求
    function delete1(id) {
        $.ajax({
            url: '<%=basePath%>user/deleteCase/' + id,
            type: "post",
            /* 执行执行的是dom对象 ，不需要转化信息*/
            processData: false,
            contentType: false,
            /* 指定返回类型为json */
            dataType: 'json',
            success: function (d) {
                $("#deleteModel").modal("hide");
                $(".delete").removeClass("hidden");
                searchPage(data.currentPage);
            },
            error: function (e) {
                console.log("失败");
            }
        });

    }

    $('#daterange').daterangepicker({
        timePicker: true,
        timePickerIncrement: 30,
        locale: {
            format: 'YYYY-MM-DD h:mm:ss'
        }
    }, function (start, end) {
        console.log('New date range selected: ' + start.format('YYYY-MM-DD h:mm:ss') + ' to ' + end.format('YYYY-MM-DD h:mm:ss'));
        $('#beginTime').val(start.format('YYYY-MM-DD h:mm:ss'));
        $('#endTime').val(end.format('YYYY-MM-DD h:mm:ss'));
    }).attr("readonly", "readonly");

    validateRule();

    function validateRule() {
        var rule = {
            onkeyup: function (element, event) {
                //去除左侧空格
                var value = this.elementValue(element).replace(/^\s+/g, "");
                $(element).val(value);
            },
            rules: {
                casename: {
                    required: true
                },
                casetype: {
                    required: true
                }
            },
            messages: {
                casename: {
                    required: "请输入案件名"
                },
                casetype: {
                    required: "请输入案件类型"
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
        $("#updateForm").validate(rule);
    }
</script>
</body>

</html>
