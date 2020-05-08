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
     Student student= (Student)request.getSession().getAttribute("student");
	 if(student!=null)
	 {
	 	Student temstudent   =(Student)DALBase.load("student","where id="+((Student)student).getId());
		request.setAttribute("student",temstudent);
	 }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 	<head>
	 	<title>学生信息</title>
		<script src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
	    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validate.min.js"></script>
	  	<script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.metadata.js" ></script>
	  	<script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/messages_cn.js" ></script>
	    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/webtable.css" rel="stylesheet" type="text/css" />
    
	</head>
	<body >
		<div class="search-title">
			<h2>账户信息</h2>
			<div class="description"></div>
		</div>
		<table border="0" cellspacing="1" class="grid" cellpadding="0" width="100%">
			<tr>
				<td align="right" width="10%" class="title">学号 :</td>
				<td>${requestScope.student.stno}</td>
				<td colspan="2" rowspan="6"><img src="${requestScope.student.photo}" width="200" height="200" /></td>
			</tr>
			<tr>
				<td align="right" width="10%" class="title">姓名 :</td>
				<td>${requestScope.student.name}</td>
			</tr>
			<tr>
				<td align="right" class="title">性别 :</td>
				<td>${requestScope.student.sex}</td>
			</tr>
			<tr>
				<td align="right" class="title">专业 :</td>
				<td>${requestScope.student.zhuanye}</td>
			</tr>
			<tr>
				<td align="right" class="title">班级 :</td>
				<td>${requestScope.student.banji}</td>
			</tr>
			<tr>
				<td align="right" width="10%" class="title">联系电话 :</td>
				<td>${requestScope.student.mobile}</td>
			</tr>
		</table>
	</body>
</html>

