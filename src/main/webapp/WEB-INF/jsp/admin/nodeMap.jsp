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
          href="<%=basePath %>/source/assets/images/favicon.png">
    <title>管理员地图点位搜索</title>
    <!-- Bootstrap Core CSS -->
    <link
            href="<%=basePath %>/source/assets/plugins/bootstrap/css/bootstrap.min.css"
            rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<%=basePath %>/source/css/style.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="<%=basePath %>source/css/colors/megna.css" id="theme"
          rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>source/css/daterangepicker.css" />

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
                    <li><a href="<%=basePath%>admin/nodeText" class="waves-effect"><i
                            class="fa fa-table m-r-10" aria-hidden="true"></i>文字点位搜索</a>
                    </li>
                    <li><a href="" class="wavesEffect"><i
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
                    <h3 class="text-themecolor m-b-0 m-t-0">点位地图搜索</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item active">点位地图搜索</li>
                    </ol>
                </div>

            </div>

            <!-- End Bread crumb and right sidebar toggle -->


            <!-- Start Page Content -->

            <div class="row">

                <div class="col-12">

                    <%--这是案件点位的搜索--%>
                    <div class="col-sm-12">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    案件相关点位查询
                                    <a data-toggle="collapse" data-parent="#accordion"
                                       href="#case" style="color:#0f1111;">
                                        <i class="fa  fa-angle-double-down m-l-10 pull-right"></i>
                                    </a>

                                </h4>

                            </div>
                            <div id="case" class="panel-collapse collapse ">
                                <div class="panel-body">
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
                                                        <label  class="col-sm-2 form-control-label">选择时间</label>
                                                        <div class=" col-sm-10">
                                                            <input type="text" class="form-control daterange"  placeholder="选择起始时间和终止时间">
                                                        </div>
                                                    </div>


                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group row">
                                                        <label class="col-sm-2 form-control-label">案件类型</label>
                                                        <div class="col-sm-10">
                                                            <input type="text" class="form-control" placeholder="案件类型"
                                                                   name="casetype">
                                                        </div>
                                                        <div class="col-sm-2"></div>
                                                        <div class="col-sm-10" style="margin-top: 10px;">
                                                            <input onclick="searchPage(1);" class="btn btn-info" value="搜索">
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
                                                    <th class="col-sm-2">案件名称</th>
                                                    <th class="col-sm-1">案件类型</th>
                                                    <th class="col-sm-3">案件开始时间</th>
                                                    <th class="col-sm-3">案件结束时间</th>
                                                    <th class="col-sm-2">操作</th>
                                                </tr>
                                                </thead>
                                                <tbody id="Table">
                                                    <tr class="row">
                                                        <td class="col-sm-1">1</td>
                                                        <td class="col-sm-2">岳麓区抢劫案</td>
                                                        <td class="col-sm-1">抢劫</td>
                                                        <td class="col-sm-3">2018-4-5 14：28</td>
                                                        <td class="col-sm-3">2018-4-8 14：28</td>
                                                        <td class="col-sm-2">
                                                            <input type="button" class="btn btn-success"
                                                                    value="显示" onclick="addCaseNode()">
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <nav class="text-center">
                                            <ul class="pagination">
                                                <li class="page-item disabled"><a class="page-link" href="#">Previous</a>
                                                </li>
                                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                            </ul>
                                        </nav>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--这是普通点位的搜索--%>
                    <div class="col-sm-12">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    普通点位查询
                                    <a data-toggle="collapse" data-parent="#accordion"
                                       href="#common" style="color:#0f1111;">
                                        <i class="fa  fa-angle-double-down m-l-10 pull-right"></i>
                                    </a>

                                </h4>
                            </div>
                            <div id="common" class="panel-collapse collapse ">
                                <div class="panel-body">
                                    <div class="card-block">
                                        <form>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="form-group row">
                                                        <label for="inputEmail3"
                                                               class="col-sm-2 form-control-label">点位地址</label>
                                                        <div class="col-sm-10">
                                                            <input type="email" class="form-control" id="inputEmail3"
                                                                   placeholder="湖南大学天马学生公寓">
                                                        </div>

                                                        <div class="col-sm-2"></div>
                                                        <div class="col-sm-10" style="margin-top: 10px;">
                                                            <select class="form-control c-select">
                                                                <option selected>点位类型</option>
                                                                <option value="1">案件点</option>
                                                                <option value="2">基础点</option>
                                                                <option value="3">标记点</option>
                                                            </select>

                                                        </div>

                                                    </div>

                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group row">
                                                        <label for="inputEmail3"
                                                               class="col-sm-2 form-control-label">点位名称</label>
                                                        <div class="col-sm-10">
                                                            <input type="email" class="form-control"
                                                                   placeholder="大学城">
                                                        </div>
                                                        <label
                                                                class="col-sm-2 form-control-label">选择时间</label>
                                                        <div class=" col-sm-10">
                                                            <input type="text" class="form-control daterange" id="" placeholder="选择起始时间和终止时间">
                                                        </div>
                                                        <div class="col-sm-2"></div>
                                                        <div class="col-sm-10" style="margin-top: 10px;">
                                                            <button type="submit" class="btn btn-info">搜索</button>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>


                                        </form>
                                        <div >
                                            <table class="table table-hover">
                                                <thead>
                                                <tr class="row">
                                                    <th class="col-sm-1">#</th>
                                                    <th class="col-sm-2">点位名称</th>
                                                    <th class="col-sm-3">点位地址</th>
                                                    <th class="col-sm-2">点位时间</th>
                                                    <th class="col-sm-3">操作</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr class="row">
                                                    <td  class="col-sm-1">1</td>
                                                    <td class="col-sm-2">岳麓区大学城</td>
                                                    <td class="col-sm-3">湖南大学天马学生公寓二区七栋</td>
                                                    <td class="col-sm-2">2018-04-05 14：24</td>
                                                    <td class="col-sm-2">
                                                        <input class="btn btn-info" value="查看" onclick="window.open('node?nodeid=');" type="button">
                                                        <input class="btn btn-info" value="地图显示" onclick="addNode()" type="button">
                                                    </td>

                                                </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                        <nav class="text-center">

                                            <ul class="pagination">
                                                <li class="page-item disabled"><a class="page-link"
                                                                                  href="#">Previous</a>
                                                </li>
                                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                            </ul>
                                        </nav>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-block">

                            <div id="allmap" class="maps"></div>
                        </div>
                    </div>
                    <%--模态框--%>
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
                    <%--end模态框，展示具体点位--%>

                </div>
            </div>

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
<script type="text/javascript"
        src="http://api.map.baidu.com/getscript?v=2.0&ak=mv0HsmB5GwdGiXw6oRUq3XsjsZbfXibc&services=&t="></script>

