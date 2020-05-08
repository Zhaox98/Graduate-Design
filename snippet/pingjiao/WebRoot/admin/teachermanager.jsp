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
		<script type="text/javascript">
			$(function() {
				$("#btnDelete").click(function(){
			    	if($(".check:checked").length<1){
			       		top.$.dialog.alert("请选择需要删除的记录");
			           	return;
			        } 
			        $(".check:checked").each(function(index,domEle){
			        	var id=$(domEle).val();
			       		top.$.dialog.confirm("你确定要注销教师信息?", function(){
				        	window.location.href=encodeURI('<%=SystemParam.getSiteRoot()%>/admin/teachermanager.do?forwardurl=/admin/teachermanager.jsp&actiontype=delete&id='+id);
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
			<h2>教师管理</h2>
			<div class="description">
				<a href="<%=SystemParam.getSiteRoot() %>/admin/teachermanager.do?actiontype=load">新建教师</a>
			</div>
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
								<input type="hidden" name="forwardurl" value="/admin/teachermanager.jsp" />
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
		<div class="action-details">
			<!--  <a href="#" class="btn btn-success" id="btnCheckAll" class="action-button">选择</a> --> 
		   	<a id="btnDelete" class="action-btn" href="#">
				<em class="icon-delete"></em>
				<b>删除</b>
			</a>
		</div>
		<table id="teacher" width="100%" border="0" cellspacing="0" cellpadding="0" class="ui-record-table">
			<thead>
				<tr>
					<th>选择</th>
					<th><b>工号</b></th>
					<th><b>性别</b></th>
					<th><b>籍贯</b></th>
					<th><b>职位</b></th>
					<th><b>职称</b></th>
					<th><b>学历</b></th>
					<th><b>面貌</b></th>
					<th><b>民族</b></th>
					<th><b>邮箱</b></th>
					<th><b>电话</b></th>
					<th><b>毕业院校</b></th>
					<th><b>专业</b></th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${listteacher== null || fn:length(listteacher) == 0}">
					<tr>
						<td colspan="20">没有相关教师信息</td>
					</tr>
				</c:if>
				<%	
					if(request.getAttribute("listteacher")!=null){
						List<Teacher> listteacher=( List<Teacher>)request.getAttribute("listteacher");
						for(Teacher  temteacher  :  listteacher) {
				%>
				<tr>
					<td>&nbsp
						<input id="chk<%=temteacher.getId()%>" class="check" name="chk<%=temteacher.getId()%>" type="checkbox"
							value='<%=temteacher.getId()%>'>
					</td>
					<td><%=temteacher.getTno()%>(<%=temteacher.getName()%>)</td>
					<td><%=temteacher.getSex()%></td>
					<td><%=temteacher.getJiguan()%></td>
					<td><%=temteacher.getZhiwei()%></td>
					<td><%=temteacher.getZhicheng()%></td>
					<td><%=temteacher.getXueli()%></td>
					<td><%=temteacher.getMianmao()%></td>
					<td><%=temteacher.getNation()%></td>
					<td><%=temteacher.getEmail()%></td>
					<td><%=temteacher.getTel()%></td>
					<td><%=temteacher.getGradschool()%></td>
					<td><%=temteacher.getMajor()%></td>
					<td>
						<a class="orange-href" href="<%=SystemParam.getSiteRoot() %>/admin/teachermanager.do?actiontype=load&id=<%=temteacher.getId()%>&forwardurl=/admin/teacheradd.jsp">
						    修改</a>
	                  	<a class="orange-href" href="<%=SystemParam.getSiteRoot() %>/admin/teacherdetails.jsp?id=<%=temteacher.getId()%>">
						     查看</a>
					</td>
				</tr>
				<% } } %>
			</tbody>
		</table>
		<div class="clear"></div>
		<daowen:pager id="pager1" attcheform="searchForm" />
	</body>
</html>
