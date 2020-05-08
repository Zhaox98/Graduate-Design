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
		Pingjiao temobjpingjiao=(Pingjiao)DALBase.load("pingjiao"," where id="+ id);
		request.setAttribute("pingjiao",temobjpingjiao);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 	<head>
  		<title>评教信息查看</title>
    	<script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js"></script>
     	<link href="<%=SystemParam.getSiteRoot() %>/admin/css/webtable.css" rel="stylesheet" type="text/css" />
	</head>
	<body >
		<div class="search-title">
			<h2>查看评教</h2>
			<div class="description"></div>
		</div>
		<table cellpadding="0" cellspacing="1" class="grid" width="100%">
			<tr>
				<td width="10%" align="right">学号:</td>
				<td>${requestScope.pingjiao.stno}</td>
			</tr>
			<tr>
				<td width="10%" align="right">姓名:</td>
				<td>${requestScope.pingjiao.stname}</td>
			</tr>
			<tr>
				<td width="10%" align="right">课程编号:</td>
				<td>${requestScope.pingjiao.subno}</td>
			</tr>
			<tr>
				<td width="10%" align="right">课程名:</td>
				<td>${requestScope.pingjiao.subname}</td>
			</tr>
			<tr>
				<td width="10%" align="right">得分:</td>
				<td>${requestScope.pingjiao.defen}</td>
			</tr>
			<tr>
				<td align="right">评教时间:</td>
				<td><fmt:formatDate value="${requestScope.pingjiao.pjtime}"
						pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<td align="right">说明:</td>
				<td colspan="3">${requestScope.pingjiao.des}</td>
			</tr>
		</table>
	</body>
</html>
