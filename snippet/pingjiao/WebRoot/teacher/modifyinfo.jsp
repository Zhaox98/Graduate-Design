<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	Teacher teacher= (Teacher)request.getSession().getAttribute("teacher");
	if(teacher!=null) {
		Teacher temteacher   =(Teacher)DALBase.load("teacher","where id="+((Teacher)teacher).getId());
		request.setAttribute("teacher",temteacher);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 	<head>
  		<title>教师</title>
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
				editor = KindEditor.create('textarea[name="jieshao"]', {
			    	resizeType: 1,
					allowFileManager: true
				});
				$('#btnulPhoto').uploadify({  
			   		'formData': { 'folder': '<%=SystemParam.getSiteRoot()%>/Upload' },  
			      	'buttonText': '照片',  
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
			   	var imgphotosrc="${requestScope.teacher.photo}";
				if(imgphotosrc==""){
					var url="<%=SystemParam.getSiteRoot()%>/upload/images/nopic.jpg";
				 	$("#imgPhoto").attr("src",url);
					$("#hidPhoto").val(url);
				}
				else {
					$("#imgPhoto").attr("src",imgphotosrc);
					$("#hidPhoto").val(imgphotosrc); 
				}
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
			<h2>修改账户信息</h2>
		</div>
		<form name="teacherform" method="post" action="<%=SystemParam.getSiteRoot()%>/admin/teachermanager.do" id="teacherForm">
			<input type="hidden" name="actiontype" value="update" /> 
			<input type="hidden" name="id" value="${requestScope.teacher.id}" /> 
			<input type="hidden" name="forwardurl" value="/teacher/accountinfo.jsp?seedid=101" />
			<table border="0" cellspacing="1" class="grid" cellpadding="0" width="100%">
				<tr>
					<td height="30" align="right">工号:</td>
					<td> ${requestScope.teacher.tno} </td>
					<td height="30" align="right">姓名:</td>
					<td>
						<input name="name" value="${requestScope.teacher.name}" class="input-txt" type="text" id="txtName"
							validate="{required:true,messages:{required:'请输入姓名'}}" />
					</td>
					<td colspan="2" rowspan="6">
						<img id="imgPhoto" width="200px" height="200px" src="${requestScope.teacher.photo}" />
						<div>
							<input type="file" name="upload" id="btnulPhoto" />
						</div> 
						<input type="hidden" id="hidPhoto" name="photo" value="${requestScope.teacher.photo}" />
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
					<td height="30" align="right">面貌:</td>
					<td>
						<select name="mianmao" id="ddlMianmao">
							<option value="党员">党员</option>
							<option value="团员">团员</option>
							<option value="群众">群众</option>
						</select>
					</td>
				</tr>
				<tr>
					
				</tr>
				<tr>
					<td height="30" align="right">民族:</td>
					<td>
						<input name="nation" value="${requestScope.teacher.nation}" class="input-txt" type="text" id="txtNation"
							validate="{required:true,messages:{required:'请输入民族'}}" />
					</td>
					<td height="30" align="right">籍贯:</td>
					<td>
						<input name="jiguan" value="${requestScope.teacher.jiguan}" class="input-txt" type="text" id="txtJiguan"
							validate="{required:true,messages:{required:'请输入籍贯'}}" />
					</td>
				</tr>
				<tr>
					<td height="30" align="right">电话:</td>
					<td>
						<input name="tel" value="${requestScope.teacher.tel}" class="input-txt" type="text" id="txtTel"
							validate="{required:true,messages:{required:'请输入电话'}}" />
					</td>
					<td height="30" align="right">邮箱:</td>
					<td>
						<input name="email" value="${requestScope.teacher.email}" class="input-txt" type="text" id="txtEmail"
							validate="{required:true,messages:{required:'请输入邮箱'}}" />
					</td>
				</tr>
				<tr>
					<td height="30" align="right">学历:</td>
					<td>
						<select name="xueli" id="ddlXueli">
							<option value="博士">博士</option>
							<option value="硕士">硕士</option>
							<option value="本科">本科</option>
							<option value="其他">其他</option>
						</select>
					</td>
					<td height="30" align="right">毕业院校:</td>
					<td>
						<input name="gradschool" value="${requestScope.teacher.gradschool}" class="input-txt" type="text" id="txtGradschool"
							validate="{required:true,messages:{required:'请输入毕业院校'}}" />
					</td>
				</tr>
				<tr>
					<td height="30" align="right">专业:</td>
					<td>
						<input name="major" value="${requestScope.teacher.major}" class="input-txt" type="text" id="txtMajor"
							validate="{required:true,messages:{required:'请输入专业'}}" />
					</td>
				</tr>
				<tr>
					<td height="30" align="right">职位:</td>
					<td>
						<input name="zhiwei" value="${requestScope.teacher.zhiwei}" class="input-txt" type="text" id="txtZhiwei"
							validate="{required:true,messages:{required:'请输入职位'}}" />
					</td>
				</tr>
				<tr>
					<td height="30" align="right">职称:</td>
					<td>
						<input name="zhicheng" value="${requestScope.teacher.zhicheng}" class="input-txt" type="text" id="txtZhicheng"
							validate="{required:true,messages:{required:'请输入职称'}}" />
					</td>
				</tr>
				<tr>
					<td align="right">介绍:</td>
					<td colspan="3">
						<textarea name="jieshao" class="l-textarea" id="txtJieshao" style="width:98%;height:200px;">${requestScope.teacher.jieshao}</textarea>
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
