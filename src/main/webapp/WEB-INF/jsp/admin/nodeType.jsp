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
    <title>管理员点位类型管理</title>
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
            <nav class="sidebar-nav ">
                <ul id="nav navbar-nav sidebarnav">
                    <li><a href="javascript:void(0);" class="waves-effect"><i
                            class="fa fa-table m-r-10" aria-hidden="true"></i>文字点位的搜索</a>
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

                        <li><a href="<%=basePath%>admin/message" class="waves-effect"><i
                                class="fa fa-columns m-r-10" aria-hidden="true"></i>消息处理</a></li>
                    </c:if>
                    <li><a href="<%=basePath%>admin/personInfo"
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
                    <h3 class="text-themecolor m-b-0 m-t-0">点位类型</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item active">点位类型</li>
                    </ol>
                </div>

            </div>

            <!-- End Bread crumb and right sidebar toggle -->


            <!-- Start Page Content -->

            <div class="row">
                <div class="col-sm-12">
                    <div class="hidden alert alert-warning alert-dismissible  in add" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                            <span class="sr-only">Close</span>
                        </button>
                        <strong>添加成功!</strong>
                    </div>
                </div>
                <!-- column -->
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-block">
                            <div class="topbar" style="background: none;z-index:auto">
                                <div class="top-navbar">
                                    <div class="app-search ">
                                        <form id="searchForm">
                                            <input type="text" class="form-control" name="chinesename"
                                                   placeholder="点位类型搜索"> <a class="srh-btn" onclick="searchPage(1)"><i
                                                class="ti-search"></i></a>
                                        </form>
                                    </div>
                                    <input class="btn btn-info" type="button" onclick="addModal()" value="添加点位类型">
                                </div>
                            </div>
                            <h4 class="card-title">点位类型</h4>
                            <div >
                                <table class="table table-hover ">
                                    <thead>
                                    <tr class="row">
                                        <th class="col-sm-1">#</th>
                                        <th class="col-sm-3">名称</th>
                                        <th class="col-sm-2">属性个数</th>
                                        <th class="col-sm-2">点位个数</th>
                                        <th class="col-sm-4">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="Table">
                                    <c:forEach items="${tables}" var="item" varStatus="status">
                                        <tr class="row">
                                            <td class="col-sm-1">${status.index+1}</td>
                                            <td class="col-sm-3">${item.chinesename}</td>
                                            <td class="col-sm-2">${fn:length(item.fields)}</td>
                                            <td class="col-sm-2">${item.count}</td>
                                            <td class="col-sm-4">
                                                <button class="btn btn-warning" onclick="updateModel(${item.id},1)">查看
                                                </button>
                                                <c:if test="${item.isvalid == '1'}">
                                                    <input type="button" class="btn btn-danger"
                                                           onclick="validTable($(this),${item.id},0)"
                                                           value="设置无效">
                                                </c:if>
                                                <c:if test="${item.isvalid == '0'}">
                                                    <input type="button" class="btn btn-info"
                                                           onclick="validTable($(this),${item.id},1)"
                                                           value="设置有效">
                                                </c:if>
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
                <%--修改模态框--%>
                <div class="col-sm-12">
                    <div id="updateModel" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog" style="max-width:900px!important;">
                            <form id="updateForm">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title" id="exampleModalLabel">类型信息</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                            <span class="sr-only">Close</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="col-sm-12">
                                            <div class="hidden alert alert-warning alert-dismissible  in modify" role="alert">
                                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                    <span class="sr-only">Close</span>
                                                </button>
                                                <strong>修改成功!</strong> 点位信息已经更改
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 form-control-label">（中文）类型名称</label>
                                            <input class="col-sm-7 form-control" id="chinesename" name="chinesename"
                                                   type="text"
                                                   value="atm">
                                            <div class="col-sm-2">
                                                <input type="button" value="添加属性" class=" btn btn-info form-control"
                                                       onclick="addAttr('#city_custom');" style="color:#fff">
                                            </div>

                                        </div>
                                        <div class="table-responsive">
                                            <table class="table table-hover ">
                                                <thead>
                                                <tr>
                                                    <th>属性（中文）名称</th>
                                                    <th>属性类型</th>
                                                    <th>属性认证方式</th>
                                                    <th>操作</th>
                                                </tr>
                                                </thead>
                                                <tbody id="city_custom">


                                                </tbody>
                                            </table>
                                        </div>


                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default"
                                                data-dismiss="modal">关闭
                                        </button>
                                        <button type="button" class="btn btn-primary" id="updateButton"
                                                onclick="updateAttr();">
                                            提交更改
                                        </button>
                                    </div>
                                </div><!-- /.modal-content -->
                            </form>
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                </div>
                <%--添加模态框--%>
                <div class="col-sm-12">
                    <div id="addModel" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog" style="max-width:900px!important;">
                            <form id="addForm">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">添加点位类型信息</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                            <span class="sr-only">Close</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group row">
                                            <label class="col-sm-3 form-control-label">（中文）类型名称</label>
                                            <input class="col-sm-7 form-control" id="addChinesename" name="chinesename"
                                                   type="text" placeholder="类型名称（中文）">
                                            <div class="col-sm-2">
                                                <input type="button" value="添加属性" class=" btn btn-info form-control"
                                                       onclick="addAttr('#city_custom1');" style="color:#fff">
                                            </div>

                                        </div>
                                        <div class="table-responsive">
                                            <table class="table table-hover ">
                                                <thead>
                                                <tr>
                                                    <th>属性（中文）名称</th>
                                                    <th>属性类型</th>
                                                    <th>属性认证方式</th>
                                                    <th>操作</th>
                                                </tr>
                                                </thead>
                                                <tbody id="city_custom1">


                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default"
                                                data-dismiss="modal">关闭
                                        </button>
                                        <button type="button" class="btn btn-primary" id="addButton" onclick="addAjax();">
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
<script src="<%=basePath %>source/js/jquery.cxselect.min.js"></script>


