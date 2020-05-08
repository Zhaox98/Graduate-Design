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
  		<title>教师</title>
    	<script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js"></script>
    	<link href="<%=SystemParam.getSiteRoot() %>/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
	    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
	    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
	    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validate.min.js"></script>
	    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validateex.js" ></script>
	    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.metadata.js" ></script>
	    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/messages_cn.js" ></script>
		<link href="<%=SystemParam.getSiteRoot() %>/webui/easydropdown/themes/easydropdown.css" rel="stylesheet" type="text/css" />
	    <script src="<%=SystemParam.getSiteRoot() %>/webui/easydropdown/jquery.easydropdown.js" type="text/javascript"></script>    
	    <link href="<%=SystemParam.getSiteRoot() %>/upload/uploadify.css" rel="stylesheet" type="text/css" />
	    <script src="<%=SystemParam.getSiteRoot() %>/upload/jquery.uploadify-3.1.js" type="text/javascript"></script>
	    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/editor/kindeditor-min.js"></script>
	    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/editor/lang/zh_CN.js"></script>
	    <link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
	    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/jquery-ui.js"></script>
	    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
	    <script src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
	    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/webtable.css" rel="stylesheet" type="text/css" />
  		<script type="text/javascript">
        	function initControl(){
	  			//开始绑定
              	//结束绑定
			 	editor = KindEditor.create('textarea[name="jieshao"]', {
			   		uploadJson : '../tools/upload_json.jsp',
				  	fileManagerJson : '../tools/file_manager_json.jsp',
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
				else{
					$("#imgPhoto").attr("src",imgphotosrc);
				  	$("#hidPhoto").val(imgphotosrc); 
				}
        	}
       	 	$(function (){
            	initControl();
            	$.metadata.setType("attr","validate");
            	$("#teacherForm").validate();
        	});  
    	</script>
	</head>
	<body>
		<div class="search-title">
			<h2>新建教师</h2>
			<div class="description"></div>
		</div>
		<form name="teacherform" method="post" action="<%=SystemParam.getSiteRoot()%>/admin/teachermanager.do" id="teacherForm">
			<table class="grid" cellspacing="1" width="100%">
				<input type="hidden" name="id" value="${id}" />
				<input type="hidden" name="actiontype" value="${actiontype}" />
				<input type="hidden" name="seedid" value="${seedid}" />
				<input type="hidden" name="errorurl" value="/admin/teacheradd.jsp" />
				<input type="hidden" name="forwardurl" value="/admin/teachermanager.do?actiontype=get&forwardurl=/admin/teachermanager.jsp" />
				<tr>
					<td colspan="4">${errormsg}</td>
				</tr>
				<tr>
					<td align="right">工号:</td>
					<td>
						<input name="tno" placeholder="工号" validate="{required:true,messages:{required:'请输入工号'}}"
							value="${requestScope.teacher.tno}" class="input-txt" type="text" id="txtTno" />
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
					<td align="right">姓名:</td>
					<td>
						<input name="name" placeholder="姓名" validate="{required:true,messages:{required:'请输入姓名'}}"
							value="${requestScope.teacher.name}" class="input-txt" type="text" id="txtName" />
					</td>
				</tr>
				<tr>
					<td align="right">性别:</td>
					<td>
						<select name="sex" id="ddlSex" class="dropdown">
							<option value="男">男</option>
							<option value="女">女</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right">籍贯:</td>
					<td>
						<input name="jiguan" placeholder="籍贯" validate="{required:true,messages:{required:'请输入籍贯'}}"
							value="${requestScope.teacher.jiguan}" class="input-txt" type="text" id="txtJiguan" />
					</td>
				</tr>
				<tr>
					<td align="right">职位:</td>
					<td>
						<input name="zhiwei" placeholder="职位" validate="{required:true,messages:{required:'请输入职位'}}"
							value="${requestScope.teacher.zhiwei}" class="input-txt" type="text" id="txtZhiwei" />
					</td>
				</tr>
				<tr>
					<td align="right">职称:</td>
					<td>
						<select  name="zhicheng" class="dropdown">
					    	<option value="教授">教授</option>
					  		<option value="副教授">副教授</option>
					     	<option value="讲师">讲师</option>
					      	<option value="其他">其他</option>
					   	</select>
					</td>
				</tr>
				<tr>
					<td align="right">学历:</td>
					<td>
						<select name="xueli" id="ddlXueli" class="dropdown">
							<option value="博士">博士</option>
							<option value="硕士">硕士</option>
							<option value="本科">本科</option>
							<option value="其他">其他</option>
						</select>
					</td>
					<td align="right">面貌:</td>
					<td>
						<select name="mianmao" id="ddlMianmao" class="dropdown">
							<option value="党员">党员</option>
							<option value="团员">团员</option>
							<option value="群众">群众</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right">民族:</td>
					<td>
						<input name="nation" placeholder="民族" validate="{required:true,messages:{required:'请输入民族'}}"
							value="${requestScope.teacher.nation}" class="input-txt" type="text" id="txtNation" />
					</td>
				
					<td align="right">邮箱:</td>
					<td>
						<input name="email" placeholder="邮箱" validate="{required:true,messages:{required:'请输入邮箱'}}"
							value="${requestScope.teacher.email}" class="input-txt" type="text" id="txtEmail" />
					</td>
				</tr>
				
				<tr>
					<td align="right">毕业院校:</td>
					<td>
						<input name="gradschool" placeholder="毕业院校" validate="{required:true,messages:{required:'请输入毕业院校'}}"
							value="${requestScope.teacher.gradschool}" class="input-txt" type="text" id="txtGradschool" />
					</td>
				
					<td align="right">专业:</td>
					<td>
						<input name="major" placeholder="专业" validate="{required:true,messages:{required:'请输入专业'}}"
							value="${requestScope.teacher.major}" class="input-txt" type="text" id="txtMajor" />
					</td>
				</tr>
				<tr>
					<td align="right">电话:</td>
					<td>
						<input name="tel" placeholder="电话" validate="{required:true,messages:{required:'请输入电话'}}"
							value="${requestScope.teacher.tel}" class="input-txt" type="text" id="txtTel" />
					</td>
				</tr>
				
				<tr>
					<td align="right">介绍:</td>
					<td colspan="3">
						<textarea name="jieshao" id="txtJieshao" style="width:98%;height:200px;">${requestScope.teacher.jieshao}</textarea>
					</td>
				</tr>
				<tr>
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
