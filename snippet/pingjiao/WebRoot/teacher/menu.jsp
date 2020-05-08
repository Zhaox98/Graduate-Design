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
        if(menuid != "") {
            $("#" + menuid).addClass("selected");
            $("#divAccordion dl dd").hide();
            $("#" + menuid).closest("dd").show().parent().addClass("current");
        }
    })   
</script>
<div class="left">
	<div style="width: 145px; height: 480px; padding: 0; margin: 0" id="divAccordion">
   		<div class="bgtop">
        	<img src="<%=SystemParam.getSiteRoot() %>/admin/images/ico1.png">
            <b>系统菜单</b>
        </div>
       	<dl class="bitem2">
			<dt>
				<img src="<%=SystemParam.getSiteRoot() %>/admin/images/ico2.png"> <b>课程管理</b>
			</dt>
			<dd class="current">
				<ul class="sitemu">
					<li>
                     	<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/coursemanager.do?actiontype=get&tno=${teacher.tno}&forwardurl=/teacher/coursemanager.jsp">
                       		<i class="icon-list-alt"></i>课程查看
                     	</a>
                   	</li>
                  	<li>
                    	<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/coursemanager.do?actiontype=load&forwardurl=/teacher/courseadd.jsp">
                       		<i class="icon-list-alt"></i>课程申请
                       	</a>
                 	</li>
                   	<li>
                    	<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/xuankemanager.do?tno=${teacher.tno}&actiontype=get&forwardurl=/teacher/xuankemanager.jsp">
                        	<i class="icon-list-alt"></i>选课管理
                       	</a>
                  	</li>
				</ul>
			</dd>
		</dl>
		<dl class="bitem2">
			<dt>
				<img src="<%=SystemParam.getSiteRoot() %>/admin/images/ico2.png"> <b>评选统计</b>
			</dt>
			<dd class="current">
				<ul class="sitemu">
					<li>
			        	<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/coursemanager.do?actiontype=get&tno=${teacher.tno}&forwardurl=/teacher/coursedefen.jsp">
							课程得分                 
			            </a>
			    	</li>
			 	</ul>
			</dd>
		</dl>
		<dl class="bitem2">
			<dt>
				<img src="<%=SystemParam.getSiteRoot() %>/admin/images/ico2.png"> <b>信息管理</b>
			</dt>
			<dd class="current">
				<ul class="sitemu">
					<li>
			      		<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/leavewordmanager.do?actiontype=get&replyren=${teacher.tno}&forwardurl=/teacher/leavewordmanager.jsp">
							留言管理
			            </a>
			     	</li>
			        <li>
			            <a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/noticemanager.do?actiontype=get&forwardurl=/teacher/noticemanager.jsp">
							系统公告
			            </a>
			     	</li>
				</ul>
			</dd>
		</dl>
		<dl class="bitem2">
			<dt>
				<img src="<%=SystemParam.getSiteRoot() %>/admin/images/ico2.png"> <b>账户管理</b>
			</dt>
			<dd class="current">
				<ul class="sitemu">
					<li>
						<a target="main"  href="<%=SystemParam.getSiteRoot() %>/teacher/modifypw.jsp">修改密码</a>
					</li>
					<li >
						<a target="main"  href="<%=SystemParam.getSiteRoot() %>/teacher/accountinfodetail.jsp">个人信息</a>
					</li>
					<li >
						<a target="main"  href="<%=SystemParam.getSiteRoot() %>/teacher/modifyinfo.jsp">编辑信息</a>
					</li>
				</ul>
			</dd>
		</dl>
		<div class="clear"></div>
    </div>
</div>
