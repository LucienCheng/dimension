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
                    <c:if test="${nodetype==2}">
                        <li class="nav-item">
                            <a href="#caseInfo" class="nav-link" data-toggle="tab">案件信息</a>
                        </li>
                    </c:if>


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
                        <div class="hidden alert alert-warning alert-dismissible  in modifyInfo" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                                <span class="sr-only">Close</span>
                            </button>
                            <strong>修改成功!</strong> 点位基础信息更新
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-block">
                                <form>
                                    <div class="row" style="margin-bottom: 15px;">
                                        <c:if test="${nodetype==1}">
                                            <input class=" btn btn-info" type="button" value="升级为案件点"
                                                   style="margin-left: 15px;" data-toggle="modal"
                                                   data-target="#addModel">
                                        </c:if>
                                        <c:if test="${nodetype==2}">
                                            <input class=" btn btn-info" type="button" value="降级为基础点"
                                                   style="margin-left: 15px;" onclick="degradeNode();">
                                        </c:if>
                                        <c:if test="${empty markId}">
                                            <input class=" btn btn-success" type="button" value="标记"
                                                   style="margin-left: 15px;" onclick="mark($(this));">
                                        </c:if>
                                        <c:if test="${not empty markId}">
                                            <input class=" btn btn-success" type="button" value="取消标记"
                                                   style="margin-left: 15px;" onclick="mark($(this));">
                                        </c:if>


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
                                                                <label class="col-sm-4 form-control-label">点位类型:</label>
                                                                <span class=" col-sm-8 form-control-label"> ${baseNode.table.chinesename}</span>
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
                                                                <span class=" col-sm-8 form-control-label">${baseNode.username}</span>
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
                                                <c:if test="${isEdited==1}">
                                                    <div class="card-block">
                                                        <form id="base">
                                                            <div class="form-group row">
                                                                <label class="col-sm-3 form-control-label">点位名称：</label>

                                                                <input type="text" class="form-control col-sm-9"
                                                                       id="nodename" name="nodename"
                                                                       value="${baseNode.nodename}">
                                                            </div>

                                                            <div class="form-group row">
                                                                <label class="col-sm-3 form-control-label">地址位置：</label>

                                                                <input type="text" class="form-control col-sm-9"
                                                                       id="address" name="address"
                                                                       value="${baseNode.address}">
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-sm-3 form-control-label">点位的方向：</label>

                                                                <input type="text" class="form-control col-sm-9"
                                                                       id="location" name="location"
                                                                       value="${baseNode.location}">
                                                            </div>


                                                        </form>
                                                        <input id="nodeid" type="hidden" value="${baseNode.nodeid}"
                                                               name="nodeid">
                                                        <form id="field">
                                                            <c:forEach items="${baseNode.other}" var="item">
                                                                <c:if test="${item.englishname != 'nodeId'}">
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-3 form-control-label">${item.chinesename}：</label>
                                                                        <input type="text" name="${item.englishname}"
                                                                               class="form-control col-sm-9 value"
                                                                               value="${item.value}">
                                                                        <input type="hidden" value="${item.englishname}"
                                                                               class="englishname">
                                                                        <input type="hidden"
                                                                               value="${baseNode.table.englishname}"
                                                                               class="tablename">
                                                                        <input type="hidden" value="${baseNode.nodeid}"
                                                                               class="nodeid">
                                                                    </div>

                                                                </c:if>

                                                            </c:forEach>
                                                        </form>

                                                        <div class="form-group row">
                                                            <label class="col-md-12">备注信息：</label>
                                                            <textarea rows="5" class="form-control form-control-line "
                                                                      name="description"
                                                                      style="margin-left: 15px;">${table.description}</textarea>
                                                        </div>
                                                        <div class="form-group row">
                                                            <div class="col-sm-12">
                                                                <button type="button" class="btn btn-success"
                                                                        onclick="modifyField();">更改
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <c:if test="${isEdited==0}">
                                                    <div class="card-block">
                                                        <div class="form-group row">
                                                            <label class="col-sm-3 form-control-label">点位名称：</label>

                                                            <input type="text" class="form-control col-sm-9"
                                                                   value="${baseNode.nodename}" disabled>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-sm-3 form-control-label">地址位置：</label>

                                                            <input type="text" class="form-control col-sm-9"
                                                                   value="${baseNode.address}" disabled>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-sm-3 form-control-label">点位的方向：</label>

                                                            <input type="text" class="form-control col-sm-9"
                                                                   value="${baseNode.location}" disabled>
                                                        </div>

                                                        <div class="form-group row">
                                                            <label class="col-md-12">备注信息：</label>
                                                            <textarea rows="5" class="form-control form-control-line "
                                                                      name="description" style="margin-left: 15px;"
                                                                      disabled>${table.description}</textarea>
                                                        </div>

                                                    </div>
                                                </c:if>

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
                        <div class="hidden alert alert-warning alert-dismissible  in uoloadFile" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                                <span class="sr-only">Close</span>
                            </button>
                            <strong>文件上传成功!</strong>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-block">
                                <c:if test="${isEdited==1}">
                                    <form enctype="multipart/form-data">
                                        <div class="form-group">
                                            <div class="file-loading">
                                                <input id="file-1" type="file" multiple class="file-loading"
                                                       name="files"
                                                       data-overwrite-initial="false" data-min-file-count="1">
                                            </div>
                                        </div>
                                    </form>
                                </c:if>
                                <div class="row">
                                    <c:forEach items="${baseNode.files}" var="file">
                                        <div class="col-sm-4" id="${file.id}">
                                            <div class="card">
                                                <c:if test='${file.filetype=="照片"}'>
                                                    <img class="card-img-top" src="<%=basePath%>${file.fileaddress}"
                                                         alt="Card image cap"
                                                         style="height: 300px; width: 100%; display: block;">
                                                </c:if>
                                                <c:if test='${file.filetype=="视频"}'>
                                                    <video class="card-video-top" controls
                                                           style="height: 300px; width: 100%; display: block;">
                                                        <source src="<%=basePath%>${file.fileaddress}">
                                                    </video>
                                                </c:if>
                                                <div class="card-block">
                                                    <h4 class="card-title">${file.filename}</h4>
                                                    <p class="card-text">${file.filetype}</p>
                                                    <a href="/admin/node/download?filename=${file.fileaddress}"
                                                       class="btn btn-primary">下载</a>
                                                    <c:if test="${isEdited==1}">
                                                        <button type="button"
                                                                onclick="deleteFile(${file.id},'${file.fileaddress}');"
                                                                class="btn btn-danger">删除
                                                        </button>
                                                    </c:if>
                                                </div>
                                            </div>

                                        </div>

                                    </c:forEach>


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
                                        <c:forEach items="${baseNode.basestations}" var="basestation"
                                                   varStatus="status">
                                            <tr class="row">
                                                <td class="col-sm-1">${status.index+1}</td>
                                                <td class="col-sm-2">${basestation.carrier}</td>
                                                <td class="col-sm-2">${basestation.mode}</td>
                                                <td class="col-sm-3">${basestation.ch}</td>
                                                <td class="col-sm-3">${basestation.rssi}</td>
                                            </tr>
                                        </c:forEach>


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
                                        <c:forEach items="${baseNode.wifis}" var="wifi" varStatus="status">
                                            <tr class="row">
                                                <td class="col-sm-1">${status.index+1}</td>
                                                <td class="col-sm-2">${wifi.carrier}</td>
                                                <td class="col-sm-2">${wifi.mode}</td>
                                                <td class="col-sm-3">${wifi.ch}</td>
                                                <td class="col-sm-3">${wifi.rssi}</td>
                                            </tr>
                                        </c:forEach>


                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <c:if test="${nodetype==2}">
                    <div class="tab-pane fade" id="caseInfo">
                        <div class="col-sm-12">
                            <div class="hidden alert alert-warning alert-dismissible  in modifyCaseNode" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                    <span class="sr-only">Close</span>
                                </button>
                                <strong>案件点位信息修改成功!</strong> 案件点位信息已经更新。
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-block">
                                    <c:if test="${isEdited==1}">
                                        <form id="caseNodeForm">
                                            <div class="row">
                                                <div class="container col-sm-4">
                                                    <div class="card">
                                                        <div class="card-block">
                                                            <form class="form-horizontal form-material">
                                                                <div class="form-group row">
                                                                    <label class="form-control-label col-sm-4 ">案件选择:</label>
                                                                    <select id="caseselect" name="caseid"
                                                                            class="selectpicker col-sm-8"
                                                                            data-live-search="true">
                                                                    </select>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-4 form-control-label">案件编号：</label>
                                                                        <span id="casecode"
                                                                              class=" col-sm-8 form-control-label"></span>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-4 form-control-label">案件名称：</label>
                                                                        <span id="casename"
                                                                              class=" col-sm-8 form-control-label"></span>
                                                                    </div>
                                                                </div>

                                                                <div class="form-group">
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-4 form-control-label">案件类型：</label>
                                                                        <span id="casetype"
                                                                              class=" col-sm-8 form-control-label"></span>
                                                                    </div>
                                                                </div>

                                                                <div class="form-group">
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-4 form-control-label">案件描述：</label>
                                                                        <textarea rows="5" id="casedescript"
                                                                                  class="form-control form-control-line "
                                                                                  name="record"
                                                                                  style="margin-left: 15px;"
                                                                                  disabled>${caseNode.case1.description}</textarea>
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
                                                                <input name="alarmid" type="text"
                                                                       class="form-control col-sm-10"
                                                                       value="${caseNode.alarmid}">
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-12">研判信息：</label>
                                                                <textarea rows="5"
                                                                          class="form-control form-control-line "
                                                                          name="record"
                                                                          style="margin-left: 15px;">${caseNode.record}</textarea>
                                                            </div>
                                                            <div class="form-group row">
                                                                <div class="col-sm-12">
                                                                    <button class="btn btn-success" type="button"
                                                                            onclick="modifyCaseNode(${caseNode.id})">更改
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>

                                            </div>


                                        </form>
                                    </c:if>
                                    <c:if test="${isEdited==0}">
                                        <form>
                                            <div class="row">
                                                <div class="container col-sm-4">
                                                    <div class="card">
                                                        <div class="card-block">
                                                            <form class="form-horizontal form-material">

                                                                <div class="form-group">
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-4 form-control-label">案件编号：</label>
                                                                        <span class=" col-sm-8 form-control-label">${caseNode.case1.casecode}</span>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-4 form-control-label">案件名称：</label>
                                                                        <span class=" col-sm-8 form-control-label">${caseNode.case1.casename}</span>
                                                                    </div>
                                                                </div>

                                                                <div class="form-group">
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-4 form-control-label">案件类型：</label>
                                                                        <span class=" col-sm-8 form-control-label">${caseNode.case1.casetype}</span>
                                                                    </div>
                                                                </div>

                                                                <div class="form-group">
                                                                    <div class="form-group row">
                                                                        <label class="col-sm-4 form-control-label">案件描述：</label>
                                                                        <textarea rows="5"
                                                                                  class="form-control form-control-line "
                                                                                  name="record"
                                                                                  style="margin-left: 15px;"
                                                                                  disabled>${caseNode.case1.description}</textarea>
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
                                                                <input name="alarmid" type="text"
                                                                       class="form-control col-sm-10"
                                                                       value="${caseNode.alarmid}" disabled>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-12">研判信息：</label>
                                                                <textarea rows="5"
                                                                          class="form-control form-control-line "
                                                                          name="record" style="margin-left: 15px;"
                                                                          disabled>${caseNode.record}</textarea>
                                                            </div>

                                                        </div>
                                                    </div>

                                                </div>

                                            </div>


                                        </form>
                                    </c:if>


                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
                <%--模态框--%>
                <div class="col-sm-12">
                    <div id="addModel" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <form id="addForm">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">添加案件信息</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                            <span class="sr-only">Close</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group row">
                                            <label class="col-sm-3 form-control-label">接处警编号：</label>
                                            <input name="alarmid" type="text"
                                                   class="col-sm-8 form-control" placeholder="465855245">
                                        </div>
                                        <div id="department" class="form-group row">
                                            <label class="col-sm-3 form-control-label ">案件选择:</label>
                                            <select class="selectpicker form-control c-select col-sm-8" name="caseid"
                                                    data-live-search="true">
                                                <c:forEach items="${cases}" var="case1">
                                                    <option value="${case1.id}">${case1.casename}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-12">研判信息:</label>
                                            <div class="col-sm-12">
                                                <textarea rows="5" class="form-control form-control-line"
                                                          name="record"></textarea>
                                            </div>

                                        </div>


                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default"
                                                data-dismiss="modal">关闭
                                        </button>
                                        <button type="button" class="btn btn-primary" id="addButton"
                                                onclick="upgradeNode();">
                                            添加
                                        </button>
                                    </div>
                                </div><!-- /.modal-content -->
                            </form>
                        </div><!-- /.modal-dialog -->
                    </div><!-- /.modal -->
                </div>
            </div>
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


