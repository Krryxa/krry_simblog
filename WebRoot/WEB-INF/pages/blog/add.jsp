<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>
<!DOCTYPE HTML>
<html>
  <head>
    <title>添加博客</title>
    <style type="text/css">
		body,h1,h2,h3,h4,h5,h6,dl,dt{margin:0;padding:0;}
		ol,ul,li{margin:0;padding:0;list-style:none;}
		img{border:none;}
		a{text-decoration:none;}
		body{font-size:20px;background:#f0f0f0;}
		
		.center{min-height:500px;width:960px;margin:10px auto;}
		/*content的样式*/
		.content{width:570px;padding: 12px;background:#fff;margin:39px 15px;float:left;}
		.content .c_title{    width: 100%;
					    height: 50px;
					    outline: none;
					    border: 1px solid #bdbdbd;
					    border-radius: 4px;
					    text-align: center;
					    font-size: 20px;}
		.content .c_desc{   resize: none; width: 549px;
				    height: 320px;
				    outline: none;
				    border: 1px solid rgb(189, 189, 189);
				    border-radius: 4px;
				    margin: 20px 0px 0px;
				    font-size: 20px;
				    padding: 10px;
				    font-family: "微软雅黑";
				    line-height: 26px;
				    font-size: 16px;}
		.c_button{
			margin: 28px auto;
		    display: block;
		    width: 100%;
		    height: 41px;
		    cursor: pointer;
		    outline: none;
		    border: 0;
		    background: #4d8aca;
		    color: #fff;transition:.3s;
		    border-radius: 7px;}
		.c_button:hover{transition:.3s;background:#dd5862;}
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
			<form id="formsw" action="${basePath}/blog/saveBlog" method="post">
		    	<input type="text" placeholder="输入标题" name="title" maxlength="17" required  class="c_title"/><br>
		    	<textarea placeholder="输入 内容" name="content" class="c_desc" required ></textarea>
		    	<input type="submit" class="c_button" value="保存并发表">
		   	</form>
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
   	<script type="text/javascript" src="${basePath}/resource/js/jquery-1.11.2.min.js"></script>
   	<script type="text/javascript">
   		
   		//设置按钮提交后不可用
	   	var form = document.getElementById("formsw");
	   	form.submitted = false;
	   	form.onsubmit=function(){
	   		$(".c_button").val("发表中...");
	   		if(form.submitted) return false;
	   		form.submitted = true;
	   		return true;
	   	}
   	
   		/**
   		 * 判断非空
   		 * 
   		 * @param val
   		 * @returns {Boolean}
   		 */
   		function isEmpty(val) {
   			val = $.trim(val);
   			if (val == null)
   				return true;
   			if (val == undefined || val == 'undefined')
   				return true;
   			if (val == "")
   				return true;
   			if (val.length == 0)
   				return true;
   			if (!/[^(^\s*)|(\s*$)]/.test(val))
   				return true;
   			return false;
   		}

   	</script>
  </body>
</html>