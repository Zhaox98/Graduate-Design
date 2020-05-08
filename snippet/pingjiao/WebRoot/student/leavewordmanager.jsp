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
		<title>留言信息</title>
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
				$("#btnDelete").click(function(){
					if($(".check:checked").length<1) {
				    	top.$.dialog.alert("请选择需要删除的记录");
				    	return;
				   	} 
				   	$(".check:checked").each(function(index,domEle){
				    	var id=$(domEle).val();
				       	top.$.dialog.confirm("你确定要注销留言信息?", function(){
					   		window.location.href=encodeURI('<%=SystemParam.getSiteRoot()%>/admin/leavewordmanager.do?forwardurl=/student/leavewordmanager.jsp&actiontype=delete&id='+id);
					 	});
				  	});
				});
				$("#btnCheckAll").click(function(){
					var ischeck=false;
				 	$(".check").each(function(){
				    	if($(this).is(":checked")) {
				     		$(this).prop("checked","");
				           	ischeck=false;
				       	}
				        else {
				     		$(this).prop("checked","true");
				           	ischeck=true;
				       	}
				  	});
				 	if($(this).text()=="选择记录")
				    	$(this).text("取消选择");
				   	else
				    	(this).text("选择记录");
				})
			});
		</script>
	</head>
	<body >
		<div class="search-title">
			<h2>留言列表</h2>
			<div class="description"></div>
		</div>
		<!-- 搜索控件开始 -->
		<div class="search-options">
			<form id="searchForm" action="<%=SystemParam.getSiteRoot() %>/admin/leavewordmanager.do" method="post">
				<table cellspacing="0" width="100%">
					<tbody>
						<tr>
							<td>标题 
								<input name="title" value="${title}" class="input-txt" type="text" id="title" /> 
								<input type="hidden" name="actiontype" value="search" /> 
								<input type="hidden" name="lyren" value="${student.stno}" /> 
								<input type="hidden" name="forwardurl" value="/student/leavewordmanager.jsp" />
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
	
		<table id="leaveword" width="100%" border="0" cellspacing="0" cellpadding="0" class="ui-record-table">
			<thead>
				<tr>
					<th><b>标题</b></th>
					<th><b>咨询时间</b></th>
					<th><b>咨询教师</b></th>
					<th><b>状态</b></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${listleaveword== null || fn:length(listleaveword) == 0}">
					<tr>
						<td colspan="20">没有相关留言信息</td>
					</tr>
				</c:if>
				<%	
					if(request.getAttribute("listleaveword")!=null) {
						List<Leaveword> listleaveword=( List<Leaveword>)request.getAttribute("listleaveword");
						for(Leaveword  temleaveword  :  listleaveword)
						{
				%>
				<tr>
					<td><%=temleaveword.getTitle()%></td>
					<td><%=temleaveword.getCreatetime().toLocaleString()%></td>
					<td><%=temleaveword.getReplyren()%></td>
					<td>
					   	<%
					   		if(temleaveword.getStatus()==1)
					   		{
					   	%>
					   	待回复
					   	<% } %>
					    <%
					    	if(temleaveword.getStatus()==2)
					    	{
					    %>
					       已回复
					   	<% } %>
					</td>
					<td>
						<%
							if(temleaveword.getStatus()==1)
							{
						%>
					    <a class="orange-href" href="<%=SystemParam.getSiteRoot() %>/admin/leavewordmanager.do?actiontype=load&id=<%=temleaveword.getId()%>&tno=<%=temleaveword.getReplyren() %>&forwardurl=/student/leavewordadd.jsp">查看</a>
						<% } %>
					 	<%
					 		if(temleaveword.getStatus()==2)
					 		{
					 	%>
					    <a class="orange-href" href="<%=SystemParam.getSiteRoot() %>/student/leaveworddetails.jsp?id=<%=temleaveword.getId()%>">
					    	<i class="icon-zoom-in icon-white"></i>查看详情
					    </a>
					 	<% } %>		
					</td>
				</tr>
				<% } } %>
			</tbody>
		</table>
		<div class="clear"></div>
		<daowen:pager id="pager1" attcheform="searchForm" />
	</body>
</html>
