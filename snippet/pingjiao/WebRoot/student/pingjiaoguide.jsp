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
		<title>在线评教</title>
	    <script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
	    <link href="<%=SystemParam.getSiteRoot() %>/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
	    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
	    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
	    <script src="<%=SystemParam.getSiteRoot()%>/webui/combo/combo.js" type="text/javascript"></script>
     	<link href="<%=SystemParam.getSiteRoot() %>/webui/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
	    <link href="<%=SystemParam.getSiteRoot() %>/webui/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
	    <script src="<%=SystemParam.getSiteRoot() %>/webui/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/webtable.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			$(function() {
			});
       	</script>
	</head>
	<body >
		<div class="search-title">
			<h2>在线评教</h2>
			<div class="description"></div>
		</div>
		<!-- 搜索控件开始 -->
		<div class="search-options">
			<form id="searchForm" action="<%=SystemParam.getSiteRoot() %>/admin/coursemanager.do" method="post">
				<table cellspacing="0" width="100%">
					<tbody>
						<tr>
							<td>课程名 
							   	<input name="subname" value="${subname}" class="input-txt" type="text" id="subname" /> 
								<input type="hidden" name="actiontype" value="getChoose" /> 
								<input type="hidden" name="stno" value="${student.stno}" /> 
								<input type="hidden" name="seedid" value="${seedid}" />
								<input type="hidden" name="forwardurl"  value="/student/pingjiaoguide.jsp" /> 
								<button class="btn  btn-success">
									<i class="icon-search icon-white"></i>搜索
								</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<!-- 搜索控件结束 -->
		<div class="clear"></div>
			<table id="module" width="100%" border="0" cellspacing="0" cellpadding="0" class="ui-record-table">
				<thead>
					<tr>
						<th><b>课程编号</b></th>
						<th><b>课程名称</b></th>
						<th><b>开课教师</b></th>
						<th><b>评教人数</b></th>
						<th><b>得分</b></th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${listcourse== null || fn:length(listcourse) == 0}">
						<tr>
							<td colspan="20">没有相关选课信息</td>
						</tr>
					</c:if>
					<%	
				    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
						if(request.getAttribute("listcourse")!=null) {
							List<Course> listcourse = (List<Course>)request.getAttribute("listcourse");
							for(Course temcourse : listcourse)
							{
					%>
					<tr>
						<td><%=temcourse.getSubno()%></td>
						<td><%=temcourse.getSubname()%></td>
						<td><%=temcourse.getTname()%><%=temcourse.getTno()%></td>
						<td><%=temcourse.getPjcount()%>人</td>
						<td><%=temcourse.getAvgscore()%></td>
						<td>
						   	<%
						   		Student temStudent=(Student)session.getAttribute("student");
						   		if(temStudent!=null&&!DALBase.isExist("pingjiao", MessageFormat.format("where stno=''{0}'' and subno=''{1}'' ",temStudent.getStno(),temcourse.getSubno()))) 
						   		{
						   	%>
						   	<a class="btn btn-success" href="<%=SystemParam.getSiteRoot() %>/admin/pingjiaomanager.do?actiontype=load&subno=<%=temcourse.getSubno() %>&forwardurl=/student/pingjiaoadd.jsp">
						   		<i class="icon-zoom-in icon-white"></i>在线评教
						   	</a>
						    <% } %>
						    <a class="btn btn-success" href="<%=SystemParam.getSiteRoot() %>/student/kcvoteres.jsp?subno=<%=temcourse.getSubno()%>">
						    	<i class="icon-zoom-in icon-white"></i>查看结果
						    </a>
						</td>
					</tr>
					<% } } %>
				</tbody>
			</table>
			
		<!--end box-->
		<div class="clear"></div>
	</body>
</html>
