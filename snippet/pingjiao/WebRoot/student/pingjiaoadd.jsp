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
  		<title>在线评教</title>
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
      		$(function () {
           		$("#btnOK").click(function(){
        			$();
           		})
            	$.metadata.setType("attr","validate");
            	$("#pingjiaoForm").validate();
        	});  
    	</script>
    </head>
	<body>
		<div class="search-title">
			<h2>在线评教</h2>
			<div class="description"></div>
		</div>
		<form name="pingjiaoform" method="post" action="<%=SystemParam.getSiteRoot()%>/admin/pingjiaomanager.do" id="pingjiaoForm">
			<table class="grid" cellspacing="1" width="100%">
				<input type="hidden" name="id" value="${id}" />
				<input type="hidden"  name="stno" value="${student.stno}"/>
				<input type="hidden"  name="stname" value="${student.name}"/>
				<input type="hidden"  name="subno" value="${course.subno}"/>
				<input type="hidden"  name="subname" value="${course.subname}"/>
				<input type="hidden" name="actiontype" value="save" />
				<input type="hidden" name="errorurl" value="/student/pingjiaoadd.jsp"/>
				<input type="hidden" name="forwardurl" value="/admin/pingjiaomanager.do?actiontype=get&pjren=${student.stno}&forwardurl=/student/pingjiaomanager.jsp" />
				<tr>
					<td colspan="4">${errormsg}</td>
				</tr>
				<tr>
					<td width="10%" align="right">工号:</td>
					<td>${requestScope.teacher.tno}</td>
					<td colspan="2" rowspan="6"><img id="imgPhoto" width="200px" height="200px" src="${requestScope.teacher.photo}" /></td>
				</tr>
				<tr>
					<td width="10%" align="right">姓名:</td>
					<td>${requestScope.teacher.name}</td>
				</tr>
		
				<tr>
					<td align="right">性别:</td>
					<td>${requestScope.teacher.sex}</td>
				</tr>
				<tr>
					<td width="10%" align="right">籍贯:</td>
					<td>${requestScope.teacher.jiguan}</td>
				</tr>
				<tr>
					<td width="10%" align="right">职位:</td>
					<td>${requestScope.teacher.zhiwei}</td>
				</tr>
				<tr>
					<td width="10%" align="right">职称:</td>
					<td>${requestScope.teacher.zhicheng}</td>
				</tr>
			</table>
			<div class="search-title">
				<h2>评教课程:${course.subname }(${course.subno })</h2>
				<div class="description"></div>
			</div>
			<table  class="ui-record-table"  cellspacing="1" width="100%" >
		  		<%	
		  			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
					if(request.getAttribute("listpjitems")!=null) {	
						int index=0;
						List<Pjitems> listpjitems=( List<Pjitems>)request.getAttribute("listpjitems");
						for(Pjitems  tempjitems  :  listpjitems) {
							index++;
				%>
				<tr>
					<td colspan="2" style="text-align: left;padding-left:30px;">
						第<%=index%>题:<%=tempjitems.getTitle()%>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: left;padding-left:30px;">
						<input  type="radio" name="items<%=tempjitems.getId()%>" validate="{required:true,messages:{required:'请选择评选结果'}}"   value="10"   /> A.非常满意
						<input type="radio" name="items<%=tempjitems.getId()%>"  value="8"   /> B.比较满意
						<input type="radio" name="items<%=tempjitems.getId()%>"  value="6"   /> C.基本满意   
						<input type="radio" name="items<%=tempjitems.getId()%>"  value="4"   /> D.不太满意
						<input type="radio" name="items<%=tempjitems.getId()%>"  value="0"   /> E.非常不满意
					</td>
				</tr>
				<% } } %>
				<tr>
					<td align="right" width="70px">附言:</td>
					<td style="text-align: left;" >
						<textarea name="des" rows="4" id="txtDes" style="width:58%;height:100px;" validate="{required:true}">${requestScope.pingjiao.des}</textarea>
					</td>
				</tr>
			</table>
			<button id="btnOK" class="orange-button">提交评教</button>
		</form>
	</body>
</html>
