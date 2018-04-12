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
    <title>管理员文本点位搜索</title>
    <!-- Bootstrap Core CSS -->

    <link
            href="<%=basePath %>source/assets/plugins/bootstrap/css/bootstrap.min.css"
            rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<%=basePath %>source/css/style.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="<%=basePath %>source/css/colors/megna.css" id="theme"
          rel="stylesheet">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
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

    <link rel="stylesheet" type="text/css" href="<%=basePath%>source/css/daterangepicker.css" />
    <script type="text/javascript" src="<%=basePath%>source/js/moment.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>source/js/daterangepicker.js"></script>

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
                    <h3 class="text-themecolor m-b-0 m-t-0">文字点位搜索</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item active">文字点位搜索</li>
                    </ol>
                </div>

            </div>

            <!-- End Bread crumb and right sidebar toggle -->


            <!-- Start Page Content -->

            <div class="row">

                <%--搜索条件--%>
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-block">
                            <form id="searchForm">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group row">
                                            <label for="inputEmail3"
                                                   class="col-sm-2 form-control-label">点位地址</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="inputEmail3"
                                                       placeholder="湖南大学天马学生公寓" name="address">
                                            </div><label
                                                    class="col-sm-2 form-control-label">点位选择</label>
                                            <div class="col-sm-10">
                                                <select class="form-control c-select" name="nodetype">
                                                    <option selected value="1">案件点</option>
                                                    <option value="2">基础点</option>
                                                    <option value="3">标记点</option>
                                                </select>

                                            </div>

                                        </div>

                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group row">
                                            <label
                                                   class="col-sm-2 form-control-label">点位名称</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control"
                                                       placeholder="大学城" name="nodename">
                                            </div>
                                            <label
                                                   class="col-sm-2 form-control-label">选择时间</label>
                                            <div class=" col-sm-10">
                                                <input type="text" class="form-control" id="daterange" placeholder="选择起始时间和终止时间">
                                            </div>

                                            <input type="hidden" value="" id="beginTime">
                                            <input type="hidden" value="" id="endTime">
                                            <div class="col-sm-2"></div>
                                            <div class="col-sm-10" style="margin-top: 10px;">
                                                <button class="btn btn-info" type="button" onclick="searchPage('1')">搜索</button>
                                            </div>

                                        </div>
                                    </div>
                                </div>


                            </form>
                            <div>
                                <table class="table table-hover">
                                    <thead>
                                    <tr class="row">
                                        <th class="col-sm-1">#</th>
                                        <th class="col-sm-2">点位名称</th>
                                        <th class="col-sm-3">点位地址</th>
                                        <th class="col-sm-2">点位类型</th>
                                        <th class="col-sm-2">点位时间</th>
                                        <th class="col-sm-2">操作</th>
                                    </tr>


                                    </thead>
                                    <tbody id="Table">


                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
                <%--end搜索条件--%>


                    <div class="col-sm-12" id="Page">
                    </div>
            </div>
        </div>

        <!-- End Container fluid  -->


    </div>

    <!-- End Page wrapper  -->

</div>


<script type="text/javascript">
    //改变模态框内容
    var data = new Object();
    data.currentPage =${currentPage};
    data.totalPage =${totalPage};
    data.baseNodes =${baseNodesJson};
    updatePage(data);
    updateTable(data);
    /*结束更新ajax请求*/
    /*异步接收数据之后更新表*/
    function updateTable(data) {
        var table = $("#Table");
        var str = "";
        console.log(data.baseNodes.length);
        if (data.baseNodes.length != 0) {
            $.each(data.baseNodes, function (index, item) {
                str += "<tr class='row'>";
                str += "<td class=\"col-sm-1\">" + (index + 1) + "</td>";
                str += "<td class=\"col-sm-2\">" + item.nodename + "</td>";
                str += "<td class=\"col-sm-3\">" + item.address + "</td>";
                str += "<td class=\"col-sm-2\">" + item.table.chinesename + "</td>";
                str += "<td class=\"col-sm-2\">" + item.collecttime + "</td>";
                str += '<td class="col-sm-2"><button class="btn btn-info"  onclick="window.open(\'/admin/node/' +item.nodeid+
                    '?nodetype='+item.nodetype+'\')">查看</button><td>';
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
            window.history.pushState(null, null, "<%=basePath%>admin/nodeText/" + rel);
            searchPage(rel);
        });
    }
    //按照页面，条件搜索
    function searchPage(rel) {
        var form = new FormData($('#searchForm')[0]);
        if ($('#beginTime').val()!=''){
            form.append('beginTime',$('#beginTime').val());
            form.append('endTime',$('#endTime').val());
        }
        $.ajax({
            url: '<%=basePath%>admin/nodeText/' + rel,
            type: "post",
            data: form,
            /* 执行执行的是dom对象 ，不需要转化信息*/
            processData: false,
            contentType: false,
            /* 指定返回类型为json */
            dataType: 'json',
            success: function (d) {
                data = d;
                console.log(d.baseNodes);
                updateTable(d);
                updatePage(d);
            },
            error: function (e) {
                console.log("失败");
            }
        });

    }

    /*结束更新分页*/
    $('#exampleModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var src = button.data('whatever') // Extract info from data-* attributes
        var modal = $(this);
        modal.find('.modal-body iframe').prop("src", src);
    })
    $('#daterange').daterangepicker({
        timePicker: true,
        timePickerIncrement: 30,
        locale: {
            format: 'YYYY-MM-DD h:mm:ss'
        }
    },function (start, end) {
        console.log('New date range selected: ' + start.format('YYYY-MM-DD h:mm:ss') + ' to ' + end.format('YYYY-MM-DD h:mm:ss') );
        $('#beginTime').val(start.format('YYYY-MM-DD h:mm:ss'));
        $('#endTime').val(end.format('YYYY-MM-DD h:mm:ss'));
    });
</script>
</body>

</html>
