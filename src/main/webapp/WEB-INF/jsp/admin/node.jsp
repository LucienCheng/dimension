<%@ page import="java.util.*" contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
        href="<%=basePath %>source/assets/plugins/bootstrap/css/bootstrap.min.css"
        rel="stylesheet">
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container-fluid">


    <!-- Start Page Content -->

    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-block">
                    <form>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group row">
                                    <label for="inputEmail3" class="col-sm-2 form-control-label">Email</label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" id="inputEmail3"
                                               placeholder="Email">
                                    </div>
                                    <div class="col-sm-2"></div>
                                    <div class="col-sm-10" style="margin-top: 10px;">
                                        <select class="c-select">
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
                                    <label for="inputEmail3" class="col-sm-2 form-control-label">Email</label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" placeholder="Email">
                                    </div>
                                    <div class="col-sm-2"></div>
                                    <div class="col-sm-10" style="margin-top: 10px;">
                                        <button type="submit" class="btn btn-info">搜索</button>
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

                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Username</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td>Deshmukh</td>
                                <td>Prohaska</td>
                                <td>Prohaska</td>
                                <td>
                                    <button type="submit" class="btn btn-danger">删除</button>
                                    <button type="submit" class="btn btn-warning">查看</button>
                                </td>

                            </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-12">

            <ul class="pagination">
                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>

        </div>
    </div>

    <!-- End PAge Content -->

</div>
<script src="<%=basePath %>source/assets/plugins/jquery/jquery.min.js"></script>
<script
        src="<%=basePath %>source/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>