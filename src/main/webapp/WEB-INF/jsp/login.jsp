<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath %>/source/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=basePath %>/source/assets/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=basePath %>/source/assets/plugins/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=basePath %>/source/scss/icons/font-awesome/css/font-awesome.min.css" rel="stylesheet"
          type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->


</head>

<body>

<div class="container">
    <div class="row">

        <div class="col-md-4 col-md-offset-4">

            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Please Sign In</h3>
                </div>
                <div class="panel-body">
                    <div class="hidden alert alert-danger alert-dismissible fade in" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                            <span class="sr-only">Close</span>
                        </button>
                        <strong>登录失败!</strong>检查一下你的密码以及用户级别
                    </div>
                    <form role="form" method="post" action="verifyLogin">
                        <fieldset>

                            <div class="form-group" id="identityid-group">
                                <input class="form-control" placeholder="身份证" name="identityid" type="text"
                                       autofocus>
                            </div>
                            <div class="form-group" id="password-group">
                                <input class="form-control" placeholder="密码" name="password" type="password"
                                       value="">
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input name="remember" type="checkbox" value="Remember Me">记住我
                                </label>
                            </div>
                            <!-- Change this to a button or input when using this as a form -->
                            <input class="btn btn-lg btn-success btn-block" value="登陆" type="submit">
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="<%=basePath %>/source/assets/plugins/bootstrap/js/tether.min.js"></script>
<!-- jQuery -->
<script src="<%=basePath %>/source/assets/plugins/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath %>/source/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath %>/source/assets/plugins/metisMenu/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="<%=basePath %>/source/assets/plugins/dist/js/sb-admin-2.js"></script>
</body>
<script type="text/javascript">
    var judge='${error}';
    if(judge=="error"){
        $("#identityid-group").addClass("has-error");
        $("#password-group").addClass("has-error");
        $(".alert").removeClass("hidden");
        $(".alert").addClass("show");
    }
</script>
</html>
