<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.dao.bll.*,com.dao.util.PagerMetal"%>
<%@ page import="com.dao.entity.*" %>
<%@ page import="com.dao.dal.DALBase"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<%@ include file="law.jsp"%>
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
		<script type="text/javascript">
			$(function() {
			    $("#btnDelete").click(function(){
			        if($(".check:checked").length<1){
			        	top.$.dialog.alert("请选择需要删除的记录");
			           	return;
			        } 
			        $(".check:checked").each(function(index,domEle){
			            var id=$(domEle).val();
			            top.$.dialog.confirm("你确定要注销课程信息?", function(){
				        	window.location.href=encodeURI('<%=SystemParam.getSiteRoot()%>/admin/coursemanager.do?actiontype=delete&id='+id);
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
			            else{
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
			<h2>课程信息</h2>
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
		<div class="action-details">
			<!--  <a href="#" class="btn btn-success" id="btnCheckAll" class="action-button">选择</a> -->
			<a id="btnDelete" class="btn btn-danger" href="#"> 
				<i class="icon-trash icon-white"></i> 
				<b>删除${Description}</b>
			</a> 
		</div>
	
		<table id="module" width="100%" border="0" cellspacing="0" cellpadding="0" class="ui-record-table">
			<thead>
				<tr>
					<th>选择</th>
					<th><b>课程名</b></th>
					<th><b>课程编号</b></th>
					<th><b>学分</b></th>
					<th><b>选课</b></th>
					<th><b>开课教师</b></th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${listcourse== null || fn:length(listcourse) == 0}">
					<tr>
						<td colspan="20">没有相关课程信息</td>
					</tr>
				</c:if>
				<%
					if(request.getAttribute("listcourse")!=null){
						List<Course> listcourse = ( List<Course>)request.getAttribute("listcourse");
						for(Course  temcourse : listcourse)
						{
				%>
				<tr>
					<td>&nbsp
						<input id="chk<%=temcourse.getId()%>" class="check" name="chk<%=temcourse.getId()%>" type="checkbox" 
							value='<%=temcourse.getId()%>'>
					</td>
					<td><%=temcourse.getSubname()%></td>
					<td><%=temcourse.getSubno()%></td>
					<td><%=temcourse.getXuefen()%></td>
					<td><%=temcourse.getStatus()%></td>
					<td><%=temcourse.getTname()%>(<%=temcourse.getTno() %>)</td>
					<td>
						<%
					   		if(temcourse!=null && temcourse.getStatus()!=null && temcourse.getStatus().equals("选课结束"))
					   		{ 
					   	%>
						<form style="display: inline" action="<%=SystemParam.getSiteRoot() %>/admin/coursemanager.do">
							<input type="hidden" name="actiontype" value="startXuanke"/>
						    <input type="hidden" name="id" value="<%=temcourse.getId()%>"/>
						    <input type="hidden" name="forwardurl" value="/admin/coursemanager.do?actiontype=get"/>
						    <button class="btn btn-success">
						    	<i class="icon-zoom-in icon-white"></i>启动选课
							</button>
						</form>
					   	<%	} %>
					   	<%
					   		if(temcourse!=null && temcourse.getStatus()!=null && temcourse.getStatus().equals("选课中"))
					   		{ 
					   	%>
					    <form style="display: inline" action="<%=SystemParam.getSiteRoot() %>/admin/coursemanager.do">
					    	<input type="hidden" name="actiontype" value="endXuanke"/>
					        <input type="hidden" name="id" value="<%=temcourse.getId()%>"/>
					        <input type="hidden" name="forwardurl" value="/admin/coursemanager.do?actiontype=get"/>
					        <button class="btn btn-danger">
					        	<i class="icon-zoom-in icon-white"></i>结束选课
							</button>
					    </form>
					   	<%	} %>
					    <a class="btn btn-info" href="<%=SystemParam.getSiteRoot() %>/admin/coursemanager.do?actiontype=load&id=<%=temcourse.getId()%>">
					    	<i class="icon-edit icon-white"></i>修改
					    </a> 
						<a class="btn btn-success"	href="<%=SystemParam.getSiteRoot() %>/admin/coursedetails.jsp?id=<%=temcourse.getId()%>">
							<i class="icon-zoom-in icon-white"></i>查看
						</a>
					</td>
				</tr>
				<%}}%>
			</tbody>
		</table>
	
		<!--end box-->
		<div class="clear"></div>
		<daowen:pager id="pager1" attcheform="searchForm" />
	</body>
</html>
