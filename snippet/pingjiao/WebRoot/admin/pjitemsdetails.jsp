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
      	Pjitems temobjpjitems=(Pjitems)DALBase.load("pjitems"," where id="+ id);
      	request.setAttribute("pjitems",temobjpjitems);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 	<head>
  		<title>评教标准信息查看</title>
    	<script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js"></script>
     	<link href="<%=SystemParam.getSiteRoot() %>/admin/css/webtable.css" rel="stylesheet" type="text/css" />
	</head>
	<body >
		<div class="search-title">
			<h2>查看评教标准</h2>
	        <div class="description"></div>
        </div>
		<table cellpadding="0" cellspacing="1" class="grid" width="100%" >
        	<tr>
				<td align="right" >标准:</td>
				<td colspan="3">${requestScope.pjitems.title} </td>
			</tr>
		</table>
	</body>
</html>
