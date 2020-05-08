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
	Admin admin= (Admin)request.getSession().getAttribute("admin");
	 if(admin!=null)
	 {
	 	Admin temadmin = (Admin)DALBase.load("admin ","where id="+((Admin)admin).getId());
	    request.setAttribute("admin",temadmin);
	 }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>管理员信息</title>
	<script src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validate.min.js"></script>
   	<script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.metadata.js" ></script>
  	<script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/messages_cn.js" ></script>
    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/webtable.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/layout.css" rel="stylesheet" type="text/css" />
</head>
<body >
	<div class="search-title">
		<h2>账户信息</h2>
		<div class="description"></div>
	</div>
	<table border="0" cellspacing="1" class="grid" cellpadding="0" width="100%">
		<tr>
			<td align="right" width="10%" class="title">用户名 :</td>
			<td>${requestScope.admin.username}</td>
			<td colspan="2" rowspan="6">
				<img src="${requestScope.admin.xiangpian}" width="200" height="200" />
			</td>
		</tr>
		<tr>
			<td align="right" width="10%" class="title">姓名 :</td>
			<td>${requestScope.admin.realname}</td>
		</tr>
		<tr>
			<td align="right" class="title">性别 :</td>
			<td>${requestScope.admin.sex}</td>
		</tr>
		<tr>
			<td align="right" width="10%" class="title">邮箱 :</td>
			<td>${requestScope.admin.email}</td>
		</tr>
		<tr>
			<td align="right" width="10%" class="title">电话号码 :</td>
			<td colspan="3">${requestScope.admin.tel}</td>
		</tr>
	</table>
</body>
</html>
