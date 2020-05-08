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
    if( id!=null){
		Teacher temobjteacher=(Teacher)DALBase.load("teacher"," where id="+ id);
      	request.setAttribute("teacher",temobjteacher);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 	<head>
  		<title>教师信息查看</title>
    	<script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js"></script>
     	<link href="<%=SystemParam.getSiteRoot() %>/admin/css/webtable.css" rel="stylesheet" type="text/css" />
	</head>
	<body >
		<div class="search-title">
			<h2>教师信息查看</h2>
			<div class="description"></div>
		</div>
		<table cellpadding="0" cellspacing="1" class="grid" width="100%">
			<tr>
				<td width="10%" align="right">工号:</td>
				<td>${requestScope.teacher.tno}</td>
				<td colspan="2" rowspan="6">
					<img id="imgPhoto" width="200px" height="200px" src="${requestScope.teacher.photo}" />
				</td>
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
			<tr>
				<td align="right">学历:</td>
				<td>${requestScope.teacher.xueli}</td>
				<td align="right">面貌:</td>
				<td>${requestScope.teacher.mianmao}</td>
			</tr>
			<tr>
				<td width="10%" align="right">民族:</td>
				<td>${requestScope.teacher.nation}</td>
				<td width="10%" align="right">邮箱:</td>
				<td>${requestScope.teacher.email}</td>
			</tr>
			<tr>
				<td width="10%" align="right">电话:</td>
				<td>${requestScope.teacher.tel}</td>
				<td width="10%" align="right">毕业院校:</td>
				<td>${requestScope.teacher.gradschool}</td>
			</tr>
			<tr>
				<td width="10%" align="right">专业:</td>
				<td colspan="3">${requestScope.teacher.major}</td>
			</tr>
		
			<tr>
				<td align="right">介绍:</td>
				<td colspan="3">${requestScope.teacher.jieshao}</td>
			</tr>
		</table>
	</body>
</html>
