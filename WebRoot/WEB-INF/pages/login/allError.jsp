<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="../common/common.jsp" %>
<!DOCTYPE HTML>
<html>
  <head>
    
    <title>错误</title>

  </head>
	<style>
		.aiefjaewf{
			    position: absolute;
			    top: 240px;
			    left: 50%;
			    cursor: pointer;
			    font-size:20px;
			    margin-left: -16px;
			    -webkit-text-fill-color: transparent;
			    background: -webkit-gradient(linear,left top,left bottom,from(#d6560b),to(#ce21b8));
			    -webkit-background-clip: text;
		}
		p{
		line-height:500px;
		text-align:center;
		-webkit-text-fill-color: transparent;
	    background: -webkit-gradient(linear,left top,left bottom,from(#d6560b),to(#ce21b8));
	    font-size: 38px;
	    -webkit-background-clip: text;}
	</style>
  <body>
   <%@include file="../common/header.jsp" %>
    <span class="aiefjaewf c_button" onclick="go()">返回</span>
   	<p>错误提示：${msg}</p>
   <!--尾部-->
	<%@include file="../common/footer.jsp" %>
  	<script>
  		function go(){
  			window.location.href = document.referrer;//返回上一页并刷新  
  		}
  	</script>
  </body>
</html>
