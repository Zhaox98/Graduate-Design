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
    	Course temobjcourse=(Course)DALBase.load("course"," where id="+ id);
      	request.setAttribute("course",temobjcourse);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 	<head>
  		<title>课程信息查看</title>
    	<link href="<%=SystemParam.getSiteRoot() %>/webui/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    	<link href="<%=SystemParam.getSiteRoot() %>/webui/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
    	<script src="<%=SystemParam.getSiteRoot() %>/webui/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
     	<link href="<%=SystemParam.getSiteRoot() %>/admin/css/webtable.css" rel="stylesheet" type="text/css" />
    	<script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.js"></script>
	</head>
	<body >
    	<div class="search-title">
			<h2>查看课程信息</h2>
			<div class="description"></div>
		</div>
		<table cellpadding="0" cellspacing="1" class="grid" width="100%">
			<tr>
				<td width="10%" align="right">课程名:</td>
				<td>${requestScope.course.subname}</td>
			</tr>
			<tr>
				<td align="right">课程编号:</td>
				<td>${requestScope.course.subno}</td>
			</tr>
			<tr>
				<td align="right">学分:</td>
				<td>${requestScope.course.xuefen}</td>
			</tr>
			<tr>
				<td align="right">说明:</td>
				<td colspan="3">${requestScope.course.des}</td>
			</tr>
		</table>
	</body>
</html>
