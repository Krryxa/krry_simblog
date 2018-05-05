<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="../common/common.jsp" %>
<!doctype html>  
<html lang="en">  
    <head>  
        <!--网站编码格式，UTF-8 国际编码，GBK或 gb2312 中文编码-->  
        <meta http-equiv="content-type" content="text/html;charset=utf-8" />       
        <title>修改个人信息</title>  
        <style>  
            *{  
                margin: 0px;  
                padding: 0px;  
            }  
            /*布局开始*/   
            #register_dialog {  
                font-family: "黑体";
                  height: 640px;
  				  margin-top: 28px;
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
			<form id="formsw" action="${basePath}/admin/modify" method="post" onkeydown="if(event.keyCode==13)return false;">  
					<ul class="reg-box">
						<li>  
							<p>用户名</p>
							<input type="text"  class="user" name="username" maxlength="10" style="color:#999;" onBlur="textBlur(this)" onFocus="textFocus(this)"/>
							<span class="error error3"></span>  
						</li>
						<li>  
							<p>手    机</p>
							<input type="number" class="phone" name="phone" maxlength="11" style="color:#999;" onBlur="textBlur(this)" onFocus="textFocus(this)"/>
							<span class="error error1"></span>  
						</li>                              
						<li>  
							<p>原密码</p>
							<input type="password"  class="orpassword" maxlength="12" name="orpassword" style="color:#999;" onBlur="textBlur(this)" onFocus="textFocus(this)"/>
							<span class="error error3"></span>  
						</li>
						<li>  
							<p>新密码</p>
							<input type="password"  class="password" maxlength="12" name="password" style="color:#999;" onBlur="textBlur(this)" onFocus="textFocus(this)"/>
							<span class="error error3"></span>  
						</li>
						<li>  
							<p>确认新密码</p>
							<input type="password"  class="email" maxlength="12" style="color:#999;" onBlur="textBlur(this)" onFocus="textFocus(this)"/>
							<span class="error error4"></span>  
						</li>  
					</ul>  
			<div class="sub">  
				<input type="button" class="c_button" value="立即修改" onclick="sublimer()"/> 
				<input type="submit" id="submittt" style="display:none;"> 
			</div>
		</form>  
      </div>  
    </div>
	<!--尾部-->
	<%@include file="../common/footer.jsp" %>
	<script type="text/javascript">   
	
	//设置按钮提交后不可用
   	var form = document.getElementById("formsw");
   	form.submitted = false;
   	form.onsubmit=function(){
   		$(".c_button").val("修改中...");
   		//如果可提交，是false，不会进入此if
   		if(form.submitted) return false;
   		//设置不可提交
   		form.submitted = true;
   		return true;
   	};
   	
   	//五个表单正确输入的标志
   	var nameflag = false;
   	var phoneflag = false;
   	var orpassflag = false;
   	var passflag = false;
   	var repassflag = false;
   	
   	function sublimer(){
   		if(nameflag && phoneflag && orpassflag && passflag && repassflag) $("#submittt").click();
   	}
   	
   	
   	
    //文本框默认提示文字  
    function textFocus(el) {  
        if (el.defaultValue == el.value) { el.value = ''; el.style.color = '#333'; }  
    }  
    function textBlur(el) {  
        if (el.value == '') { el.value = el.defaultValue; el.style.color = '#999'; }  
    }  
  
    $(function(){   
        //注册页面的提示文字  
       (function register(){
		   //账号栏失去焦点
		    $(".reg-box .user").blur(function(){  
                if(!$(".user").val())  
                {  
                    $(this).addClass("errorC");  
                    $(this).next().html("请输入用户名");  
                    $(this).next().css("display","block");
                    nameflag = false;
                } 
                else   
                {  
                    $(this).removeClass("errorC");  
                    $(this).next().empty(); 
                    $(this).addClass("checkedN");
                    nameflag = true;
                }  
            });  
           //手机号栏失去焦点  
            $(".reg-box .phone").blur(function(){  
                reg=/^1[3|4|5|7|8][0-9]\d{4,8}$/i;//验证手机正则(输入前7位至11位)  
  
                if( $(this).val()==""|| $(this).val()=="请输入您的手机号")  
                {   
                    $(this).addClass("errorC");  
                    $(this).next().html("请输入您的手机号");  
                    $(this).next().css("display","block");
                    phoneflag = false;
                }  
                else if($(this).val().length<11)  
                {     
                    $(this).addClass("errorC");  
                    $(this).next().html("手机号长度有误");  
                    $(this).next().css("display","block");
                    phoneflag = false;
                }  
                else if(!reg.test($(".reg-box .phone").val()))  
                {     
                    $(this).addClass("errorC");  
                    $(this).next().html("手机号不存在");  
                    $(this).next().css("display","block");
                    phoneflag = false;
                }  
                else  
                {  
                    $(this).addClass("checkedN");  
                    $(this).removeClass("errorC");  
                    $(this).next().empty();
                    phoneflag = true;
                }  
            });
          //原密码栏失去焦点  
            $(".reg-box .orpassword").blur(function(){  
                reg=/^[\@A-Za-z0-9\!\#\$\%\^\&\*\.\~]{6,22}$/;  
                if(!reg.test($(".orpassword").val()))  
                {  
                    $(this).addClass("errorC");  
                    $(this).next().html("格式有误，请输入6~12位的数字、字母");  
                    $(this).next().css("display","block");
                    orpassflag = false;
                }  
                else   
                {  
                    $(this).removeClass("errorC");  
                    $(this).next().empty(); 
                    $(this).addClass("checkedN");
                    orpassflag = true;
                }  
            }); 
            //密码栏失去焦点  
            $(".reg-box .password").blur(function(){  
                reg=/^[\@A-Za-z0-9\!\#\$\%\^\&\*\.\~]{6,22}$/;  
                if(!reg.test($(".password").val()))  
                {  
                    $(this).addClass("errorC");  
                    $(this).next().html("格式有误，请输入6~12位的数字、字母");  
                    $(this).next().css("display","block");
                    passflag = false;
                }  
                else   
                {  
                    $(this).removeClass("errorC");  
                    $(this).next().empty(); 
                    $(this).addClass("checkedN");
                    passflag = true;
                }  
            });  
            /*确认密码失去焦点*/  
            $(".reg-box .email").blur(function(){  
                var pwd1=$('.reg-box input.password').val();  
                var pwd2=$(this).val();  
                if(pwd1 != pwd2){  
                    $(this).addClass("errorC");  
                    $(this).removeClass("checkedN");  
                    $(this).next().html("两次密码输入不一致！");  
                    $(this).next().css("display","block");
                    repassflag = false;
                }  
                else   
                {  
                    $(this).removeClass("errorC");  
                    $(this).next().empty();  
                    $(this).addClass("checkedN");
                    repassflag = true;
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