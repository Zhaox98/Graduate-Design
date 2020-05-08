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
			<h2>课程得分</h2>
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
								<input type="hidden" name="actiontype" value="search" />
								<input type="hidden" name="seedid" value="${seedid}" />
								<input type="hidden" name="forwardurl" value="/admin/coursedefen.jsp"/>
								<button class="btn  btn-success">
									<i class="icon-search icon-white"></i>搜索
								</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<table id="module" width="100%" border="0" cellspacing="0" cellpadding="0" class="ui-record-table">
			<thead>
				<tr>
					<th><b>课程名</b></th>
					<th><b>课程编号</b></th>
					<th><b>学分</b></th>
					<th><b>平均得分</b></th>
					<th><b>测评人数:</b></th>
					<th><b>开课教师</b></th>
				</tr>
			</thead>
			
			<tbody>
				<c:if test="${listcourse== null || fn:length(listcourse) == 0}">
					<tr>
						<td colspan="20">没有相关课程信息</td>
					</tr>
				</c:if>
				<%
					if(request.getAttribute("listkcourse")!=null)
					{
						List<Course> listcourse=( List<Course>)request.getAttribute("listcourse");
						for(Course  temcourse  :  listcourse)
						{
					
				%>
				<tr>
					<td><%=temcourse.getSubname()%></td>
					<td><%=temcourse.getSubno()%></td>
					<td><%=temcourse.getXuefen()%></td>
					<td>
						<span class="weight14font">
					    	<%=temcourse.getAvgscore()%>分
					    </span>
					</td>
					<td><span class="weight14font">
					     <%=temcourse.getPjcount()%>人
					    </span>
					</td>
					<td><%=temcourse.getTname()%>(<%=temcourse.getTno() %>)</td>
					<td></td>
				</tr>
				<%}}%>
			</tbody>
		</table>
	</div>
	<!--end box-->
	<div class="clear"></div>
	<daowen:pager id="pager1" attcheform="searchForm" />
</body>
</html>
