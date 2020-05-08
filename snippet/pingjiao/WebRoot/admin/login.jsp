<%@ page import="com.dao.bll.SystemParam"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>系统登录</title>
		<style type="text/css">
    		body{
       			background-color:#3b5d88;
    		}
    		.check-span {
    			margin-left: 16px;
    		}
    		.check-span .check-input {
    			margin-top: 8px;
    		}
		</style>
		<link href="<%=SystemParam.getSiteRoot() %>/webui/bootstrap/css/bootstrap.css" rel="stylesheet" />
    	<link href="<%=SystemParam.getSiteRoot() %>/webui/bootstrap/css/font-awesome.css" rel="stylesheet" />
    	<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/admin/css/style.css">
		<script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js"></script>
		<script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validate.min.js" type="text/javascript"></script>
		<script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.metadata.js" type="text/javascript"></script>
    	<script type="text/javascript"> 
  			if(top.window!=window)
    	   		top.location.href="login.jsp";
      
      		$(function(){
      			$("#btnReloadImage,#imgvc").on("click",function () {
					$("#imgvc").prop("src", "../tools/image.jsp?time="+new Date().getMilliseconds());
				});
           		$("#loginForm").submit(function(){
              		//alert($("#txtUsername").val());
               		if($("#txtUsername").val()==""){
                  		alert("用户名不能为空");
                  		return false;
               		}
               		return true;
           		});
          	})
 		</script>

	</head>
	
	<body>
  		<form method="post" action="<%=SystemParam.getSiteRoot() %>/admin/login.do" id="loginForm">
        	<input type="hidden" name="actiontype" value="login" />
           	<input type="hidden" name="forwardurl"   value="/admin/index.jsp"/>
   			<div class="header">
            		<div class="logo-font" style="position:absolute;font-weight:666;left:20px;top:50%;transform:translateY(-50%);">
						<strong>在线评教系统</strong>
					</div>
			</div>

    		<div style="padding-right: 20px;">
				<div class="row">
            		<div class="col-sm-4"></div>
            		<div class="col-sm-4  form-box">
            			<div id="login-loading" class="loading-mask">
                    		<div class="loading-icon"></div>
                    		<div class="loading-mask-body"></div>
                		</div>
						<div class="form-top">
                    		<div class="form-top-left">
                        		<h3>Login</h3>
							</div>
						</div>
						<div class="form-content">
							<form id="login-form" action="/Admin/AdminUser/Login" method="post">
                        		<input type="hidden" name="actiontype" value="login" />
                        		<div class="input-group">
                            		<label class="input-group-addon dl-icon-left">
                                		<i class="fa fa-user dl-icon"></i>
                            		</label>
                            		<input type="text" name="username" style="font-size:18px;font-weight:600;" placeholder="系统账号" value="${username}" class="form-control">
                        		</div>
                        		<div class="input-group">
                            		<label class="input-group-addon dl-icon-left">
                                		<i class="fa fa-lock dl-icon"></i>
                            		</label>
                            		<input type="password" name="password" style="font-size:18px;font-weight:600;" value="${password}" placeholder="登陆密码" class="form-control">
                        		</div>
                        		<div class="input-group">
                            		<label class="input-group-addon dl-icon-left">
                               			<i class="fa fa-lock dl-icon"></i>
                            		</label>
                            		<span class="check-span"><input class="check-input" name="usertype" value="0" type="radio" checked="checked">管理员 </span>
									<span class="check-span"><input class="check-input" name="usertype" value="1" type="radio" >学生</span>
									<span class="check-span"><input class="check-input" name="usertype" value="2" type="radio" >教师</span>
                        		</div>
								<div class="input-group">
									<label style="padding:0px;" class="input-group-addon dl-icon-left">
										<img id="imgvc" class='validatecode' src="../tools/image.jsp" width="70" height="47" alt="图片看不清？点击重新得到验证码" style="cursor:pointer;" />
                            		</label>
                            		<input type="text" name="validcode" value="${validcode}" style="font-size:18px;font-weight:600;" placeholder="验证码" class="form-input form-control">
                            		<span id="btnReloadImage" style="cursor:pointer;" class="input-group-addon dl-icon-left">
                               	 		看不清换一组
                            		</span>
                        		</div>
                        		<div style="text-align: center;">
                            		<button type="submit" id="btnLogin" class="login-button">登陆</button>
                        		</div>
                       			<div id="error-container">
                            		${errmsg}
                        		</div>
                    		</form>
                		</div>
                 		<div class="col-sm-4"></div>
            		</div>
        		</div>
    		</div>

			<!-- Javascript -->
			<script src="<%=SystemParam.getSiteRoot() %>/webui/bootstrap/js/bootstrap.min.js"></script>
    	</form>
	</body>
</html>