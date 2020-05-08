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
            <img src="<%=SystemParam.getSiteRoot() %>/admin/images/ico1.png">
            <b>系统菜单</b>
        </div>
      
		<dl class="bitem2">
			<dt>
				<img src="<%=SystemParam.getSiteRoot() %>/admin/images/ico2.png"> <b>选课管理</b>
			</dt>
			<dd class="current">
				<ul class="sitemu">
					<li>
                    	<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/xuankemanager.do?actiontype=get&stno=${requestScope.student.stno}&forwardurl=/student/xuankemanager.jsp">
 							选课查询
                        </a>
                   	</li>
                    <li>
                    	<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/coursemanager.do?actiontype=get&forwardurl=/student/xuankeguide.jsp">
							在线选课
                        </a>
                 	</li>
			        <li>
                        <a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/coursemanager.do?actiontype=getChoose&stno=${student.stno}&forwardurl=/student/pingjiaoguide.jsp">
                        	<i class="icon-list-alt"></i>在线评教
                        </a>
                    </li>
			    </ul>
			</dd>
		</dl>
		<dl class="bitem2">
			<dt>
				<img src="<%=SystemParam.getSiteRoot() %>/admin/images/ico3.png"> <b>留言管理</b>
			</dt>
			<dd class="current">
				<ul class="sitemu">
					<li>
			 			<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/teachermanager.do?actiontype=get&forwardurl=/student/lwguide.jsp">
			      			在线咨询
			            </a>
			        </li>
			        <li>
			            <a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/leavewordmanager.do?actiontype=get&lyren=${student.stno}&forwardurl=/student/leavewordmanager.jsp">
							我的留言
			        	</a>
			        </li>
			        <li>
				    	<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/noticemanager.do?actiontype=get&forwardurl=/student/noticemanager.jsp">
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
						<a target="main"  href="<%=SystemParam.getSiteRoot() %>/student/modifypw.jsp">修改密码</a>
					</li>
					<li>
						<a target="main"  href="<%=SystemParam.getSiteRoot() %>/student/accountinfodetail.jsp">个人信息</a>
					</li>
					<li>
						<a target="main"  href="<%=SystemParam.getSiteRoot() %>/student/modifyinfo.jsp">编辑信息</a>
					</li>	
				</ul>
			</dd>
		</dl>
		<div class="clear"></div>
    </div>
</div>
