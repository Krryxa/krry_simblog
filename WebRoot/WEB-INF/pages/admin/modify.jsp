<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../common/common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>修改个人信息</title>
  </head>
  
  <body>
    	<a href="${basePath}/blog/index">博客首页</a>
    	<form action="${basePath}/admin/modify" method="post">
    		用户名：<input type="text" value="${user.username}" name="username"><br>
    		联系方式：<input type="number" value="${user.phone}" name="phone"><br>
    		请输入原密码：<input type="password"><br>
    		新密码：<input type="password" name="password"><br>
    		确认密码：<input type="password"><br>
    		<input type="submit" value="确认修改">
    		<a href="${basePath}/blog/index">返回首页</a>
    	</form>
    	
    	<script type="text/javascript" src="${basePath}/resource/js/jquery-1.11.2.min.js"></script>
    	<script type="text/javascript">
    		
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