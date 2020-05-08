<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@ page import="com.dao.bll.*"%>
<%@ page import="com.dao.entity.*" %>
<%@ page import="com.dao.dal.DALBase"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
  		<title>教师信息</title>
		<script src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    	<script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validate.min.js"></script>
  		<script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.metadata.js" ></script>
  		<script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/messages_cn.js" ></script>
    	<link href="<%=SystemParam.getSiteRoot() %>/admin/css/webtable.css" rel="stylesheet" type="text/css" />

	</head>
	<body >
		<div class="search-title">
			<h2>个人信息</h2>
			<div class="description"></div>
		</div>
		<table border="0" cellspacing="1" class="grid" cellpadding="0" width="100%">
			<tr>
				<td align="right" width="10%" class="title">工号:</td>
				<td>${requestScope.teacher.tno}</td>
				<td colspan="2" rowspan="6"><img src="${requestScope.teacher.photo}" width="200" height="200" /></td>
			</tr>
			<tr>
				<td align="right" width="10%" class="title">姓名:</td>
				<td>${requestScope.teacher.name}</td>
			</tr>
		
			<tr>
				<td align="right" class="title">性别:</td>
				<td>${requestScope.teacher.sex}</td>
			</tr>
			<tr>
				<td align="right" width="10%" class="title">邮箱:</td>
				<td>${requestScope.teacher.email}</td>
			</tr>
			<tr>
				<td align="right" width="10%" class="title">电话:</td>
				<td>${requestScope.teacher.tel}</td>
			</tr>
			<tr>
				<td align="right" width="10%" class="title">专业:</td>
				<td>${requestScope.teacher.major}</td>
			</tr>
			
			<tr>
				<td align="right" class="title">介绍:</td>
				<td colspan="3">${requestScope.teacher.jieshao}</td>
			</tr>
		</table>
	</body>
</html>
