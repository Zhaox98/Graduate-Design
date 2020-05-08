﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@ page import="com.dao.bll.*"%>
<%@ page import="com.dao.entity.*" %>
<%@ page import="com.dao.dal.DALBase"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<%
	Student student= (Student)request.getSession().getAttribute("student");
	if(student!=null) {
		Student temstudent   =(Student)DALBase.load("student ","where id="+((Student)student).getId());
		request.setAttribute("student",temstudent);
	}
	List<Student> zhuanye_datasource=DALBase.getEntity("major","");
	request.setAttribute("zhuanye_datasource",zhuanye_datasource);
	List<Student> banji_datasource=DALBase.getEntity("banji","");
	request.setAttribute("banji_datasource",banji_datasource);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 	<head>
  		<title>学生</title>
	 	<script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js"></script>
    	<script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validate.min.js"></script>
  		<script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.metadata.js" ></script>
  		<script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/messages_cn.js" ></script>
   		<link href="<%=SystemParam.getSiteRoot() %>/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    	<script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    	<script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    	<link href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    	<link href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet" type="text/css" />
    	<script src="<%=SystemParam.getSiteRoot() %>/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
  		<link href="<%=SystemParam.getSiteRoot() %>/upload/uploadify.css" rel="stylesheet" type="text/css" />
    	<script src="<%=SystemParam.getSiteRoot() %>/upload/jquery.uploadify-3.1.js" type="text/javascript"></script>
    	<script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/editor/kindeditor-min.js"></script>
    	<script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/editor/lang/zh_CN.js"></script>
    	<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    	<script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/jquery-ui.js"></script>
    	<script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
   		<link href="<%=SystemParam.getSiteRoot() %>/admin/css/webtable.css" rel="stylesheet" type="text/css" />
   		<script type="text/javascript">
        	function initControl(){
				$('#btnulPhoto').uploadify({  
			   		'formData': { 'folder': '<%=SystemParam.getSiteRoot()%>/Upload' },  
			  		'buttonText': '选择图片',  
			   		'buttonClass': 'browser',  
			    	'removeCompleted': true,  
			  		'swf': '<%=SystemParam.getSiteRoot()%>/upload/uploadify.swf', 
					'fileTypeExts':"*.jpg;*.gif;*.png;",
			    	'auto':true, 
			    	'removeTimeout':0,
			 		'debug': false,  
			 		'height': 15,  
			  		'width':90,  
			 		'uploader': '<%=SystemParam.getSiteRoot()%>/admin/uploadmanager.do',
			 		'fileSizelimit':'2048KB',
			  		'queueSizelimit':'5',
			 		'onUploadSuccess':function(file, data, response){
			        	$("#filelist").show();
			        	$("#imgPhoto").attr("src","<%=SystemParam.getSiteRoot()%>/upload/temp/"+file.name);
                    	$("#hidPhoto").val("<%=SystemParam.getSiteRoot()%>/upload/temp/"+file.name);
			  		}
				}); 
				var imgphotosrc="${requestScope.student.photo}";
					if(imgphotosrc==""){
				 		var url="<%=SystemParam.getSiteRoot()%>/upload/images/nopic.jpg";
				  		$("#imgPhoto").attr("src",url);
				    	$("#hidPhoto").val(url);
				   	}else {
				   		$("#imgPhoto").attr("src",imgphotosrc);
				   		$("#hidPhoto").val(imgphotosrc); 
				 	}
			     	editor = KindEditor.create('textarea[name="des"]', {
			      	resizeType: 1,
					allowFileManager: true
				});
				$("#txtBirthday").datepicker({
                	dateFormat:'yy-mm-dd'
              	}).datepicker("setDate",new Date());
        	}
        	$(function () {
            	initControl();
            	$.metadata.setType("attr","validate");
            	$("#teacherForm").validate();
        	});  
    	</script>
	</head>
	<body>
		<div class="search-title">
			<h2>账户信息管理</h2>
		</div>
		<form name="studentform" method="post" action="<%=SystemParam.getSiteRoot()%>/admin/studentmanager.do" id="studentForm">
			<input type="hidden" name="actiontype" value="update" /> 
			<input type="hidden" name="id" value="${requestScope.student.id}" /> 
			<input type="hidden" name="forwardurl" value="/student/accountinfo.jsp?seedid=101" />
			<table border="0" cellspacing="1" class="grid" cellpadding="0" width="100%">
				<tr>
					<td height="30" align="right">学号:</td>
					<td>${requestScope.student.stno}</td>
					<td height="30" align="right">姓名:</td>
					<td>
						<input name="name" value="${requestScope.student.name}" class="input-txt" type="text" id="txtName" validate="{required:true,messages:{required:'请输入姓名'}}" />
					</td>
					<td colspan="2" rowspan="6"><img id="imgPhoto" width="200px" height="200px" src="${requestScope.student.photo}" />
						<div>
							<input type="file" name="upload" id="btnulPhoto" />
						</div> 
						<input type="hidden" id="hidPhoto" name="photo" value="${requestScope.student.photo}" />
					</td>
				</tr>
				<tr>
					<td height="30" align="right">性别:</td>
					<td>
						<select name="sex" id="ddlSex">
							<option value="男">男</option>
							<option value="女">女</option>
						</select>
					</td>
				</tr>
				<tr>
					<td height="30" align="right">民族:</td>
					<td>
						<input name="nation" value="${requestScope.student.nation}" class="input-txt"
							type="text" id="txtNation" validate="{required:true,messages:{required:'请输入民族'}}" />
					</td>
					<td height="30" align="right">籍贯:</td>
					<td>
						<input name="jiguan" value="${requestScope.student.jiguan}" class="input-txt" type="text" id="txtJiguan" 
							validate="{required:true,messages:{required:'请输入籍贯'}}" />
					</td>
				</tr>
				<tr>
					<td height="30" align="right">出生日期:</td>
					<td>
						<input name="birthday" value="${requestScope.student.birthday}" type="text" id="txtBirthday" class="input-txt"
							validate="{required:true,messages:{required:'请选择日期'}}" />
					</td>
				</tr>
				<tr>
					<td height="30" align="right">面貌:</td>
					<td>
						<select name="mianmao" id="ddlMianmao">
							<option value="党员">党员</option>
							<option value="团员">团员</option>
							<option value="其他">其他</option>
						</select>
					</td>
				</tr>
				<tr>
					<td height="30" align="right">专业:</td>
					<td>
						<web:dropdownlist name="zhuanye" id="zhuanye" value="${requestScope.student.zhuanye}"
							datasource="${zhuanye_datasource}" textfieldname="name" valuefieldname="name">
						</web:dropdownlist>
					</td>
					<td height="30" align="right">班级:</td>
					<td>
						<web:dropdownlist name="banji" id="banji" value="${requestScope.student.banji}"
							datasource="${banji_datasource}" textfieldname="name" valuefieldname="name">
						</web:dropdownlist>
					</td>
				</tr>
				
				<tr>
					<td height="30" align="right">联系电话:</td>
					<td>
						<input name="mobile" value="${requestScope.student.mobile}" class="input-txt" type="text" id="txtMobile" 
							validate="{required:true,messages:{required:'请输入联系电话'}}" />
					</td>
				</tr>
				<tr>
					
					
				</tr>
				<tr>
					<td height="30" align="right">家庭住址:</td>
					<td>
						<input name="address" value="${requestScope.student.address}" class="input-txt"
							type="text" id="txtAddress" validate="{required:true,messages:{required:'请输入家庭住址'}}" />
					</td>
				</tr>
				
				<tr>
					<td align="right">说明:</td>
					<td colspan="3">
						<textarea name="des" class="l-textarea" id="txtDes" style="width:98%;height:200px;">${requestScope.student.des}</textarea>
					</td>
				</tr>
				<tr>
					<td></td>
					<td colspan="4">
						<div class="ui-button">
							<button class="ui-button-text">
								<i class="icon-ok icon-white"></i>提交
							</button>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
