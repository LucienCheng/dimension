<%@ page import="java.util.*" contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
      href="<%=basePath%>source/assets/images/favicon.png">
<title>点位详细信息</title>
<!-- Bootstrap Core CSS -->
<link
        href="<%=basePath%>source/assets/plugins/bootstrap/css/bootstrap.css"
        rel="stylesheet">
<!-- Custom CSS -->
<!-- You can change the theme colors from here -->
<link href="<%=basePath%>source/css/colors/megna.css" id="theme"
      rel="stylesheet">
<link rel="stylesheet" href="<%=basePath%>source/css/fileinput.css" type="text/css"/>
<link href="<%=basePath %>/source/scss/icons/font-awesome/css/font-awesome.min.css" rel="stylesheet"
      type="text/css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="<%=basePath %>/source/css/bootstrap-select.min.css">
<link href="<%=basePath %>/source/explorer-fa/theme.css" media="all" rel="stylesheet" type="text/css"/>

<link href="<%=basePath%>source/css/style.css" rel="stylesheet">
<style>
</style>
<head>
    <title>点位具体信息</title>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-1">
        </div>
        <div class="col-sm-10">
            <nav class="navbar " style="padding-bottom:0px;padding-left:0px;padding-right:0px;">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a href="#info" class="nav-link active" data-toggle="tab"> 点位基本信息</a>
                    </li>
                    <li class="nav-item">
                        <a href="#file" class="nav-link" data-toggle="tab">点位文件</a>
                    </li>
                    <li class="nav-item">
                        <a href="#basestation" class="nav-link" data-toggle="tab">基站信息</a>
                    </li>
                    <li class="nav-item">
                        <a href="#wifi" class="nav-link" data-toggle="tab">wifi信息</a>
                    </li>
                    <li class="nav-item">
                        <a href="#caseInfo" class="nav-link" data-toggle="tab">案件信息</a>
                    </li>

                </ul>

            </nav>
        </div>

        <div class="col-sm-1">
        </div>
    </div>