<script type="text/javascript" src="<%=basePath%>source/js/moment.min.js"></script>
<script type="text/javascript" src="<%=basePath%>source/js/daterangepicker.js"></script>
<script type="text/javascript">

    Array.prototype.indexOf = function(val) {
        for (var i = 0; i < this.length; i++) {
            if (this[i].lng == val.lng && this[i].lat == val.lat)
                return i;
        }
        return -1;
    };

    Array.prototype.remove = function(val) {
        var index = this.indexOf(val);
        if (index > -1) {
            this.splice(index, 1);
        }
    };
    // 初始化百度地图
    var map = new BMap.Map("allmap");
    var point = new BMap.Point(116.404, 39.915);
    map.centerAndZoom(point, 17);
    var count = 1;
    var myCity = new BMap.LocalCity();
    myCity.get(getCity);
    var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
    map.addControl(top_left_navigation);
    //存已经在地图里面的点位
    var bPoints = new Array();
    //添加一个事件点
    function addCaseNode() {
        var bounds = map.getBounds();
        var sw = bounds.getSouthWest();
        var ne = bounds.getNorthEast();
        var lngSpan = Math.abs(sw.lng - ne.lng);
        var latSpan = Math.abs(ne.lat - sw.lat);
        //设置窗口内容
        var img = '<%=basePath%>source/tianAnMen.jpg';
        var title = '天安门';
        var content = '天安门坐落在中国北京市中心,故宫的南侧,与天安门广场隔长安街相望,是清朝皇城的大门...';
        var sContent =
            "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>" + title + "</h4>" +
            "<img style='float:right;margin:4px' id='imgDemo' src='" + img +
            "' width='139' height='104' />" +
            "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>" + content +
            "</p></div>";
        var points = [];
        for (var i = 0; i < 3; i++) {
            var markerMenu = new BMap.ContextMenu();
            var point = new BMap.Point(sw.lng + lngSpan * (Math.random() * 0.7), ne.lat - latSpan * (Math.random() * 0.7));
            bPoints.push(point);
            var marker = new BMap.Marker(point);
            marker.id = count;
            //添加右键窗口
            markerMenu.addItem(new BMap.MenuItem('发送消息', sendMessage));
            markerMenu.addItem(new BMap.MenuItem('标记点位', markNode));
            markerMenu.addItem(new BMap.MenuItem('在地图上删除', removeMark));
            marker.addContextMenu(markerMenu);
            //添加单击展示窗口
            marker.addEventListener("click", function () {
                //初始化地图以及窗口
                var infoWindow = new BMap.InfoWindow(sContent);  // 创建信息窗口对象
                this.openInfoWindow(infoWindow);
                //图片加载完毕重绘infowindow
                document.getElementById('imgDemo').onload = function () {
                    infoWindow.redraw();   //防止在网速较慢，图片未加载时，生成的信息框高度比图片的总高度小，导致图片部分被隐藏
                }
            });
            //添加双击时显示点位具体信息
            marker.addEventListener("dblclick", function () {
                console.log(this.id);
                //弹出具体点位的信息
                <c:if test="${user.roleid != 2}">
                window.open("<%=basePath%>admin/node?nodeid="+this.id);
                </c:if>
                <c:if test="${user.roleid == 2}">
                window.open("<%=basePath%>user/node?nodeid="+this.id);
                </c:if>
            });
            points.push(point);
            count++;
            map.addOverlay(marker);
            setZoom()
        }


        var polyline = new BMap.Polyline(points, {strokeColor: "blue", strokeWeight: 10, strokeOpacity: 0.5});   //创建折线
        polyline.caseId = count;
        polyline.addEventListener("click", function (e) {
            console.log(this.caseId)
        });

        setZoom(bPoints);
        map.addOverlay(polyline); //添加到地图中
    }

    var removeMark = function (e, ee, marker) {
        map.removeOverlay(marker);
    }

    var markNode = function (e, ee, marker) {
        console.log(marker.id);
    }
    var sendMessage = function (e, ee, marker) {
        console.log(marker.id);
        $('#updateModel').modal('toggle');
    }

    // 根据点的数组自动调整缩放级别
    function setZoom (bPoints) {
        var view = map.getViewport(eval(bPoints));
        var mapZoom = view.zoom;
        var centerPoint = view.center;
        map.centerAndZoom(centerPoint,mapZoom);
    }
    //添加点位操作
    function addNode() {

        var bounds = map.getBounds();
        var sw = bounds.getSouthWest();
        var ne = bounds.getNorthEast();
        var lngSpan = Math.abs(sw.lng - ne.lng);
        var latSpan = Math.abs(ne.lat - sw.lat);
        //设置窗口内容
        var img = '<%=basePath%>source/tianAnMen.jpg';
        var title = '天安门';
        var content = '天安门坐落在中国北京市中心,故宫的南侧,与天安门广场隔长安街相望,是清朝皇城的大门...';
        var sContent =
            "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>" + title + "</h4>" +
            "<img style='float:right;margin:4px' id='imgDemo' src='" + img +
            "' width='139' height='104' />" +
            "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>" + content +
            "</p></div>";
        var markerMenu = new BMap.ContextMenu();
        var point = new BMap.Point(sw.lng + lngSpan * (Math.random() * 0.7), ne.lat - latSpan * (Math.random() * 0.7));
        bPoints.push(point);
        var marker = new BMap.Marker(point);
        var infoWindow = new BMap.InfoWindow(sContent);  // 创建信息窗口对象
        marker.id = count;
        map.addOverlay(marker);
        //添加右键窗口
        markerMenu.addItem(new BMap.MenuItem('发送消息', sendMessage));
        markerMenu.addItem(new BMap.MenuItem('标记点位', markNode));
        markerMenu.addItem(new BMap.MenuItem('在地图上删除', removeMark));
        marker.addContextMenu(markerMenu);
        //添加单击展示窗口
        marker.addEventListener("click", function () {
            //初始化地图以及窗口
            this.openInfoWindow(infoWindow);
            console.log(this.id);
        });
        //添加双击时显示点位具体信息
        marker.addEventListener("dblclick", function () {
            console.log(this.id);
            //弹出具体点位的信息
            <c:if test="${user.roleid != 2}">
            window.open("<%=basePath%>admin/node?nodeid="+this.id);
            </c:if>
            <c:if test="${user.roleid == 2}">
            window.open("<%=basePath%>user/node?nodeid="+this.id);
            </c:if>
        });
        count++;
        setZoom(bPoints);
    }

    function getCity(result) {
        var cityName = result.name;
        map.setCenter(cityName);
    }
    $('.daterange').daterangepicker({
        timePicker: true,
        timePickerIncrement: 30,
        locale: {
            format: 'YYYY-DD-MM h:mm:ss '
        }
    });
</script>
</body>

</html>
