<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.dao.bll.*,com.dao.util.PagerMetal"%>
<%@ page import="com.dao.entity.*" %>
<%@ page import="com.dao.dal.DALBase"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="org.jfree.chart.JFreeChart"%>
<%@ page import="org.jfree.chart.servlet.ServletUtilities"%>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>$Description}统计</title>
      	<link href="<%=SystemParam.getSiteRoot() %>/admin/css/webtable.css" rel="stylesheet" type="text/css" />
    	<link href="<%=SystemParam.getSiteRoot() %>/admin/css/menu.css" rel="stylesheet" type="text/css" />
    	<script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.9.0.js"></script>
     	<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
        <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/jquery-ui.js"></script>
    	<script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
     	<link href="<%=SystemParam.getSiteRoot() %>/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    	<script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    	<script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    	<link href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    	<link href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet" type="text/css" />
    	<script src="<%=SystemParam.getSiteRoot() %>/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script> 
		<script type="text/javascript">
	    	$(function(){
	    		$("#txtBegintime").datepicker({
                  	dateFormat:'yy-mm-dd'
               	});
				if($("#txtBegintime").val()==""){
					$("#txtBegintime").datepicker("setDate",new Date());
				}
				$("#txtEndtime").datepicker({
		           	dateFormat:'yy-mm-dd'
               	});
				if($("#txtEndtime").val()==""){
					$("#txtEndtime").datepicker("setDate",new Date());
				}
	    	})
	 	</script>
	</head>
	<body >
		<div class="search-title">
			<h2>我的科目平均分统计</h2>
            <div class="description"></div>
        </div>
        <div class="search-options">
			<form id="searchForm" action="<%=SystemParam.getSiteRoot() %>/admin/tongjimanager.do" method="post">
				<input type="hidden" name="actiontype"  value="avgTongji"/>
				<input type="hidden" name="stno"  value="${student.stno}"/>
				<input type="hidden" name="forwardurl"  value="/student/avgtongji.jsp"/>
				<table cellspacing="0" width="100%">
					<tbody>
						<tr>
							<td>
								开始时间:<input name="begintime"  value="${begintime}" class="input-txt" type="text" id="txtBegintime" />
	                        	结束时间:<input name="endtime"  value="${begintime}" class="input-txt" type="text" id="txtEndtime" />
								<div class="ui-button">
									<button class="ui-button-text">搜索</button>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
        <div style="height:5px;"></div>
		<c:if test="${imageurl!= null }">
			<img src="${imageurl}" />
		</c:if>
	</body>
</html>
