<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../common/common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>博客首页</title>
  </head>
  
  <body>
    	欢迎进入博客首页
    	<a href="${basePath}/blog/addBlog">添加博客</a>
    	<a href="${basePath}/admin/index?id=${user.id}">修改个人信息</a>
    	<span>欢迎：${user.username}</span>
    	<a href="${basePath}/login/logout">退出登录</a>
    	<ul>
	    	<c:forEach items="${blogList}" var="list">
	    		<li>
	    			<a href="${basePath}/blog/detail?id=${list.id}">
		    			<p>标题：${list.title}</p>
		    			<p>作者：${list.username}</p>
		    			<p>发表时间：${list.createTime}</p>
		    			<p>${list.content}（这里要控制一行，多出来用省略号代替）</p>
	    			</a>
	    		</li>
	    	</c:forEach>
    	</ul>
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