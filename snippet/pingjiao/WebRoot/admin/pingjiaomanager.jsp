<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.dao.bll.*,com.dao.util.PagerMetal"%>
<%@ page import="com.dao.entity.*" %>
<%@	page import="com.dao.dal.DALBase"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>评教信息</title>
    	<script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
	    <link href="<%=SystemParam.getSiteRoot() %>/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
	    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
	    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
	    <script src="<%=SystemParam.getSiteRoot()%>/webui/combo/combo.js" type="text/javascript"></script>
	    <link href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
	    <link href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet" type="text/css" />
	    <script src="<%=SystemParam.getSiteRoot() %>/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
	    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/webtable.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			$(function() {
				    
			});
	  	</script>
	</head>
	<body >
		<div class="search-title">
			<h2>评教记录</h2>
			<div class="description"></div>
		</div>
		<!-- 搜索控件开始 -->
		<div class="search-options">
			<form id="searchForm" action="<%=SystemParam.getSiteRoot() %>/admin/pingjiaomanager.do" method="post">
				<table cellspacing="0" width="100%">
					<tbody>
						<tr>
							<td>学号 
								<input name="stno" value="${stno}" class="input-txt" type="text" id="stno" /> 
								<input type="hidden" name="actiontype" value="search" /> 
								<input type="hidden" name="seedid" value="${seedid}" /> 
								<input type="hidden" name="forwardurl" value="/admin/pingjiaomanager.jsp" />
								<button class="orange-button">搜索</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<!-- 搜索控件结束 -->
		<div class="clear"></div>
		<table id="pingjiao" width="100%" border="0" cellspacing="0" cellpadding="0" class="ui-record-table">
			<thead>
				<tr>
					<th><b>学号</b></th>
					<th><b>姓名</b></th>
					<th><b>课程编号</b></th>
					<th><b>课程名</b></th>
					<th><b>得分</b></th>
					<th><b>评教时间</b></th>
					<th><b>说明</b></th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${listpingjiao== null || fn:length(listpingjiao) == 0}">
					<tr>
						<td colspan="20">没有相关评教信息</td>
					</tr>
				</c:if>
				<%	
					SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
					if(request.getAttribute("listpingjiao")!=null){
						List<Pingjiao> listpingjiao=( List<Pingjiao>)request.getAttribute("listpingjiao");
						for(Pingjiao  tempingjiao  :  listpingjiao) {
				%>
				<tr>
					<td><%=tempingjiao.getStno()%></td>
					<td><%=tempingjiao.getStname()%></td>
					<td><%=tempingjiao.getSubno()%></td>
					<td><%=tempingjiao.getSubname()%></td>
					<td><%=tempingjiao.getDefen()%></td>
					<td><%=sdf.format(tempingjiao.getPjtime())%></td>
					<td><%=tempingjiao.getDes()%></td>
					<td>
						<a class="orange-href" href="<%=SystemParam.getSiteRoot() %>/teacher/pingjiaodetails.jsp?id=<%=tempingjiao.getId()%>">查看</a>
					</td>
				</tr>
				<%}}%>
			</tbody>
		</table>
		<div class="clear"></div>
		<daowen:pager id="pager1" attcheform="searchForm" />
	</body>
</html>
