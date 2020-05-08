<%@ page import="java.text.MessageFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.dao.bll.*,com.dao.util.PagerMetal"%>
<%@ page import="com.dao.entity.*" %>
<%@ page import="com.dao.dal.DALBase"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>课程信息</title>
	    <script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
	    <link href="<%=SystemParam.getSiteRoot() %>/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
	    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
	    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
	    <script src="<%=SystemParam.getSiteRoot()%>/webui/combo/combo.js" type="text/javascript"></script>
	    <link href="<%=SystemParam.getSiteRoot() %>/webui/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
	    <link href="<%=SystemParam.getSiteRoot() %>/webui/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
	    <script src="<%=SystemParam.getSiteRoot() %>/webui/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/webtable.css" rel="stylesheet" type="text/css" />
	    <link href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
	    <link href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet" type="text/css" />
	    <script src="<%=SystemParam.getSiteRoot() %>/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function() {
			});
       	</script>
	</head>
	<body >
		<div class="search-title">
			<h2>在线选课</h2>
			<div class="description"></div>
		</div>
		<!-- 搜索控件开始 -->
	
		<!-- 搜索控件结束 -->
		<div class="clear"></div>
			<table id="module" width="100%" border="0" cellspacing="0" cellpadding="0" class="ui-record-table">
				<thead>
					<tr>
						<th><b>课程名</b></th>
						<th><b>课程编号</b></th>
						<th><b>开课教师</b></th>
						<th><b>学分</b></th>
						<th><b>课程状态</b></th>
						<th>操作</th>
					</tr>
				</thead>
			<tbody>
				<c:if test="${listcourse == null || fn:length(listcourse) == 0}">
					<tr>
						<td colspan="20">没有相关课程信息</td>
					</tr>
				</c:if>
				<%	
					if(request.getAttribute("listcourse")!=null) {
						List<Course> listcourse = (List<Course>)request.getAttribute("listcourse");
						for(Course temcourse : listcourse)
						{
				%>
				<tr>
					<td><%=temcourse.getSubname()%></td>
					<td><%=temcourse.getSubno()%></td>
					<td><%=temcourse.getTname()%>-<%=temcourse.getTno()%></td>
					<td><%=temcourse.getXuefen()%></td>
					<td><%=temcourse.getStatus()%></td>
					<td>
						<%
							Student currentac=(Student)request.getSession().getAttribute("student");
						    if(currentac!=null) {
						   		boolean hasselected=DALBase.isExist("xuanke", MessageFormat.format("where stno=''{0}'' and subno=''{1}'' ",currentac.getStno(),temcourse.getSubno()));
						      	if(temcourse!=null&&temcourse.getStatus()!=null&&temcourse.getStatus().equals("选课中")&&!hasselected){
						%>
					    <form style="display: inline" method="post" action="<%=SystemParam.getSiteRoot() %>/admin/xuankemanager.do">
					    	<input type="hidden" name="actiontype" value="save"/>
					        <input type="hidden" name="stno" value="${student.stno}"/>
					        <input type="hidden" name="sname" value="${student.name}"/>
					        <input type="hidden" name="subno" value="<%=temcourse.getSubno()%>"/>
					        <input type="hidden" name="subname" value="<%=temcourse.getSubname()%>"/>
					       	<input type="hidden" name="forwardurl" value="/admin/coursemanager.do?actiontype=get&forwardurl=/student/xuankeguide.jsp"/>
					 		<button class="btn btn-danger">
					 			<i class="icon-zoom-in icon-white"></i>选修该课程
							</button>
						</form>
					    <% } } %>
					  	<a class="btn btn-success" href="<%=SystemParam.getSiteRoot() %>/student/coursedetails.jsp?id=<%=temcourse.getId()%>">
					  		<i class="icon-zoom-in icon-white"></i>查看
					  	</a>
					</td>
				</tr>
				<% } } %>
			</tbody>
		</table>
		<div class="clear"></div>
		<daowen:pager id="pager1" attcheform="searchForm" />
	</body>
</html>
