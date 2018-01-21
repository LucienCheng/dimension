<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/dimension/source/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script src="/dimension/source/js/jquery-3.2.1.min.js"></script>
<script src="/dimension/source/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">

function getUrl(){
var url = document.location.toString();
var arrUrl=url.split("/achievement");
return arrUrl[1];
}
$(function() {
var authorName = '${condition.authorName}';
					var achStatus = '${condition.achStatus}';
					var achStartTime = '${condition.achStartTime}';
					var achEndTime = '${condition.achEndTime}';
		var curPage = ${curPage};
		var totalPage = ${totalPage};
		var s = "<ul>";
		if (${curPage} == 1)
			s += "<li class='active'><a href='javascript:void(0) '>上一页</a></li>";
		else {
			s += "<li ><a  href='javascript:void(0)'rel=" + (${curPage} - 1)
					+ ">上一页</a></li>";
		}

		//如果总的页数在6页只能就可以这样
		if (totalPage <= 6) {
			for (var i = 1; i <= totalPage; i++) {
				if (${curPage} == i) {
					s += "<li class='active'><a href='javascript:void(0)'>" + i
							+ "</a></li>";
				} else {
					s += "<li ><a href='javascript:void(0)'rel=" + i + ">" + i
							+ "</a></li>";
				}
			}

		}
		//这个是页面大于6的时候
		else {
			var base = 0;
			if ((curPage - 3 >= 0) && (curPage + 3 <= totalPage))
				base = curPage - 3;
			else if ((curPage + 3) > totalPage) {

				base = totalPage - 6;

			}

			for (var i = base + 1; i <= base + 6; i++) {
				if (${curPage} == i) {
					s += "<li class='active'><a href='javascript:void(0)'>" + i
							+ "</a></li>";
				} else {
					s += "<li ><a href='javascript:void(0)'rel=" + i + ">" + i
							+ "</a></li>";
				}
			}
		}

		if (${curPage} >= ${totalPage})
			s += "<li class='active'><a href='javascript:void(0)'>下一页</a></li>";
		else {
			s += "<li ><a  href='javascript:void(0)'rel=" + (${curPage} + 1)
					+ ">下一页</a></li>";
		}

		s += "</ul>";
		$("#pagecount").html(s);

		$("#pagecount ul li a").bind(
				'click',
				function() {
					var rel = $(this).attr("rel");
					
					var u = "/achievement/front/HotAchievement/" + rel + "?authorName="
							+ authorName + "&achStartTime=" + achStartTime
							+ "&achEndTime=" + achEndTime + "&achStatus="
							+ achStatus;
					if (rel != undefined) {
						window.open(u, "_self");

					}
				});
				$(".achId a").bind("click",function(){
				var url=getUrl();
				var rel = $(this).attr("rel");
				
				var u = "/achievement/front/"+ rel + "/video?authorName="
							+ authorName + "&achStartTime=" + achStartTime
							+ "&achEndTime=" + achEndTime + "&achStatus="
							+ achStatus+"&Url="+url;
				console.log(u);
						window.open(u,"_self");
				});

	});
</script>
</head>
<body>
	<div class="span12">
		<div class="pagination" id="pagecount"></div>
	</div>
</body>
</html>