<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${basePath}/resource/font/iconfont.css" />
<link rel="stylesheet" href="${basePath}/resource/css/header.css" />
<div class="header">
	<div class="heardbox">
		<div class="c_left">
			<a href="${basePath}/blog/index" class="logo"><img src="${basePath}/resource/images/krrylogo.png" width="60" title="krrylogo"></a>
			<ul class="nav">
				<li><a href="${basePath}/blog/index"><i class="iconfont icon-yingsaitong" style="margin-right: 3px;"></i>首页</a></li>
			</ul>
		</div>
		<div class="c_right" id="loginbox">
			<div id="logininin">
				<a href="${basePath}/blog/addBlog">添加</a>
				<span>欢迎：</span><a href="${basePath}/admin/index?id=${user.id}" id="liginuser">${user.username}</a>
				<a href="${basePath}/login/logout" style="margin-right:0px;">退出</a>
			</div>
			<div id="loginnono">
				<a clas="c_r_aa" href="${basePath}/login/index">登陆</a>
				<a clas="c_r_aa" href="${basePath}/login/rege">注册</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	var user = document.getElementById("liginuser");
	if(user.innerText){
		document.getElementById("logininin").style.display = "block";
		document.getElementById("loginnono").style.display = "none";
	}
</script>


