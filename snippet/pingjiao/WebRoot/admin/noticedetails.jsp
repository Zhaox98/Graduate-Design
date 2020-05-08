<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@ page import="com.dao.bll.*"%>
<%@ page import="com.dao.entity.*" %>
<%@ page import="com.dao.dal.DALBase"%>
<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
	String  id=request.getParameter("id");
    if( id!=null){
    	Notice temobjnotice=(Notice)DALBase.load("notice"," where id="+ id);
      	request.setAttribute("notice",temobjnotice);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 	<head>
  		<title>公告信息查看</title>
    	<script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js"></script>
     	<link href="<%=SystemParam.getSiteRoot() %>/admin/css/webtable.css" rel="stylesheet" type="text/css" />
	</head>
	<body >
		<div class="search-title">
			<h2> 查看公告 </h2>
	        <div class="description"></div>
        </div>
		<table cellpadding="0" cellspacing="1" class="grid" width="100%" >
			<tr>
				<td width="10%" align="right" >标题:</td>
				<td>${requestScope.notice.title}</td>
			</tr>
			<tr>
				<td align="right">创建时间:</td>
				<td>
					<fmt:formatDate  value="${requestScope.notice.createtime}" pattern="yyyy-MM-dd" />
				</td>
			</tr>
			<tr>
				<td width="10%" align="right" >发布人:</td>
				<td>${requestScope.notice.pubren}</td>
			</tr>
			<tr>
				<td align="right">内容:</td>
				<td colspan="3">${requestScope.notice.content}</td>
			</tr>
		</table>
	</body>
</html>
