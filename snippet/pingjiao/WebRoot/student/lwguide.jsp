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
		<title>教师信息</title>
	    <script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
	    <link href="<%=SystemParam.getSiteRoot() %>/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
	    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
	    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
	    <script src="<%=SystemParam.getSiteRoot()%>/webui/combo/combo.js" type="text/javascript"></script>
	    <link href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
	    <link href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet" type="text/css" />
	    <script src="<%=SystemParam.getSiteRoot() %>/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
	    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/webtable.css" rel="stylesheet" type="text/css" />
	</head>
	<body >
		<div class="search-title">
			<h2>咨询列表</h2>
			<div class="description"></div>
		</div>
		<!-- 搜索控件开始 -->
		<div class="search-options">
			<form id="searchForm" action="<%=SystemParam.getSiteRoot() %>/admin/teachermanager.do" method="post">
				<table cellspacing="0" width="100%">
					<tbody>
						<tr>
							<td>教师名
								<input name="teachername" value="${teachername}" class="input-txt" type="text" id="teachername" /> 
								<input type="hidden" name="actiontype" value="search" /> 
								<input type="hidden" name="seedid" value="${seedid}" /> 
								<input type="hidden" name="forwardurl" value="/student/teacherlist.jsp" />
								<div class="ui-button">
									<button class="ui-button-text">搜索</button>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<!-- 搜索控件结束 -->
		<div class="clear"></div>
		<div class="picture-box2">
			<ul>
				<%	
					if(request.getAttribute("listteacher")!=null) {
						List<Teacher> listteacher=( List<Teacher>)request.getAttribute("listteacher");
						for(Teacher  temteacher  :  listteacher)
						{
				%>
				<li>
					<a href="<%=SystemParam.getSiteRoot() %>/admin/leavewordmanager.do?actiontype=load&tno=<%= temteacher.getTno()%>&forwardurl=/student/leavewordadd.jsp">
						<img width="180" height="180" src="<%= temteacher.getPhoto()%>" />
					</a> 
					<span> <%= temteacher.getName()%></span>
					
					<div style="text-align:center;">
						<a class="orange-href" href="<%=SystemParam.getSiteRoot() %>/admin/leavewordmanager.do?actiontype=load&tno=<%= temteacher.getTno()%>&forwardurl=/student/leavewordadd.jsp">
							在线咨询 
						</a>
					</div>
				</li>
				<% } } %>
			</ul>
		</div>
		<!--end  picture-box-->
		<div class="clear"></div>
		<daowen:pager id="pager1" attcheform="searchForm" />
	</body>
</html>
