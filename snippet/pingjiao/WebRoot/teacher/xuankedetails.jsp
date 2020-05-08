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
	String  id=request.getParameter("id");
   	if( id!=null) {
     	Xuanke temobjxuanke=(Xuanke)DALBase.load("xuanke"," where id="+ id);
      	request.setAttribute("xuanke",temobjxuanke);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 	<head>
	  	<title>选课信息查看</title>
	    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.js"></script>
	    <link href="<%=SystemParam.getSiteRoot() %>/webui/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
	    <link href="<%=SystemParam.getSiteRoot() %>/webui/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
	    <script src="<%=SystemParam.getSiteRoot() %>/webui/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
		<link href="<%=SystemParam.getSiteRoot() %>/admin/css/webtable.css" rel="stylesheet" type="text/css" />
	</head>
	<body >
	 	<div class="search-title">
			<h2>成绩信息查看</h2>
			<div class="description"></div>
		</div>
		<table cellpadding="0" cellspacing="1" class="grid" width="100%">
			<tr>
				<td width="10%" align="right">学号:</td>
				<td>${requestScope.xuanke.stno}</td>
			</tr>
			<tr>
				<td align="right">学生姓名:</td>
				<td>${requestScope.xuanke.sname}</td>
			</tr>
			<tr>
				<td align="right">课程编号:</td>
				<td>${requestScope.xuanke.subno}</td>
			</tr>
			<tr>
				<td align="right">课程名称:</td>
				<td>${requestScope.xuanke.subname}</td>
			</tr>
			<tr>
				<td align="right">选课时间:</td>
				<td>${requestScope.xuanke.xktime}</td>
			</tr>
			<tr>
				<td align="right">成绩:</td>
				<td>${requestScope.xuanke.score}</td>
			</tr>
			<tr>
				<td align="right">状态:</td>
				<td>${requestScope.xuanke.status}</td>
			</tr>
		</table>
	</body>
</html>
