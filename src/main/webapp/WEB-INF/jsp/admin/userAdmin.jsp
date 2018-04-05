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
    <title>管理员用户管理</title>
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
                    <li><a href="<%=basePath%>admin/nodeText" class="waves-effect"><i
                            class="fa fa-table m-r-10" aria-hidden="true"></i>文字点位搜索</a></li>
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
                            <li><a href="<%=basePath%>admin/nodeCompare" class="wavesEffect"><i
                                    class="fa fa-clipboard m-r-10" aria-hidden="true"></i>点位比较服务</a></li>
                            <li><a href="<%=basePath%>admin/nodeReplace" class="wavesEffect"><i
                                    class="fa fa-file-text m-r-10" aria-hidden="true"></i>点位替换处理</a></li>
                        </ul>
                    </li>
                    <li><a href="<%=basePath%>admin/caseAdmin" class="waves-effect"><i
                            class="fa fa-columns m-r-10" aria-hidden="true"></i>案件管理</a></li>
                    <li><a href="javascript:void(0);" class="waves-effect"><i
                            class="fa fa-address-book m-r-10" aria-hidden="true"></i>用户管理</a></li>
                    <c:if test="${user.roleid != 3}">

                        <li><a href="<%=basePath%>admin/message" class="waves-effect"><i
                                class="fa fa-columns m-r-10" aria-hidden="true"></i>消息处理</a></li>
                    </c:if>

                    <li><a href="<%=basePath%>admin/personInfo"
                           class="waves-effect"><i class="fa fa-user m-r-10"
                                                   aria-hidden="true"></i>个人信息</a></li>
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
                    <h3 class="text-themecolor m-b-0 m-t-0">用户管理</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item active">用户管理</li>
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
                        <strong>修改成功!</strong> 用户已经更新。
                    </div>
                    <div class="hidden alert alert-warning alert-dismissible  in delete" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                            <span class="sr-only">Close</span>
                        </button>
                        <strong>删除成功!</strong>
                    </div>
                    <div class="hidden alert alert-warning alert-dismissible  in add" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                            <span class="sr-only">Close</span>
                        </button>
                        <strong>添加成功!</strong>
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-block">
                            <form id="userCondition">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group row">
                                            <label class="col-sm-2 form-control-label">部门名称</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="department"
                                                       placeholder="部门名称">
                                            </div>
                                            <div class="col-sm-2"></div>
                                            <div class="col-sm-10">
                                                <input onclick="addModal()" class="btn btn-info" value="添加">
                                            </div>
                                        </div>


                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group row">
                                            <label class="col-sm-2 form-control-label">用户名</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" placeholder="用户名"
                                                       name="username">
                                            </div>
                                            <div class="col-sm-2"></div>
                                            <div class="col-sm-10">
                                                <input onclick="sendAjaxPage(1)" class="btn btn-info" value="搜索">
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
                            <h4 class="card-title">点位</h4>

                            <div >
                                <table class="table table-hover">
                                    <thead>
                                    <tr class="row">
                                        <th class="col-sm-2">#</th>
                                        <th class="col-sm-2">用户名</th>
                                        <th class="col-sm-3">用户身份证</th>
                                        <th class="col-sm-3">部门</th>
                                        <th class="col-sm-2">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="Table">
                                    <c:forEach items="${users}" var="user" varStatus="status">
                                        <tr class="row">
                                            <td class="col-sm-2">${status.index+1}</td>
                                            <td class="col-sm-2">${user.username}</td>
                                            <td class="col-sm-3">${user.identityid}</td>
                                            <td class="col-sm-3">${user.department.departmentname}</td>
                                            <td class="col-sm-2">
                                                <button type="submit" class="btn btn-danger"
                                                        onclick="deletePerson(${user.id})">删除
                                                </button>
                                                <button type="submit" class="btn btn-warning"
                                                        onclick="personInfo(${user.id});">查看
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
                <div class="col-sm-12" id="Page">
                </div>

                <%--下面都是模态框--%>
                <div class="col-sm-12">
                    <div id="personInfo" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <form id="updateUserForm">
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
                                            <label class=" col-sm-3 form-control-label">用户名</label>
                                            <input id="infoUsername" name="username" type="text"
                                                   class="form-control col-sm-8" placeholder="用户名">
                                        </div>
                                        <div class="form-group row">
                                            <label class=" form-control-label col-sm-3">密码</label>
                                            <input id="infoPassword" name="password" type="text"
                                                   class="form-control col-sm-8" placeholder="密码">
                                        </div>
                                        <div class="form-group row">
                                            <label class="form-control-label col-sm-3 ">角色选择:</label>
                                            <select class=" form-control c-select col-sm-8 " id="updateRoleid" name="roleid">
                                                <option value="2" selected>普通用户</option>
                                                <option value="4">部门管理员</option>
                                            </select>
                                        </div>
                                        <div class="hidden row" id="updateDepartment">
                                            <label class="form-control-label col-sm-3 ">部门选择:</label>
                                            <select class="form-control c-select col-sm-8" id="updateDepartmentid"
                                                    name="departmentid">
                                            </select>

                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default"
                                                data-dismiss="modal">关闭
                                        </button>
                                        <button type="button" class="btn btn-primary" id="update"
                                                onclick=" updateUser($(this).val());">
                                            提交更改
                                        </button>
                                    </div>
                                </div><!-- /.modal-content -->
                            </form>
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                </div>
                <div class="col-sm-12">
                    <div id="deletePerson" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
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
                                    <button type="button" class="btn btn-primary" id="delete"
                                            onclick="deleteUser($(this).val())">
                                        删除
                                    </button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                </div>
                <div class="col-sm-12">
                    <div id="addUser" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <form id="addUserForm">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">添加用户信息</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                            <span class="sr-only">Close</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group row">
                                            <label class=" form-control-label col-sm-3">用户名</label>
                                            <input name="username" type="text"
                                                   class="form-control col-sm-8" placeholder="用户名">
                                        </div>
                                        <div class="form-group row">
                                            <label class=" form-control-label col-sm-3">密码</label>
                                            <input name="password" type="text"
                                                   class="form-control col-sm-8" placeholder="密码">
                                        </div>
                                        <div class="form-group row">
                                            <label class=" form-control-label col-sm-3">身份证</label>
                                            <input name="identityid" type="text"
                                                   class="form-control col-sm-8" placeholder="身份证">
                                        </div>
                                        <div class="form-group row">
                                            <label class=" form-control-label col-sm-3">电话</label>
                                            <input name="telephone" type="text"
                                                   class="form-control col-sm-8" placeholder="电话">
                                        </div>
                                        <div class="form-group row">
                                            <label class="form-control-label col-sm-3">备注信息:</label>
                                            <textarea rows="5" class="form-control form-control-line col-sm-8"
                                                      name="description"></textarea>
                                        </div>
                                        <div class="form-group row">
                                            <label class="form-control-label col-sm-3 ">角色选择:</label>
                                            <select class=" form-control c-select col-sm-8 " id="roleid" name="roleid">
                                                <option value="2" selected>普通用户</option>
                                                <option value="4">部门管理员</option>
                                            </select>
                                        </div>
                                        <div class="hidden row" id="department">
                                            <label class="form-control-label col-sm-3 ">部门选择:</label>
                                            <select class=" form-control c-select col-sm-8" id="departmentid" name="departmentid">
                                            </select>

                                        </div>


                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default"
                                                data-dismiss="modal">关闭
                                        </button>
                                        <button type="button" class="btn btn-primary" id="add1">
                                            添加
                                        </button>
                                    </div>
                                </div><!-- /.modal-content -->
                            </form>
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