<script src="<%=basePath %>/source/js/jquery.validate.js"></script>
<script src="<%=basePath %>/source/js/additional-methods.js"></script>
<script src="<%=basePath %>/source/js/messages_zh.js"></script>
<style>
    .error {
        color: red;
    }
</style>
<script type="text/javascript">
    <c:if test="${nodetype==1}">

    function upgradeNode() {
        var form = new FormData($('#addForm')[0]);
        form.append('baseNodeId', ${baseNode.nodeid})
        $.ajax({
            url: '<%=basePath%>admin/node/upgradeNode',
            type: "post",
            dataType: 'json',
            /* 执行执行的是dom对象 ，不需要转化信息*/
            processData: false,
            contentType: false,
            data: form,
            success: function (d) {
                console.log("升级成功");
                window.open("<%=basePath%>admin/node/" + d.nodeid + "?nodetype=2", "_self");
            },
            error: function (e) {
                console.log("失败");
            }
        });
    }

    </c:if>
    <c:if test="${nodetype==2}">

    function degradeNode() {
        $.ajax({
            url: '<%=basePath%>admin/node/degradeNode/${baseNode.nodeid}',
            type: "post",
            /* 执行执行的是dom对象 ，不需要转化信息*/
            dataType: 'json',
            success: function (d) {
                console.log("降级成功");
                window.open("<%=basePath%>admin/node/" + d.nodeid + "?nodetype=1", "_self");
            },
            error: function (e) {
                console.log("失败");
            }
        });
    }

    </c:if>

    var markId = null;
    <c:if test="${not empty markId}">
    markId =${markId};
    </c:if>
    var fields = [];

    function change(object) {
        if (object.val() == '标记') {
            object.val('取消标记');
        }
        else {
            object.val('标记');
        }


    }

    function mark(object) {
        //标记
        if (markId == null) {
            $.ajax({
                url: '<%=basePath%>admin/node/mark/' + '${baseNode.nodeid}' + '/1',
                type: "post",
                dataType: 'json',
                success: function (d) {
                    markId = d.markId;
                    change(object);
                },
                error: function (e) {
                    console.log("失败");
                }
            });
        }
        else {
            $.ajax({
                url: '<%=basePath%>admin/node/mark/' + '${baseNode.nodeid}' + '/0',
                type: "post",
                dataType: 'json',
                data: {"markId": markId},
                success: function (d) {
                    markId = null;
                    change(object);
                },
                error: function (e) {
                    console.log("失败");
                }
            });
        }


    }

    function modifyCaseNode(id) {
        if($("#caseNodeForm").validate().form()){
            var form = new FormData($("#caseNodeForm")[0]);
            form.append("id", id);
            $.ajax({
                url: '<%=basePath%>admin/node/modifyCaseNode',
                type: "post",
                data: form,
                /* 执行执行的是dom对象 ，不需要转化信息*/
                processData: false,
                contentType: false,
                /* 指定返回类型为json */
                dataType: 'json',
                success: function (d) {
                    console.log("成功");
                    $(".modifyCaseNode").removeClass("hidden");
                },
                error: function (e) {
                    console.log("失败");
                }
            });
        }
        else {
            alert("请输入正确格式");
        }

    }

    function deleteFile(fileId, fileAddress) {
        $.ajax({
            url: '<%=basePath%>admin/node/deleteFile/' + fileId + "?fileAddress=" + fileAddress,
            type: "post",
            dataType: 'json',
            success: function (d) {
                console.log("删除成功");
                $("#" + fileId).remove();
            },
            error: function (e) {
                console.log("失败");
            }
        });
    }

    function modifyField() {
        var flag = $('#base').validate().form();
        var flag2 = $('#field').validate().form();
        if (flag&&flag2){
            $.each($("#field").children('.row'), function (index, item) {
                var data = new Object();
                data.englishname = $(item).find('.englishname').val();
                data.value = $(item).find('.value').val();
                data.tablename = $(item).find('.tablename').val();
                data.nodeid = $(item).find('.nodeid').val();
                fields.push(data);
            });
            var baseNodeData = new Object();
            baseNodeData.nodename = $('#nodename').val();
            baseNodeData.address = $('#address').val();
            baseNodeData.description = $('#description').val();
            baseNodeData.tableid = $('#tableid').val();
            baseNodeData.location = $('#location').val();
            baseNodeData.nodeid = $('#nodeid').val();

            $.ajax({
                url: '<%=basePath%>admin/node/modifyField/',
                type: "post",
                data: {"baseNodeData": JSON.stringify(baseNodeData), "fields": JSON.stringify(fields)},

                dataType: 'json',
                success: function (d) {
                    console.log("修改成功");
                    $(".modifyInfo").removeClass("hidden");
                    fields = [];
                },
                error: function (e) {
                    console.log("失败");
                }
            });

        }
       else {
            alert("请输入正确的格式")
        }
    }

    <c:if test="${nodetype==2}">
    var casesJson =${casesJson};
    var str = "";
    <c:if test="${user.id==caseNode.case1.grouperid or user.roleid!=2}">
    //组长或管理员可以设置案件信息
    $.each(casesJson, function (index, item) {
        str += "<option value='" + item.id + "'>" + item.casename + "</option>";
    });
    </c:if>
    <c:if test="${user.id!=caseNode.case1.grouperid and user.roleid==2}">
    str += "<option value='${caseNode.case1.id}'>${caseNode.case1.casename}</option>";
    </c:if>
    $("#caseselect").append(str);
    $("#caseselect").val(${caseNode.case1.id});
    $("#casecode").text('${caseNode.case1.casecode}');
    $("#casedescript").text('${caseNode.case1.description}');
    $("#casename").text('${caseNode.case1.casename}');
    $("#casetype").text('${caseNode.case1.casetype}');
    $("#caseselect").bind('change', function () {
        var value = $(this).val();
        console.log(value);
        $.each(casesJson, function (index, item) {
            if (item.id == value) {
                $("#casecode").text(item.casecode);
                $("#casedescript").text(item.description);
                $("#casename").text(item.casename);
                $("#casetype").text(item.casetype);
            }
        });
    })
    </c:if>
    $("#file-1").fileinput({
        language: 'zh', //设置语言
        theme: 'fa',
        uploadUrl: '<%=basePath%>/admin/node/uploadMultipleFile/${baseNode.nodeid}',
        allowedFileExtensions: ['jpg', 'png', 'gif', 'mp4', 'avi'],
        overwriteInitial: false,
        maxFileSize: 10 * 1000,
        uploadAsync: true,
        maxFilesNum: 10,
        allowedFileTypes: ['image', 'video'],
        slugCallback: function (filename) {
            return filename.replace('(', '_').replace(']', '_');
        }
    });
    //上传发生异常
    $('#file-1').on('fileuploaderror', function (event, data) {
        console.log(data);
        console.log('File upload error');
    });
    //上传成功
    $('#file-1').on('fileuploaded', function (event, data, previewId, index) {
        $(".uoloadFile").removeClass("hidden");
        console.log('File uploaded triggered');
    });
    console.log(${othersJson});
    $.each(${othersJson},function (index,item) {
        if(item.englishname!='nodeId'){
            $.validator.addMethod(""+item.regexid, function(value, element, params) {
                var str=""+item.regexp.regex;
                var check = new RegExp(str);
                return this.optional(element) || (check.test(value));
            }, item.regexp.description);
        }
    })
    var othersJson=${othersJson}
    validateRule();
    validField();

