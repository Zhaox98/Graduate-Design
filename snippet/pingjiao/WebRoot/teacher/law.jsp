<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.dao.bll.SystemParam"%>
<%
	Object o=  request.getSession().getAttribute("teacher");
	if(o==null)
		response.sendRedirect(SystemParam.getSiteRoot()+"/admin/login.jsp");
%>