<script type="text/javascript">
    var data = new Object();
    var adminDepartment =${user.departmentid};
    data.currentPage =${currentPage};
    data.totalPage =${totalPage};
    data.users =${usersJson};
    var role =${user.roleid};
    $(function () {
        $("#add1").bind("click", function () {
            addUser();
        })
        updatePage(data);
        //超级管理员
        if (role == 3) {
            $("#department").removeClass("hidden");
            $.each(${subDepartmentJson}, function (index, item) {
                var option = $("<option>").val(item.id).text(item.departmentname);
                $("#departmentid").append(option);
            })
        }

        //部门管理员，如果是本部门，就只有一个选项
        else {
            $("#roleid").bind("click", function () {
                $("#department").removeClass("hidden");
                var roleid = $(this).val();
                //本部门
                if (roleid == 2) {
                    $("#departmentid").empty();
                    var option = $("<option>").val(adminDepartment).text("${user.department.departmentname}");
                    $("#departmentid").append(option);
                } else {
                    $("#departmentid").empty();
                    //需要遍历一下subDepartmentJson
                    $.each(${subDepartmentJson}, function (index, item) {
                        var option = $("<option>").val(item.id).text(item.departmentname);
                        $("#departmentid").append(option);
                    })

                }
            })
        }

    });

    function personInfo(id) {
        $.each(data.users, function (index, item) {
            if (item.id == id) {
                $("#infoUsername").val(item.username);
                $("#infoPassword").val(item.password);
                //超级管理员
                if (role == 3) {
                    $("#updateDepartment").removeClass("hidden");
                    $.each(${subDepartmentJson}, function (index, item) {
                        var option = $("<option>").val(item.id).text(item.departmentname);
                        $("#updateDepartmentid").append(option);
                    })
                }

                //部门管理员，如果是本部门，就只有一个选项
                else {
                    $("#updateRoleid").bind("click", function () {
                        $("#updateDepartment").removeClass("hidden");
                        var roleid = $(this).val();
                        //本部门
                        if (roleid == 2) {
                            $("#updateDepartmentid").empty();
                            var option = $("<option>").val(adminDepartment).text("${user.department.departmentname}");
                            $("#updateDepartmentid").append(option);
                        } else {
                            $("#updateDepartmentid").empty();
                            //需要遍历一下subDepartmentJson
                            $.each(${subDepartmentJson}, function (index, item) {
                                var option = $("<option>").val(item.id).text(item.departmentname);
                                $("#updateDepartmentid").append(option);
                            })

                        }
                    })
                }
                return false;
            }
        })
        $('#personInfo').modal('show');
        $('#update').val(id);
    }

    function deletePerson(id) {
        $('#deletePerson').modal('show');
        $('#delete').val(id);

    }

    //显示添加用户的模态框
    function addModal() {
        $('#addUser').modal('show');
    }

    function updateTable(data) {
        var table = $("#Table");
        var str = "";

        if (data.users.length != 0) {
            $.each(data.users, function (index, item) {
                str += "<tr class='row'>";
                str += "<td class='col-sm-2'>" + (index + 1) + "</td>";
                str += "<td class='col-sm-2'>" + item.username + "</td>";
                str += "<td class='col-sm-3'>" + item.identityid + "</td>";
                str += "<td class='col-sm-3'>" + item.department.departmentname + "</td>";
                str += '<td class=\'col-sm-2\'><button  onclick="deletePerson(' +
                    item.id +
                    ')" class="btn btn-danger">删除</button>' +
                    ' <button onclick="personInfo(' +
                    item.id +
                    ');" class="btn btn-warning" >查看</button></td>';
                str += ' </tr>';
            });


        }
        table.html(str);
    }


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
            window.history.pushState(null, null, "<%=basePath%>admin/userAdmin/" + rel);
            sendAjaxPage(rel);
        });
    }

    window.addEventListener("popstate",
        function (e) {
            var link = location.pathname;
            var linkSplit = link.split('/').pop();
            sendAjaxPage(linkSplit);
        }
    );

    function sendAjaxPage(rel) {
        var form = new FormData(document.getElementById("userCondition"));

        $.ajax({
            url: '<%=basePath%>admin/userAdmin/' + rel,
            type: "post",
            data: form,
            /* 执行执行的是dom对象 ，不需要转化信息*/
            processData: false,
            contentType: false,
            /* 指定返回类型为json */
            dataType: 'json',
            success: function (d) {
                data = d;
                updateTable(d);
                updatePage(d);
            },
            error: function (e) {
                console.log("失败");
            }
        });

    }

    function updateUser(id) {
        var form = new FormData($("#updateUserForm")[0]);
        form.append("id", id);
        $.ajax({
            url: '<%=basePath%>admin/updateUser',
            type: "post",
            data: form,
            /* 执行执行的是dom对象 ，不需要转化信息*/
            processData: false,
            contentType: false,
            /* 指定返回类型为json */
            dataType: 'json',
            success: function (d) {
                //更新data中user的内容，重新刷新一遍
                $.each(data.users, function (index, user) {
                    if (user.id == d.user.id) {
                        user.password = d.user.password;
                        user.username = d.user.username;
                        user.roleid = d.user.roleid;
                        user.departmentid = d.user.departmentid;
                        user.department.departmentname = d.user.department.departmentname;
                    }
                });
                updateTable(data);
                $("#personInfo").modal("hide");
                $(".modify").removeClass("hidden");
            },
            error: function (e) {
                console.log("失败");
            }
        });

    }

    function deleteUser(id) {
        $.ajax({
            url: '<%=basePath%>admin/deleteUser/' + id,
            type: "post",
            /* 执行执行的是dom对象 ，不需要转化信息*/
            processData: false,
            contentType: false,
            /* 指定返回类型为json */
            dataType: 'json',
            success: function (d) {
                $("#deletePerson").modal("hide");
                $(".delete").removeClass("hidden");
                sendAjaxPage(data.currentPage);
            },
            error: function (e) {
                console.log("失败");
            }
        });

    }

    function addUser() {
        var form = new FormData($("#addUserForm")[0]);
        $.ajax({
            url: '<%=basePath%>admin/addUser',
            type: "post",
            /* 执行执行的是dom对象 ，不需要转化信息*/
            processData: false,
            contentType: false,
            data: form,
            /* 指定返回类型为json */
            dataType: 'json',
            success: function (d) {
                $("#addUser").modal("hide");
                $(".add").removeClass("hidden");
                sendAjaxPage(data.currentPage);
            },
            error: function (e) {
                console.log("失败");
            }
        });

    }

</script>
</body>

</html>
