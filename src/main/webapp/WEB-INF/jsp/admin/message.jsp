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
    <title>管理员消息处理</title>
    <!-- Bootstrap Core CSS -->
    <link
            href="<%=basePath %>source/assets/plugins/bootstrap/css/bootstrap.min.css"
            rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<%=basePath %>source/css/style.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="<%=basePath %>source/css/colors/megna.css" id="theme"
          rel="stylesheet">
</head>

<body class="fix-header card-no-border">

<!-- Preloader - style you can find in spinners.css -->

<div class="preloader">
    <svg class="circular" viewBox="25 25 50 50">
        <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10"/>
    </svg>
</div>

<!-- Main wrapper - style you can find in pages.scss -->

<div id="main-wrapper">

    <!-- Topbar header - style you can find in pages.scss -->

    <header class="topbar">
        <nav class="navbar top-navbar navbar-toggleable-sm navbar-light">

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

    <aside class="left-sidebar">
        <!-- Sidebar scroll-->
        <div class="scroll-sidebar">
            <!-- Sidebar navigation-->
            <nav class="sidebar-nav ">
                <ul id="nav navbar-nav sidebarnav">
                    <li><a href="<%=basePath%>admin/nodeText" class="waves-effect"><i
                            class="fa fa-table m-r-10" aria-hidden="true"></i>文字点位搜索</a>
                    </li>
                    <li><a href="<%=basePath%>admin/nodeMap" class="wavesEffect"><i
                            class="fa fa-globe m-r-10" aria-hidden="true"></i>地图搜索点位信息</a></li>
                    <li><a href="#" data-toggle="collapse" data-target="#submenu1"><i
                            class="fa   fa-cog  "></i> <span>点位助手</span><i
                            class="fa  fa-angle-double-down m-l-10 "></i></a>
                        <ul id="submenu1" class="collapse">
                            <c:if test="${user.roleid == 3}">
                                <li><a href="<%=basePath%>admin/nodeType" class="wavesEffect"><i
                                        class="fa fa-folder m-r-10" aria-hidden="true"></i>点位类型管理</a></li>
                            </c:if>

                            <li><a href="<%=basePath%>admin/nodeReplace" class="wavesEffect"><i
                                    class="fa fa-file-text m-r-10" aria-hidden="true"></i>点位替换处理</a></li>
                        </ul>
                    </li>

                    <li><a href="<%=basePath%>admin/caseAdmin" class="waves-effect"><i
                            class="fa fa-columns m-r-10" aria-hidden="true"></i>案件管理</a></li>
                    <li><a href="<%=basePath%>admin/userAdmin" class="waves-effect"><i
                            class="fa fa-address-book m-r-10" aria-hidden="true"></i>用户管理</a></li>
                    <c:if test="${user.roleid != 3}">

                        <li><a href="javascript:void(0);" class="waves-effect"><i
                                class="fa fa-columns m-r-10" aria-hidden="true"></i>消息处理</a></li>
                    </c:if>
                    <li><a href="<%=basePath%>admin/personInfo"
                           class="waves-effect"><i class="fa fa-user m-r-10" aria-hidden="true"></i>个人信息</a></li>


                </ul>

            </nav>
            <!-- End Sidebar navigation -->
        </div>
        <!-- End Sidebar scroll-->
    </aside>

    <!-- End Left Sidebar - style you can find in sidebar.scss  -->


    <!-- Page wrapper  -->

    <div class="page-wrapper">

        <!-- Container fluid  -->

        <div class="container-fluid">

            <!-- Bread crumb and right sidebar toggle -->

            <div class="row page-titles">
                <div class="col-md-6 col-8 align-self-center">
                    <h3 class="text-themecolor m-b-0 m-t-0">消息处理</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item active">消息处理</li>
                    </ol>
                </div>

            </div>

            <div class="row">
                <c:if test="${flag == 0}">
                    <div class="col-sm-12">
                        <div class="hidden alert alert-warning alert-dismissible  in modify" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                                <span class="sr-only">Close</span>
                            </button>
                            <strong>发送成功!</strong>
                        </div>
                    </div>
                </c:if>
                <c:if test="${flag == 1}">
                    <div class="col-sm-12">
                        <div class="hidden alert alert-warning alert-dismissible  in delete" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                                <span class="sr-only">Close</span>
                            </button>
                            <strong>删除成功!</strong>
                        </div>
                    </div>
                </c:if>
                <c:if test="${user.roleid == 4}">
                    <div class="col-sm-12">
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a href="<%=basePath%>admin/message"
                                   class='nav-link <c:if test="${flag == 0}">active</c:if>' rel="self">本部门消息</a>
                            </li>
                            <li class="nav-item">
                                <a href="<%=basePath%>admin/message/superAdmin"
                                   class="nav-link <c:if test='${flag == 1}'>active </c:if> "
                                   rel="superAdmin">超级管理员回复消息</a>
                            </li>
                        </ul>
                    </div>
                </c:if>


                <c:if test='${flag == 0}'>
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-block">
                                <h4 class="card-title">消息</h4>

                                <div>
                                    <table class="table table-hover">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>关于案件</th>
                                            <th>案件编号</th>
                                            <th>请求人</th>
                                            <th>请求时间</th>
                                            <th>请求消息内容</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody id="Table">
                                        <c:forEach items="${messages}" var="item" varStatus="status">
                                            <tr>
                                                <td>${status.index+1}</td>
                                                <td>${item.casename}</td>
                                                <td>${item.casecode}</td>
                                                <td>${item.username}</td>
                                                <td>${item.submittime}</td>
                                                <td>${item.content}</td>
                                                <td>
                                                    <button class="btn btn-warning"
                                                            onclick="updateModel(${item.id});">回复
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>

                <c:if test='${flag == 1}'>
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-block">
                                <h4 class="card-title">消息</h4>

                                <div>
                                    <table class="table table-hover">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>关于案件</th>
                                            <th>案件编号</th>
                                            <th>回复时间</th>
                                            <th>回复消息内容</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody id="Table">
                                        <c:forEach items="${messages}" var="item" varStatus="status">
                                            <tr>
                                                <td>${status.index+1}</td>
                                                <td>${item.casename}</td>
                                                <td>${item.casecode}</td>
                                                <td>${item.replytime}</td>
                                                <td>${item.replyconten}</td>
                                                <td>
                                                    <button class="btn btn-warning"
                                                            onclick="deleteModel(${item.id});">删除
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>

                <div class="col-sm-12" id="Page">
                </div>
                <%--模态框--%>
                <c:if test='${flag == 0}'>
                    <div class="col-sm-12">
                        <div class="modal fade" id="updateModel" tabindex="-1" role="dialog"
                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog " role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">回复信息</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                            <span class="sr-only">Close</span>
                                        </button>
                                    </div>
                                    <form id="updateForm">
                                        <div class="modal-body ">
                                            <label class="form-control-label">消息内容:</label>
                                            <div>
                                                <textarea rows="5" class="form-control form-control-line"
                                                          name="replyconten"></textarea>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close
                                            </button>
                                            <button type="button" class="btn btn-primary" id="updateButton"
                                                    onclick="update($(this).val());">发送
                                            </button>
                                        </div>

                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
                <c:if test='${flag == 1}'>
                    <div class="col-sm-12">
                        <div id="deleteModel" class="modal fade" tabindex="-1" role="dialog"
                             aria-labelledby="myModalLabel"
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
                </c:if>
                <%--end模态框，展示具体点位--%>
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
<script src="<%=basePath%>source/assets/plugins/bootstrap/js/tether.min.js"></script>
<script src="<%=basePath%>source/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- slimscrollbar scrollbar JavaScript -->
<script src="<%=basePath%>source/js/jquery.slimscroll.js"></script>
<!--Wave Effects -->
<script src="<%=basePath%>source/js/waves.js"></script>
<!--Menu sidebar -->
<script src="<%=basePath%>source/js/sidebarmenu.js"></script>
<!--stickey kit -->
<script src="<%=basePath%>source/assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
<!--Custom JavaScript -->
<script src="<%=basePath%>source/js/custom.min.js"></script>
<script type="text/javascript">
    <c:if test="${flag == 0}">
    /*初始化参数*/
    var data = new Object();
    data.currentPage =${currentPage};
    data.totalPage =${totalPage};
    data.messages =${messagesJson};
    var start = 1;
    $(function () {
        updatePage(data);
    })

    /*一下是关于更新的操作
       触发更新模态框*/
    function updateModel(id) {

        $('#updateModel').modal('show');
        $('#updateButton').val(id);
    }

    /*发送更新某一个对象的ajax的请求*/
    function update(id) {
        var form = new FormData($("#updateForm")[0]);
        form.append("id", id);
        $.ajax({
            url: '<%=basePath%>admin/message/updateMessage',
            type: "post",
            data: form,
            /* 执行执行的是dom对象 ，不需要转化信息*/
            processData: false,
            contentType: false,
            /* 指定返回类型为json */
            dataType: 'json',
            success: function (d) {
                $("#updateModel").modal("toggle");
                $(".modify").removeClass("hidden");
                searchPage(start);
            },
            error: function (e) {
                console.log("失败");
            }
        });

    }

    /*结束更新ajax请求*/
    /*异步接收数据之后更新表*/
    function updateTable(data) {
        var table = $("#Table");
        var str = "";
        if (data.messages.length != 0) {
            $.each(data.messages, function (index, item) {
                str += "<tr>";
                str += "<td>" + (index + 1) + "</td>";
                str += "<td>" + item.casename + "</td>";
                str += "<td>" + item.casecode + "</td>";
                str += "<td>" + item.username + "</td>";
                str += "<td>" + item.submittime + "</td>";
                str += "<td>" + item.content + "</td>";
                str += '<td> <button class="btn btn-warning" onclick="updateModel(' + item.id + ')"> 回复 </button> </td>';
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
            window.history.pushState(null, null, "<%=basePath%>admin/message/" + rel);
            searchPage(rel);
        });
    }

    /*结束更新分页*/
    //按照页面，条件搜索
    function searchPage(rel) {
        var form = new FormData($('#searchForm')[0]);

        $.ajax({
            url: '<%=basePath%>admin/message/' + rel,
            type: "post",
            data: form,
            /* 执行执行的是dom对象 ，不需要转化信息*/
            processData: false,
            contentType: false,
            /* 指定返回类型为json */
            dataType: 'json',
            success: function (d) {
                data = d;
                start=d.currentPage;
                updateTable(d);
                updatePage(d);
            },
            error: function (e) {
                console.log("失败");
            }
        });

    }

    </c:if>
    <c:if test="${flag == 1}">
    /*初始化参数*/
    var start = 1;

    //触发删除模态框
    function deleteModel(id) {
        $('#deleteModel').modal('toggle');
        $('#deleteButton').val(id);

    }

    //发送删除某一个对象请求
    function delete1(id) {
        $.ajax({
            url: '<%=basePath%>admin/message/superAdmin/deleteMessage',
            type: "post",
            dataType: 'json',
            data: {'Id': id},
            success: function (d) {
                $("#deleteModel").modal("toggle");
                $(".delete").removeClass("hidden");
                searchPage(start);
            },
            error: function (e) {
                console.log("失败");
            }
        });

    }

    /*结束更新ajax请求*/
    /*异步接收数据之后更新表*/
    function updateTable(data) {
        var table = $("#Table");
        var str = "";
        if (data.messages.length != 0) {
            $.each(data.messages, function (index, item) {
                str += "<tr>";
                str += "<td>" + (index + 1) + "</td>";
                str += "<td>" + item.casename + "</td>";
                str += "<td>" + item.casecode + "</td>";
                str += "<td>" + item.replytime + "</td>";
                str += "<td>" + item.replyconten + "</td>";
                str += '<td> <button class="btn btn-warning" onclick="deleteModel(' + item.id + ')"> 删除 </button> </td>';
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
            window.history.pushState(null, null, "<%=basePath%>admin/message/superAdmin/" + rel);
            searchPage(rel);
        });
    }

    /*结束更新分页*/
    //按照页面，条件搜索
    function searchPage(rel) {
        var form = new FormData($('#searchForm')[0]);

        $.ajax({
            url: '<%=basePath%>admin/message/superAdmin/' + rel,
            type: "post",
            data: form,
            /* 执行执行的是dom对象 ，不需要转化信息*/
            processData: false,
            contentType: false,
            /* 指定返回类型为json */
            dataType: 'json',
            success: function (d) {
                data = d;
                start = d.currentPage;
                updateTable(d);
                updatePage(d);
            },
            error: function (e) {
                console.log("失败");
            }
        });

    }

    </c:if>

</script>
</body>

</html>
