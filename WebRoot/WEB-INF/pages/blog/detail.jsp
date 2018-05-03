<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../common/common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>${blog.title}</title>
  </head>
  
  <body>
    	<a href="${basePath}/blog/index">博客首页</a>
    	<h2>${blog.title}</h2>
		<p>作者：${blog.username}</p>
		<p>发表时间：${blog.createTime}</p>
		<p>${blog.content}</p>
    	
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