<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../common/common.jsp" %>
<!doctype html>
<html lang="en">
	<head>
		<!--申明当前页面编码集：中文编码:GBK/GB2312 国际编码:UTF-8-->
		<meta http-equiv="content-type" content="text/html" charset="UTF-8">
		<!--申明当前页面三要素-->
		<meta name="Keywords" content="关键字,关键词">
		<meta name="Description" content="描述和简介">
		<title>乐诗论坛</title>
		<style type="text/css">
			body,h1,h2,h3,h4,h5,h6,dl,dt{margin:0;padding:0;}
			ol,ul,li{margin:0;padding:0;list-style:none;}
			img{border:none;}
			a{text-decoration:none;}
			body{font-size:20px;background:#f0f0f0;}

			.center{width:960px;margin:10px auto;}
			/*content的样式*/
			.content{position:relative;margin-bottom: 100px;min-height: 380px;width:624px;margin-top: 24px;float:left;}
			h3 a{font-size: 20px;color: #000;}
			.content .item{padding: 12px;background:#fff;margin:15px 15px;}
			.content .item h3{font-size:14px;padding: 3px 10px;margin-bottom: 4px;}
			.content .item .item_summary{height:70px;font-size:12px;line-height: 19px;overflow:hidden;margin:10px 5px;margin-top: 5px;}
			.content .item .item_summary .desc{color:#808080;margin-top: 3px;margin-left: 56px;display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 2;overflow: hidden;}
			.content .item .item_summary a{float:left;display:inline-block;margin-right:14px;}
			.content .item .item_foot{height:24px;margin:0 10px;font-size:12px;}
			/*aside的样式*/
			.aside{width:290px;height:370px;margin:40px 29px;margin-right: 15px;background: #fff;float:left;font-size:14px;font-family:"微软雅黑";}
			.aside strong{font-family: "微软雅黑";font-size: 16px;}
			.aside .about{margin:15px 17px;}
			.aside .connect{margin:15px 17px;}
			.aside .connect ul li{margin:5px 5px;font-size:12px;}
			
			/*分页相关*/
			.tzPage{font-size: 12px;position: absolute;right: 10px;bottom: -60px;}
    		
    		#tbody tr:hover{background:#eaeaea;}
    		#tbody .t_mode{padding-right:4px;}
    		#tbody .t_avbiaoq:hover{color:#FF6857;transition:.4s}
    		#tbody .t_dele{padding-left:4px;}
    
			.tzPage a{text-decoration:none;border:none;color:#7d7d7d;background-color:#f2f2f2;border-radius: 3px;}
			.tzPage a:hover{background:#dd5862;color:#FFF;}
			.tzPage a,.tzPage span{display:block;float:left;padding:0em 0.5em;margin-right:5px;margin-bottom:5px;min-width:1em;text-align:center;line-height: 22px;height: 22px;}
			.tzPage .current{background:#dd5862;color:#FFF;border:none;border-radius: 3px;}
			.tzPage .current.prev,.tzPage .current.next{color:#999;border:1px solid #e5e5e5;background:#fff;}
			.tm_psize_go{margin-right:4px;float:left;height:24px;line-height:33px;position:relative;border:1px solid #e5e5e5;color:#999}
			#tm_pagego{border-radius:3px;height:18px;width:30px;float:left;text-align:center;border:1px solid #e5e5e5;line-height: 22px;color:#999}
			.sortdesc{border-top:5px solid;width:0px;height:0px;display:inline-block;vertical-align:middle;border-right:5px solid transparent;border-left:5px solid transparent;margin-left:5px;}
			.sortasc{border-bottom:5px solid;width:0px;height:0px;display:inline-block;vertical-align:middle;border-right:5px solid transparent;border-left:5px solid transparent;margin-left:5px;}
			.red{color:red}	
			.green{color:green}
			
			.hideAdd{height: 300px;
				    text-align: center;
				    line-height: 300px;
				    margin-top: 16px;display:none;}
			.hideAdd a{font-size:28px;-webkit-text-fill-color:transparent;background: -webkit-gradient(linear,left top,left bottom,from(#FD0051),to(#A22C93));-webkit-background-clip: text;}
		</style>
	</head>
<body>
	<!--头部-->
	<%@include file="../common/header.jsp" %>
	<!--中间-->
	<div class="center">
		<div class="content" data-count="${count}">
			<div class="innertext">
				<c:forEach items="${blogList}" var="list">
					<div class = "item">
						<div class = "item_summary">
							<a href ="${basePath}/blog/detail?id=${list.id}"><img src="${basePath}/resource/images/txt.png" width="70" /></a>
							<h3><a href="${basePath}/blog/detail?id=${list.id}">${list.title}</a></h3><br>
							<p class="desc">${list.content}</p>
						</div>
						<div class = "item_foot">
							<a href ="javascript:void(0)" style="color: #c74714;">${list.username}</a>
							发布于  ${list.createTime}
						</div>
					</div>
				</c:forEach>
			</div>
			<div id="krryPage"></div>
		</div>
		
		<div class = "aside">
			<div class = "about">
				<p><strong>关于我们</strong></p>
				<p style="margin-top:7px;color: #808080;">乐诗博客是一个日记分享平台，我们致力于让用户发表自己的心情，分享自己喜爱的事物，聆听你我的声音。<br>专注与为海大学生服务，在这里你可以分享校园，分享周边，分享考研，分享学习，分享生活</p>
			</div>
			<div class = "connect">
				<p><strong>联系我们</strong></p>
				<img  width="168"; src="https://www.ainyi.com/resource/images/myqrcode.jpg">
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<br clear = "all" />
	<!--尾部-->
	<%@include file="../common/footer.jsp" %>
	<script type="text/javascript" src="${basePath}/resource/js/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="${basePath}/resource/js/krry_page.js"></script>
	<script>
		var basePath = "${basePath}";
		var krryAdminBlog = {
			initPage:function(itemCount){
				$("#krryPage").tzPage(itemCount, {
					num_display_entries : 5, //主体页数
					num_edge_entries : 4,//边缘页数
					current_page : 0,//指明选中页码
					items_per_page : 5, //每页显示多少条
					prev_text : "上一页",
					next_text : "下一页",
					showGo:true,//显示
					showSelect:false,
					callback : function(pageNo, psize) {//会回传两个参数，第一个是当前页数，第二个是每页要显示的数量
						krryAdminBlog.loadData(pageNo,psize);
					}
				});
			},

			loadData:function(pageNo,pageSize){
				pageNo++;
				$.ajax({
					type:"post",
					url:basePath+"/blog/loadData",
					data:{currentPage:pageNo,pageSize:pageSize},
					success:function(data){
						if(data){
							var html = "";
							var blogArr = data.blogs;
							for(var i=0,len=blogArr.length;i < len;i++){
								var list = blogArr[i];
								html+= "<div class = 'item'>"+
									"<div class = 'item_summary'>"+
									"<a href ='${basePath}/blog/detail?id="+list.id+"'><img src='${basePath}/resource/images/txt.png' width='70' /></a>"+
									"<h3><a href='${basePath}/blog/detail?id="+list.id+"'>"+list.title+"</a></h3><br>"+
									"<p class='desc'>"+list.content+"</p>"+
								"</div>"+
								"<div class = 'item_foot'>"+
									"<a href ='javascript:void(0)' style='color: #c74714;'>"+list.username+"</a> "+
									"发布于 "+list.createTime+
								"</div>"+
							"</div>";
							}
							$(".innertext").html(html);
						}
					}
				});
			}
		};
		
		krryAdminBlog.initPage($(".content").data("count"));
	</script>
</body>
</html>



