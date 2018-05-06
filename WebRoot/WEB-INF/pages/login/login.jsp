<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="../common/common.jsp" %>
<!doctype html>  
<html lang="en">  
    <head>  
        <!--网站编码格式，UTF-8 国际编码，GBK或 gb2312 中文编码-->  
        <meta http-equiv="content-type" content="text/html;charset=utf-8" />       
        <title>登录</title>  
        <style>  
            *{  
                margin: 0px;  
                padding: 0px;  
            }  
            /*布局开始*/   
            #register_dialog {  
                font-family: "黑体";
                  height: 460px;
  				  margin-top: 40px;
                -moz-user-select:none; /*火狐*/  
                -webkit-user-select:none; /*webkit浏览器*/  
                -ms-user-select:none; /*IE10*/  
                -khtml-user-select:none; /*早期浏览器*/  
                user-select:none;  
            }  
  
            .register_dialog_info {  
                float: left;  
                margin-left:10px;  
                color: #fff;  
                margin-top: 5px;  
                font-size: 20px;  
            }  
            .dialog_close {  
                cursor: pointer;  
                width: 40px;  
                height:40px;  
                border-radius:25px;  
                float: right;  
                line-height:40px;  
                font-size: 20px;  
                color: #d8dadb;  
                font-family: "微软雅黑";  
                text-align: center;  
                cursor:center;  
            }  
            form{padding: 20px 0px;}  
            ul li {list-style: none;}  
            .sub {  
                text-align: center;  
            }  
            .sub input {  
                display: inline-block;  
                width: 100%;  
                color: rgb(255, 255, 255);  
                font-size: 20px;  
                text-align: center;  
                height: 40px;  
                line-height: 40px;  
                font-family: 黑体;  
                outline: none;  
                border: none;  
                background: #ef9e48;
   				border-radius: 5px;
                margin: auto;  
            }  
            .dialog_close:hover {  
                background-color: #566  
            }  
            input[type = "submit"]:hover{cursor: pointer;}  
            /*布局结束*/  
  
            .reg-box li {line-height: 26px; width: 100%; overflow: hidden; height: 100px;}  
  
  			.reg-box li span{font-size:14px;color:red;}
            .reg-box li input{outline:none;border-radius:4px;padding: 6px 0; font-size: 16px; width: 99%; height: 28px; line-height: 28px; border: 1px solid #dddddd; text-indent: 0.5em; float: left; }  
  
            .registered .btn a { background: #ff7200; margin-left: 110px; }  
              
       		 .c_button{cursor:pointer;transition:.4s;}
       		 .c_button:hover{background:red;transition:.4s;}
       		 .changes{float: right;margin-top: 14px;color: #000;transition:.4s;}
       		 .changes:hover{color:red;transition:.4s;}
              
        </style>  
        <!--css js 文件的引入-->  
		<script type = "text/javascript" src="${basePath}/resource/js/jquery-1.11.2.min.js"></script>
    </head>  
    <body>
    <%@include file="../common/header.jsp" %>
    <div id="register_dialog">  
        <div style="width: 300px;margin:10px auto;">  
			<form id="formsw" action="${basePath}/login/logined" method="post" onkeydown="if(event.keyCode==13)return false;">  
					<ul class="reg-box">
						<li>  
							<p>用户名</p>
							<input type="text" class="user" name="username" maxlength="10" style="color:#999;" onBlur="textBlur(this)" onFocus="textFocus(this)"/>
							<span class="error error3"></span>  
						</li>                             
						<li>  
							<p>密    码</p>
							<input type="password" class="password" name="password" maxlength="12" style="color:#999;" onBlur="textBlur(this)" onFocus="textFocus(this)"/>
							<span class="error error3"></span>  
						</li>  
					</ul>  
			<div class="sub">  
				<input type="button" class="c_button" value="立即登录" onclick="sublimer()"/> 
				<input type="submit" id="submittt" style="display:none;"> 
			</div>  
			<a href="${basePath}/login/rege" class="changes">没有账号？点击注册</a>
		</form>  
      </div>  
    </div>
	<!--尾部-->
	<%@include file="../common/footer.jsp" %>
	<script type="text/javascript">   
	
	//避免表单重复提交
   	var form = document.getElementById("formsw");
   	form.submitted = false;
   	form.onsubmit=function(){
   		$(".c_button").val("登录中...");
   		//已提交属性：true，所以提交后，一直返回false，从而阻止重复提交
   		if(form.submitted) return false;
   		form.submitted = true;
   		return true;
   	};
   	
   	//两个表单正确输入的标志
   	var nameflag = false;
   	var passflag = false;
   	
   	//点击提交
   	function sublimer(){
   		if(nameflag && passflag) $("#submittt").click();
   	}
   	
   	
   	
    //文本框默认提示文字  
    function textFocus(el) {  
        if (el.defaultValue == el.value) { el.value = ''; el.style.color = '#333'; }  
    }  
    function textBlur(el) {  
        if (el.value == '') { el.value = el.defaultValue; el.style.color = '#999'; }  
    }  
  
    $(function(){   
    	//登录页面的提示文字  
       //账户输入框失去焦点  
       (function login_validate(){  
           $(".reg-box .user").blur(function(){  
               if( $(this).val()==""){   
                   $(this).addClass("errorC");  
                   $(this).next().html("请输入用户名");  
                   $(this).next().css("display","block");
                   nameflag = false;
               }     
               else{  
                   $(this).addClass("checkedN");  
                   $(this).removeClass("errorC");  
                   $(this).next().empty();
                   nameflag = true;
               }  
           });  
           /*密码输入框失去焦点*/  
           $(".reg-box .password").blur(function(){  
               if($(this).val() == ""){  
                   $(this).addClass("errorC");  
                   $(this).next().html("请输入密码");  
                   $(this).next().css("display","block");  
                   passflag = false;
               }else{  
                   $(this).addClass("checkedN");  
                   $(this).removeClass("errorC");  
                   $(this).next().empty(); 
                   passflag = true;
               }  
           });
       })();  
    });   
  
    /*清除提示信息*/  
    function emptyRegister(){
        $(".reg-box .phone,.reg-box .phonekey,.reg-box .password,.reg-box .email").removeClass("errorC");;  
        $(".reg-box .error1,.reg-box .error2,.reg-box .error3,.reg-box .error4").empty();  
    }  
    function emptyLogin(){
        $(".reg-box .account,.reg-box .admin_pwd,.reg-box .photokey").removeClass("errorC");;  
        $(".reg-box .error5,.reg-box .error6,.reg-box .error7").empty();  
    }  
  
</script> 
</body>  
</html>  