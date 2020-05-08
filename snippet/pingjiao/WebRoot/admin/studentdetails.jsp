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
    	Student temobjstudent=(Student)DALBase.load("student"," where id="+ id);
      	request.setAttribute("student",temobjstudent);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 	<head>
  		<title>学生信息查看</title>
    	<script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js"></script>
     	<link href="<%=SystemParam.getSiteRoot() %>/admin/css/webtable.css" rel="stylesheet" type="text/css" />
	</head>
	<body >
		<div class="search-title">
			<h2>查看 学生</h2>
			<div class="description"></div>
		</div>
		<table cellpadding="0" cellspacing="1" class="grid" width="100%">
			<tr>
				<td width="10%" align="right">学号:</td>
				<td>${requestScope.student.stno}</td>
				<td colspan="2" rowspan="6">
					<img id="imgPhoto" width="200px" height="200px" src="${requestScope.student.photo}" />
				</td>
			</tr>
			<tr>
				<td width="10%" align="right">姓名:</td>
				<td>${requestScope.student.name}</td>
			</tr>
			<tr>
				<td align="right">性别:</td>
				<td>${requestScope.student.sex}</td>
			</tr>
			<tr>
				<td align="right">专业:</td>
				<td>${requestScope.student.zhuanye}</td>
			</tr>
			<tr>
				<td width="10%" align="right">籍贯:</td>
				<td>${requestScope.student.jiguan}</td>
			</tr>
			<tr>
				<td width="10%" align="right">联系电话:</td>
				<td>${requestScope.student.mobile}</td>
			</tr>
			<tr>
				<td align="right">班级:</td>
				<td>${requestScope.student.class}</td>
			
				<td align="right">面貌:</td>
				<td>${requestScope.student.mianmao}</td>
			</tr>
			<tr>
				<td width="10%" align="right">家庭住址:</td>
				<td>${requestScope.student.address}</td>
			
				<td width="10%" align="right">民族:</td>
				<td>${requestScope.student.nation}</td>
			</tr>
			<tr>
				<td align="right">出生日期:</td>
				<td><fmt:formatDate value="${requestScope.student.birthday}" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td align="right">说明:</td>
				<td colspan="3">${requestScope.student.des}</td>
			</tr>
		</table>
	</body>
</html>