function validField() {
    rule="{";
    $.each(othersJson,function (index,item) {
        if(item.englishname!='nodeId') {
            rule += "\"" + item.englishname + "\"" + ":{\"required\":true,\"" + item.regexid + "\":true}";
            if(index!=othersJson.length-2){
                rule+=","
            }
        }
    });
    rule+="}"
    messages="{"
    $.each(othersJson,function (index,item) {
        if(item.englishname!='nodeId') {
            messages += "\"" + item.englishname + "\":{\"required\":\"不能为空\"}";
            if(index!=othersJson.length-2){
                messages+=","
            }
        }
    });
    messages+="}";
    var ruless = {
        onkeyup: function (element, event) {
            //去除左侧空格
            var value = this.elementValue(element).replace(/^\s+/g, "");
            $(element).val(value);
        },
        rules: JSON.parse(rule),
        messages:JSON.parse(messages),
        errorPlacement: function (error, element) { //指定错误信息位置
            if (element.is('select')) { //如果是radio或checkbox
                error.appendTo(element.parent().parent()); //将错误信息添加当前元素的父元素的父元素后面
            } else {
                error.insertAfter(element);
            }
        }
    };
    $("#field").validate(ruless);
}
    function validateRule() {
        var rule = {
            onkeyup: function (element, event) {
                //去除左侧空格
                var value = this.elementValue(element).replace(/^\s+/g, "");
                $(element).val(value);
            },
            rules: {
                nodename: {
                    required: true
                },
                address: {
                    required: true
                },
                location: {
                    required: true
                }
            },
            messages: {
                nodename: {
                    required: "请输入点位名称"
                },
                address: {
                    required: "请输入地址"
                },
                location: {
                    required: "请输入方向"
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
        var rule2={
            onkeyup: function (element, event) {
                //去除左侧空格
                var value = this.elementValue(element).replace(/^\s+/g, "");
                $(element).val(value);
            },
            rules: {
                alarmid: {
                    required: true,
                    digits:true,
                    rangelength:[1,11]
                }
            },
            messages: {
                alarmid: {
                    required: "请输入接处警编号"
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
        $("#base").validate(rule);
        $("#caseNodeForm").validate(rule2);
    }

</script>


</body>
</html>