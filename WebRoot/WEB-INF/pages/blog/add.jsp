<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>添加页面</title>
  </head>
  
  <body>
    	添加页面
    	<form action="${basePath}/blog/saveBlog" method="post">
	    	<input type="text" placeholder="输入标题" name="title"/><br>
	    	<textarea placeholder="输入 内容" name="content"></textarea>
	    	<input type="submit" value="保存并发表">
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