<script type="text/javascript">

    var i = 0;
    var data = new Object();
    data.currentPage =${currentPage};
    data.totalPage =${totalPage};
    data.tables =${tablesJson};
    updatePage(data);

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


    //设置无效和有效按钮，这里需要根据id判断是哪种类型的按钮，然后发送相应的ajax
    function change(object) {
        if (object.val() == '设置无效') {
            object.removeClass("btn-danger");
            object.addClass("btn-info");
            object.val('设置有效');
        }
        else {
            object.removeClass("btn-info");
            object.addClass("btn-danger");
            object.val('设置无效');
        }


    }

    //添加属性按钮，会自动添加一项。当点击提交的时候，统一将提交给数据库处理
    function addAttr(htmlId) {
        str = "";
        str += ' <tr class="addAttr" id="' + i +
            '">' +
            '        <td><input name="chinesename" type="text" placeholder="（中文）属性名"' +
            '            ></td>\n' +
            '        <td><select name="fieldtype" class="first" data-value="int(11)"' +
            '        disabled="disabled"></select></td>' +
            '        <td><select  name="regexid" class="second" data-value="2"' +
            '        disabled="disabled">' +
            '            </select>' +
            '            </td>' +
            '            <td>' +
            '            <button  type="button" onclick="removeTr($(this))" class="close pull-left">' +
            '            <span aria-hidden="true">&times;</span>' +
            '        <span class="sr-only">Close</span>' +
            '            </button>' +
            '            </td>' +
            '            </tr>';
        $(htmlId).append(str);
        city_custom($('#' + i));
        i++;
    }

    //删除属性的一块
    function removeTr(object) {
        //tr
        object.parent().parent().remove();

    }

    //属性初始化的时候，会有相应的二级选择


    function city_custom(object) {
        object.cxSelect({

            selects: ['first', 'second'],

            required: true,

            url: [
                {
                    'v': 'varchar(64)', 'n': 'varchar(64)', 's': [

                        {'v': 1, 'n': '认证是否为邮箱'},

                        {'v': 2, 'n': '认证电话号码'},

                        {'v': 3, 'n': '中文、英文、数字包括下划线'},

                    ]
                },
                {
                    'v': 'int(11)', 'n': 'int(11)', 's': [

                        {'v': 2, 'n': '认证电话号码'},
                        {'v': 4, 'n': '只能为数字'}


                    ]
                }

            ]

        });

    }


    /*一下是关于更新的操作
        触发更新模态框*/
    function updateModel(id,state) {
        $("#city_custom").empty();
        $.each(data.tables, function (index, item) {
            if (item.id == id) {
                var str = '';
                $.each(item.fields, function (index, item) {
                    if (item.englishname == 'nodeId') {
                        return;
                    } else {
                        str += '<tr class="updateAttr"id="' + item.id + '">';
                        str += '<td><input name="chinesename" type="text" value="' + item.chinesename + '"></td>';
                        str += '<td><lable>' + item.fieldtype + '</lable></td>';
                        str += '<td><select name="regexid" >'
                        if (item.fieldtype == 'varchar(64)') {
                            str += '<option  value="1"> 认证是否为邮箱</option>'
                            str += '<option  value="2"> 认证是否为手机号</option>'
                            str += '<option  value="3"> 认证中文和字母和数字</option> '
                        }
                        else {
                            str += '<option  value="2"> 认证是否为手机号</option>'
                        }
                        str += '</select></td>';
                        if (item.isvalid == "0") {
                            str += '<td> <input type="button" class="btn btn-info"onclick="validField($(this),' + item.id + ',1)" value="设置有效"> </td>';
                        } else {
                            str += '<td> <input type="button" class="btn btn-danger"onclick="validField($(this),' + item.id + ',0)" value="设置无效"> </td>';
                        }
                        str += ' <input value="'+item.id+'" type="hidden" name="id" /></tr>';
                    }
                    $("#city_custom").append(str);
                    str = '';
                    $('#city_custom').find("select").val(item.regexp.id);
                });
                $("#chinesename").val(item.chinesename);
                return false;
            }
        })
        if(state==1)
        $('#updateModel').modal('show');

        $('#updateButton').val(id);
    }


    //显示添加用户的模态框。
    function addModal() {
        $('#addModel').modal('show');
    }


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
            window.history.pushState(null, null, "<%=basePath%>admin/nodeType/" + rel);
            searchPage(rel);
        });
    }

    /*结束更新分页*/
    /*异步接收数据之后更新表*/
    function updateTable(data) {
        var table = $("#Table");
        var str = "";
        if (data.tables.length != 0) {
            $.each(data.tables, function (index, item) {
                str += "<tr class='row'>";
                str += "<td class=\"col-sm-1\">" + (index + 1) + "</td>";
                str += "<td class=\"col-sm-3\">" + item.chinesename + "</td>";
                str += "<td class=\"col-sm-2\">" + item.fields.length + "</td>";
                str += "<td class=\"col-sm-2\">" +  item.count+ "</td>";
                str += '<td class="col-sm-4">';
                str += '<button class="btn btn-warning" onclick="updateModel(' + item.id + ',1)">查看</button>\n';
                if (item.isvalid == '0') {
                    str += '<input type="button" class="btn btn-info" onclick="validTable($(this),' + item.id + ',1)" value="设置有效">';
                }
                else {
                    str += '<input type="button" class="btn btn-danger" onclick="validTable($(this),' + item.id + ',0)" value="设置无效">';
                }

                str += '<td></tr>';
            });

        }
        table.html(str);
    }

    /*结束更新表*/

    //ajax
    //按照页面，条件搜索
    function searchPage(rel) {
        var form = new FormData($('#searchForm')[0]);

        $.ajax({
            url: '<%=basePath%>admin/nodeType/' + rel,
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

    var update = new Array();
    var add = new Array();

    function updateAttr(id) {

        $('#city_custom .updateAttr').each(function (index, item) {
            var data = new Object();
            data.chinesename = $(this).find("input[name='chinesename']").val();
            data.regexid = $(this).find("select[name='regexid']").val();
            data.id = $(this).find("input[name='id']").val();
            update.push(data);
        });
        $('#city_custom .addAttr').each(function (index, item) {
            var data = new Object();
            data.chinesename = $(this).find("input[name='chinesename']").val();
            data.regexid = $(this).find("select[name='regexid']").val();
            data.fieldtype = $(this).find("select[name='fieldtype']").val();
            add.push(data);
        });
        console.log(JSON.stringify(update));
        console.log(JSON.stringify(add));
        id = $('#updateButton').val();

        updateAjax(id);
    }

    function updateAjax(id) {
        var dd = new Object();
        dd.update = update;
        dd.add = add;
        console.log(data.currentPage);
        $.ajax({
            url: '<%=basePath%>admin/nodeType/update' +"/" +id+"/"+data.currentPage+"?conditon="+$("#searchForm").find("input").val()+"&tablechineseName="+$("#chinesename").val(),
            type: "post",
            dataType: 'json',
            contentType: "application/json",
            data: JSON.stringify(dd),
            success: function (d) {
                data=d;
                updateTable(d);
                updateModel(id,0);
                update=new Array();
                add=new Array();
                $(".modify").removeClass("hidden");
            },
            error: function (e) {
                console.log("失败");
            }
        });

    }
    function addAjax() {
        add=[];
        $('#city_custom1 .addAttr').each(function (index, item) {
            var data = new Object();
            data.chinesename = $(this).find("input[name='chinesename']").val();
            data.regexid = $(this).find("select[name='regexid']").val();
            data.fieldtype = $(this).find("select[name='fieldtype']").val();
            add.push(data);
        });
        var dd = new Object();
        dd.add = add;
        $.ajax({
            url: '<%=basePath%>admin/nodeType/addTable/'+data.currentPage+'?conditon='+$("#searchForm").find("input").val()+"&chinesename="+$("#addChinesename").val(),
            type: "post",
            dataType: 'json',
            contentType: "application/json",
            data: JSON.stringify(dd),
            success: function (d) {
                data=d;
                updateTable(d);
                updatePage(d);
                add=new Array();
                $(".add").removeClass("hidden");
                $('#addModel').modal('toggle');
            },
            error: function (e) {
                console.log("失败");
            }
        });

    }
    function validTable(object, id, state) {
        $.ajax({
            url: '<%=basePath%>admin/nodeType/validTable/' + id,
            type: "post",
            /* 执行执行的是dom对象 ，不需要转化信息*/
            data: {"state": JSON.stringify(state)},
            /* 指定返回类型为json */
            dataType: 'json',
            success: function (d) {
                change(object);
            },
            error: function (e) {
                console.log("失败");
            }
        });

    }

    function validField(object, id, state) {
        $.ajax({
            url: '<%=basePath%>admin/nodeType/validField/' + id,
            type: "post",
            /* 执行执行的是dom对象 ，不需要转化信息*/
            data: {"state": JSON.stringify(state)},
            /* 指定返回类型为json */
            dataType: 'json',
            success: function (d) {
                change(object);
            },
            error: function (e) {
                console.log("失败");
            }
        });

    }

    //end ajax
</script>
</body>

</html>