</div>
<%--content--%>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-1">
        </div>
        <div class="col-sm-10">

            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade in active show" id="info">

                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-block">
                                <form>
                                    <div class="row" style="margin-bottom: 15px;">
                                        <input class=" btn btn-info" type="button" value="升级为案件点"
                                               style="margin-left: 15px;">
                                        <input class=" btn btn-info" type="button" value="降级为基础点"
                                               style="margin-left: 15px;">
                                        <input class=" btn btn-success" type="button" value="标记"
                                               style="margin-left: 15px;">


                                    </div>
                                    <div class="row">
                                        <div class="container col-sm-4">
                                            <div class="card">
                                                <div class="card-block">
                                                    <form class="form-horizontal form-material">
                                                        <div class="form-group">
                                                            <div class="form-group row">
                                                                <label class="col-sm-4 form-control-label">点位编号：</label>
                                                                <span class=" col-sm-8 form-control-label">${baseNode.nodeid}</span>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="form-group row">
                                                                <label class="col-sm-4 form-control-label">经度：</label>
                                                                <span class=" col-sm-8 form-control-label">${baseNode.longitude}</span>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <div class="form-group row">
                                                                <label class="col-sm-4 form-control-label">纬度：</label>
                                                                <span class=" col-sm-8 form-control-label">${baseNode.latitude}</span>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="form-group row">
                                                                <label class="col-sm-4 form-control-label">生成时间：</label>
                                                                <span class=" col-sm-8 form-control-label">${baseNode.collecttime}</span>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="form-group row">
                                                                <label class="col-sm-4 form-control-label">拥有者：</label>
                                                                <span class=" col-sm-8 form-control-label">${baseNode.userName}</span>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <div class="form-group row">
                                                                <label class="col-sm-4 form-control-label">点的类型：</label>
                                                                    <span class=" col-sm-8 form-control-label">${baseNode.table.chinesename}</span>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="container col-sm-8">

                                            <div class="card">
                                                <div class="card-block">
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 form-control-label">点位名称：</label>
                                                        <input type="text" class="form-control col-sm-9" value="${baseNode.nodename}">
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 form-control-label">地址位置：</label>
                                                        <input type="text" class="form-control col-sm-9" value="${baseNode.address}">
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 form-control-label">点位的方向：</label>
                                                        <input type="text" class="form-control col-sm-9" value="${baseNode.location}">
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="form-control-label col-sm-3 ">点位类型选择:</label>
                                                        <select class="c-select col-sm-9 form-control" name="tableid">
                                                            <c:forEach items="${baseNode.tables}" var="table">
                                                                <option value="${table.id}" selected>${table.chinesename}</option>
                                                            </c:forEach>

                                                        </select>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label class="col-md-12">备注信息：</label>
											                <textarea rows="5" class="form-control form-control-line "
                                                             name="description" style="margin-left: 15px;">${table.description}</textarea>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-sm-12">
                                                            <button class="btn btn-success">更改</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                    </div>


                                </form>


                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="file">
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-block">
                                <form enctype="multipart/form-data">
                                    <div class="form-group">
                                        <div class="file-loading">
                                            <input id="file-1" type="file" multiple class="file"
                                                   data-overwrite-initial="false" data-min-file-count="2">
                                        </div>
                                    </div>
                                </form>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="card">
                                            <img class="card-img-top" src="<%=basePath%>source/imageicon.png"
                                                 alt="Card image cap"
                                                 style="height: 300px; width: 100%; display: block;">
                                            <div class="card-block">
                                                <h4 class="card-title">文件名1</h4>
                                                <p class="card-text">图片</p>
                                                <a href="#" class="btn btn-primary">下载</a>
                                                <a href="#" class="btn btn-danger">删除</a>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-sm-4">
                                        <div class="card">
                                            <img class="card-img-top" src="<%=basePath%>source/imageicon.png"
                                                 alt="Card image cap"
                                                 style="height: 300px; width: 100%; display: block;">
                                            <div class="card-block">
                                                <h4 class="card-title">文件名2</h4>
                                                <p class="card-text">图片</p>
                                                <a href="#" class="btn btn-primary">下载</a>
                                                <a href="#" class="btn btn-danger">删除</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="card">
                                            <img class="card-img-top" src="<%=basePath%>source/videoicon.png"
                                                 alt="Card image cap"
                                                 style="height: 300px; width: 100%; display: block;">
                                            <div class="card-block">
                                                <h4 class="card-title">文件名3</h4>
                                                <p class="card-text">视频</p>
                                                <a href="#" class="btn btn-primary">下载</a>
                                                <a href="#" class="btn btn-danger">删除</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="basestation">
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-block">
                                <h4 class="card-title">基站信息</h4>

                                <div>
                                    <table class="table table-hover">
                                        <thead>
                                        <tr class="row">
                                            <th class="col-sm-1">#</th>
                                            <th class="col-sm-2">运营商</th>
                                            <th class="col-sm-2">模式</th>
                                            <th class="col-sm-3">信号质量（ch：0-31）</th>
                                            <th class="col-sm-3">信号好坏（rssi：-93- -113）</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr class="row">
                                            <td class="col-sm-1">1</td>
                                            <td class="col-sm-2">电信</td>
                                            <td class="col-sm-2">2G</td>
                                            <td class="col-sm-3">28</td>
                                            <td class="col-sm-3">-93</td>
                                        </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="wifi">
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-block">
                                <h4 class="card-title">wifi信息</h4>
                                <div>
                                    <table class="table table-hover">
                                        <thead>
                                        <tr class="row">
                                            <th class="col-sm-1">#</th>
                                            <th class="col-sm-2">运营商</th>
                                            <th class="col-sm-2">模式</th>
                                            <th class="col-sm-3">信号质量（ch：0-31）</th>
                                            <th class="col-sm-3">信号好坏（rssi：-93- -113）</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr class="row">
                                            <td class="col-sm-1">1</td>
                                            <td class="col-sm-2">电信</td>
                                            <td class="col-sm-2">2G</td>
                                            <td class="col-sm-3">28</td>
                                            <td class="col-sm-3">-93</td>
                                        </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="caseInfo">
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-block">
                                <form>
                                    <div class="row">
                                        <div class="container col-sm-4">
                                            <div class="card">
                                                <div class="card-block">
                                                    <form class="form-horizontal form-material">
                                                        <div class="form-group row">
                                                            <label class="form-control-label col-sm-4 ">案件选择:</label>
                                                            <select  class="selectpicker col-sm-8" data-live-search="true" title="Please select a lunch ...">
                                                                <option>Hot Dog, Fries and a Soda</option>
                                                                <option>Burger, Shake and a Smile</option>
                                                                <option>Sugar, Spice and all things nice</option>
                                                                <option>Baby Back Ribs</option>
                                                                <option>A really really long option made to illustrate an issue with the live search in an inline form</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="form-group row">
                                                                <label class="col-sm-4 form-control-label">案件编号：</label>
                                                                <span class=" col-sm-8 form-control-label">1</span>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="form-group row">
                                                                <label class="col-sm-4 form-control-label">案件名称：</label>
                                                                <span class=" col-sm-8 form-control-label">岳麓区抢劫案</span>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <div class="form-group row">
                                                                <label class="col-sm-4 form-control-label">案件类型：</label>
                                                                <span class=" col-sm-8 form-control-label">抢劫</span>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <div class="form-group row">
                                                                <label class="col-sm-4 form-control-label">案件描述：</label>
                                                                <span class=" col-sm-8 form-control-label">发生于。。。。</span>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="form-group row">
                                                                <label class="col-sm-4 form-control-label">组长：</label>
                                                                <span class=" col-sm-8 form-control-label">李四</span>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="container col-sm-8">

                                            <div class="card">
                                                <div class="card-block">
                                                    <div class="form-group row">
                                                        <label class="col-sm-2 form-control-label">接处警编号：</label>
                                                        <input type="text" class="form-control col-sm-10">
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-md-12">研判信息：</label>
                                                        <textarea rows="5" class="form-control form-control-line "
                                                                  name="description" style="margin-left: 15px;"></textarea>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="col-sm-12">
                                                            <button class="btn btn-success">更改</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                    </div>


                                </form>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-1">
        </div>
    </div>


