<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dao.bll.*" %>

<script type="text/javascript">
	$(function () {
	
		$("#divAccordion dl dt").click(function () {
			$("#divAccordion dl").removeClass("current").addClass("bitem2");
            $("#divAccordion dl dd").hide();
            $(this).siblings("dd").show();
            $(this).parent().addClass("current");
        })
		$(".sitemu li").click(function () {
			$(".sitemu li").removeClass("selected");
            $(this).addClass("selected");
        })

        var menuid = '<%=request.getParameter("menuid")%>';

        if (menuid != "") {
            $("#" + menuid).addClass("selected");
            $("#divAccordion dl dd").hide();
            $("#" + menuid).closest("dd").show().parent().addClass("current");
        }
        
    })   
  
</script>

<div class="left">
    <div style="width: 145px; height: 480px; padding: 0; margin: 0" id="divAccordion">
        <div class="bgtop">
            <img src="images/ico1.png">
            <b>系统菜单</b>
        </div>

        <dl class="bitem2">
			<dt>
				<img src="images/ico2.png"> <b>教学情况</b>
			</dt>
			<dd class="current">
				<ul class="sitemu">
					<li>
               			<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/coursemanager.do?actiontype=get&seedid=101">
                        	<i class="icon-list-alt"></i>课程管理
                        </a>
                   	</li>
                   	<li>
                    	<a  target="main" href="<%=SystemParam.getSiteRoot() %>/admin/xuankemanager.do?actiontype=get&seedid=101">
                        	<i class="icon-list-alt"></i>选课管理
                        </a>
                    </li> 
                    <li>
                    	<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/coursemanager.do?actiontype=get&forwardurl=/admin/coursedefen.jsp">
                        	<i class="icon-list-alt"></i>评教得分查询
                        </a>
                   	</li>
                    <li>
                    	<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/pingjiaomanager.do?actiontype=get&forwardurl=/admin/pingjiaomanager.jsp">
                        	<i class="icon-list-alt"></i>评教记录查询
                        </a>
                    </li>
                          
			    </ul>
			</dd>
		</dl>
	   
		<dl class="bitem2">
			<dt>
				<img src="images/ico2.png"> <b>基础信息</b>
			</dt>
			<dd class="current">
				<ul class="sitemu">
					<li>
						<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/pjitemsmanager.do?actiontype=get&forwardurl=/admin/pjitemsmanager.jsp">
					              评教标准
					 	</a>
					</li>	
					<li>
						<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/noticemanager.do?actiontype=get&forwardurl=/admin/noticemanager.jsp">
							公告管理
						</a>
					</li>
					<li>
						<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/studentmanager.do?actiontype=get&forwardurl=/admin/studentmanager.jsp">
							学生管理 
						</a>
					</li>
					<li>
						<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/teachermanager.do?actiontype=get&forwardurl=/admin/teachermanager.jsp">
							教师管理 
						</a>
					</li>
					<li>
						<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/classmanager.do?actiontype=get&forwardurl=/admin/classmanager.jsp">
							班级管理 
						</a>
					</li>
					<li>
						<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/majormanager.do?actiontype=get&forwardurl=/admin/majormanager.jsp">
							专业管理
						</a>
					</li>
				</ul>
			</dd>
		</dl>

		<dl class="bitem2">
			<dt>
				<img src="images/ico2.png"> <b>账户管理</b>
			</dt>
			<dd class="current">
				<ul class="sitemu">
					<li>
						<a target="main" href="<%=SystemParam.getSiteRoot()%>/admin/adminmanager.do?actiontype=get&forwardurl=/admin/adminmanager.jsp">
							管理员列表
						</a>
					</li>
					<li>
						<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/modifypw.jsp">修改密码</a>
					</li>
					<li>
						<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/accountinfo.jsp">账户信息</a>
					</li>
					<li>
						<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/modifyinfo.jsp">编辑信息</a>
					</li>
				</ul>
			</dd>
		</dl>
		
		<div class="clear"></div>
		
    </div>
</div>

