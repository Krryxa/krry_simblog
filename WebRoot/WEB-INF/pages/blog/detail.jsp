<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="../common/common.jsp" %>
<!doctype html>
<html lang="en">
	<head>
		<!--申明当前页面编码集：中文编码:GBK/GB2312 国际编码:UTF-8-->
		<meta http-equiv="content-type" content="text/html" charset="UTF-8">
		<!--申明当前页面三要素-->
		<meta name="Keywords" content="关键字,关键词">
		<meta name="Description" content="描述和简介">
		<title>${blog.title}</title>
		<style type="text/css">
			body,h1,h2,h3,h4,h5,h6,dl,dt{margin:0;padding:0;}
			ol,ul,li{margin:0;padding:0;list-style:none;}
			img{border:none;}
			a{text-decoration:none;}
			body{font-size:20px;background:#f0f0f0;}
			
			.center{min-height:500px;width:960px;margin:10px auto;}
			/*content的样式*/
			.content{min-height: 397px;width:570px;padding: 12px;background:#fff;margin: 40px 15px;margin-bottom: 80px;float:left;}
			.content .con_header{font-size:24px;text-align:center;font-weight:bold;margin: 7px;}
			.content .desc{font-size:16px;color: #5a5a5a;line-height: 26px;padding: 11px;}
			.con_sta{font-size:14px;line-height: 57px;color:#737373;text-align:center;}
			/*aside的样式*/
			.aside{width:290px;height:370px;margin:40px 29px;margin-right: 15px;background: #fff;float:left;font-size:14px;font-family:"微软雅黑";}
			.aside strong{font-family: "微软雅黑";font-size: 16px;}
			.aside .about{margin:15px 17px;}
			.aside .connect{margin:15px 17px;}
			.aside .connect ul li{margin:5px 5px;font-size:12px;}
		</style>
	</head>
<body>
	<!--头部-->
	<%@include file="../common/header.jsp" %>
	<div class = "center">
		<div class = "content">
			<p class = "con_header">${blog.title}</p>
			<p class = "con_sta">${blog.username}&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;${blog.createTime}</p>
			<p class="desc">${blog.content}</p>
		</div>
		<div class = "aside">
			<div class = "about">
				<p><strong>关于我们</strong></p>
				<p style="margin-top: 7px;color: #808080;">乐诗博客是一个日记分享平台，我们致力于让用户发表自己的心情，分享自己喜爱的事物，聆听你我的声音。<br>专注与为海大学生服务，在这里你可以分享校园，分享周边，分享考研，分享学习，分享生活</p>
			</div>
			<div class = "connect">
				<p><strong>联系我们</strong></p>
				<img  width="168"; src="https://www.ainyi.com/resource/images/myqrcode.jpg">
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<!--尾部-->
	<%@include file="../common/footer.jsp" %>
</body>
</html>

