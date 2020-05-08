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
		<title>公告信息</title>
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
			       		top.$.dialog.confirm("你确定要注销公告信息?", function(){
				        	window.location.href=encodeURI('<%=SystemParam.getSiteRoot()%>/admin/noticemanager.do?forwardurl=/admin/noticemanager.jsp&actiontype=delete&id='+id);
				    	});
			     	});
			 	});
			    $("#btnCheckAll").click(function(){
			    	var ischeck=false;
			      	$(".check").each(function(){
			        	if($(this).is(":checked")){
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
			           	$(this).text("选择记录");
				})
			});
		</script>
	</head>
	<body >
		<div class="search-title">
			<h2>公告列表</h2>
			<div class="description"></div>
		</div>
		<!-- 搜索控件开始 -->
	
		<!-- 搜索控件结束 -->
		<div class="clear"></div>
		<table id="notice" width="100%" border="0" cellspacing="0" cellpadding="0" class="ui-record-table">
			<thead>
				<tr>
					<th><b>标题</b></th>
					<th><b>创建时间</b></th>
					<th><b>发布人</b></th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${listnotice== null || fn:length(listnotice) == 0}">
					<tr>
						<td colspan="20">没有相关公告信息</td>
					</tr>
				</c:if>
				<%	
					if(request.getAttribute("listnotice")!=null){
						List<Notice> listnotice=( List<Notice>)request.getAttribute("listnotice");
						for(Notice  temnotice  :  listnotice)
						{
				%>
				<tr>
					<td><%=temnotice.getTitle()%></td>
					<td><%=temnotice.getCreatetime().toLocaleString()%></td>
					<td><%=temnotice.getPubren()%></td>
					<td> 
						<a class="orange-button" href="<%=SystemParam.getSiteRoot() %>/teacher/noticedetails.jsp?id=<%=temnotice.getId()%>">
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
