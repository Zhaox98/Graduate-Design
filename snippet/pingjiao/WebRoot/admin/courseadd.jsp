<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@ page import="com.dao.bll.*"%>
<%@ page import="com.dao.entity.*" %>
<%@ page import="com.dao.dal.DALBase"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
 		<title>课程</title>
	    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js"></script>
	    <link href="<%=SystemParam.getSiteRoot() %>/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
	    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
	    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
	    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validate.min.js"></script>
	    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validateex.js" ></script>
	    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.metadata.js" ></script>
	    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/messages_cn.js" ></script>
	    <link href="<%=SystemParam.getSiteRoot() %>/upload/uploadify.css" rel="stylesheet" type="text/css" />
	    <script src="<%=SystemParam.getSiteRoot() %>/upload/jquery.uploadify-3.1.js" type="text/javascript"></script>
	    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery-form/jquery.form.js"></script>
	    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/editor/kindeditor-min.js"></script>
	    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/editor/lang/zh_CN.js"></script>
	    <link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
	    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/jquery-ui.js"></script>
	    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
	    <script src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
	    <link href="<%=SystemParam.getSiteRoot() %>/webui/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
	    <link href="<%=SystemParam.getSiteRoot() %>/webui/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
	    <script src="<%=SystemParam.getSiteRoot() %>/webui/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/common.css" rel="stylesheet" type="text/css" />
	   	<script type="text/javascript">
	        function initControl(){
				editor = KindEditor.create('textarea[name="des"]', {
					uploadJson : '../tools/upload_json.jsp',
					fileManagerJson : '../tools/file_manager_json.jsp',
				    resizeType: 1,
					allowFileManager: true
				});
	        }
	        $(function ()
	        {
	            initControl();
	            $.metadata.setType("attr","validate");
	            $("#courseForm").validate();
	        });  
	    </script>
	</head>
	
	<body>
		<div>
			<ul class="breadcrumb">
				<li>
					<a href="#">课程管理</a> 
					<span class="divider">/</span>
				</li>
				<li><a href="#">新建课程</a></li>
			</ul>
		</div>
		<div class="row-fluid">
			<div class="box">
				<div class="box-header well">
					<h2> <i class="icon-th-large"></i> 新建课程 </h2>
				</div>
				<div class="box-content">
					<form name="courseform" class="form-horizontal" method="post" action="<%=SystemParam.getSiteRoot()%>/admin/coursemanager.do" id="courseForm">
						<table class="grid" cellspacing="1" width="100%">
							<input type="hidden" name="id" value="${id}" />
							<input type="hidden" name="actiontype" value="${actiontype}" />
							<input type="hidden" name="seedid" value="${seedid}" />
							<input type="hidden" name="errorurl" value="/admin/courseadd.jsp" />
							<tr>
						  		<td colspan="2">${errormsg}</td>
							</tr>
							<tr>
								<td align="right">课程名:</td>
								<td>
									<input name="subname" validate="{required:true,messages:{required:'请输入课程名'}}"
										value="${requestScope.course.subname}" class="input-txt" type="text" id="txtSubname" />
								</td>
							</tr>
							<tr>
								<td align="right">课程编号:</td>
								<td>
									<input name="subno" validate="{required:true,messages:{required:'请输入课程编号'}}"
										value="${requestScope.course.subno}" class="input-txt" type="text" id="txtSubno" /></td>
							</tr>
							<tr>
								<td align="right">学分:</td>
								<td>
									<input name="xuefen" validate="{required:true,digits:true,messages:{required:'请输入学分',digits:'请输入正确 学分'}}"
										value="${requestScope.course.xuefen}" class="input-txt" type="text" id="txtXuefen" />
								</td>
							</tr>
							<tr>
								<td align="right">说明:</td>
								<td colspan="3">
									<textarea name="des" id="txtDes" style="width:98%;height:200px;">${requestScope.course.des}</textarea>
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<div class="ui-button">
										<button class="btn btn-large btn-primary">
											<i class="icon-ok icon-white"></i>提交
										</button>
									</div>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>