</div>

<script src="<%=basePath %>source/assets/plugins/jquery/jquery.min.js"></script>
<script
        src="<%=basePath %>source/assets/plugins/bootstrap/js/tether.min.js"></script>
<script src="<%=basePath %>source/assets/plugins/bootstrap/js/bootstrap.min.js"></script>

<script src="<%=basePath %>source/js/fileinput.js"></script>
<script src="<%=basePath %>/source/explorer-fa/theme.js" type="text/javascript"></script>

<script src="<%=basePath %>/source/fa/theme.js" type="text/javascript"></script>

<script src="<%=basePath %>source/assets/plugins/bootstrap/js/tether.min.js"></script>
<!--配置中文，但是没有汉化成功，只能在配置里重写-->
<script src="<%=basePath %>source/js/zh.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="<%=basePath %>source/js/bootstrap-select.min.js"></script>


<script type="text/javascript">
    $("#file-1").fileinput({
        theme: 'fa',
        uploadUrl: '#', // you must set a valid URL here else you will get an error
        allowedFileExtensions: ['jpg', 'png', 'gif','mp4','avi'],
        overwriteInitial: false,
        maxFileSize: 10*1000,
        maxFilesNum: 10,
        allowedFileTypes: ['image', 'video', 'flash'],
        slugCallback: function (filename) {
            return filename.replace('(', '_').replace(']', '_');
        }
    });


</script>
</body>
</html>