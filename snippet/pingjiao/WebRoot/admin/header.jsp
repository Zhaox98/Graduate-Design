<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dao.bll.*,com.dao.entity.*" %>

<script type="text/javascript">
	$(function(){
		$("#exit").click(function(){
        	if(!confirm("确定退出系统？")){
            	return;
            }
            top.window.location.href="login.jsp";
       	})
   	})
</script>

<div class="head">
	<div class="top">
		<div style="position:absolute;font-size:25px;font-weight:666;color:white;left:15px;top:50%;transform:translateY(-50%);">
			网上评教系统(管理员)
        </div>
        <div class="quick" style="position:absolute;float:right;top:50%;transform:translateY(-50%);right:30px;"> 
            <a id="exit" class="ac_qucikmenu" href="#">
                <img src="images/system_quit.png">
            </a> 
        </div>
        <div class="top_user" style="position:absolute;top:50%;transform:translateY(-50%);right:70px;">
        	Hi, ${admin.nickname}!
        </div>
	</div>
</div>
