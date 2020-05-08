package com.dao.action;

import java.io.IOException;
import java.text.MessageFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


import com.dao.bll.SystemParam;
import com.dao.dal.DALBase;
import com.dao.entity.Attachement;


import com.dao.entity.Admin;
import com.dao.util.PagerMetal;


public class AdminAction extends PageActionBase {
	public void  onLoad() {
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		if (actiontype == null)
			return ;
		if (actiontype.equals("modifyPw"))
			modifyPw();
		
	}
	
	private void modifyPw() {
		String password1 = request.getParameter("password1");
		String repassword1 = request.getParameter("repassword1");
		String repassword2 = request.getParameter("repassword2");
		String forwardurl = request.getParameter("forwardurl");
		String errorpageurl = request.getParameter("errorpageurl");
		String id = request.getParameter("id");
		if (id == null || id == "")
			return;
		Admin admin = (Admin) DALBase.load(Admin.class, new Integer(id));
		if (admin != null) {
			if (!admin.getPassword().equals(password1)) {
				try {
					request.setAttribute("errormsg",
							"<label class='error'>原始密码不正确，不能修改</label>");
					request.getRequestDispatcher(errorpageurl).forward(request,
							response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				admin.setPassword(repassword1);
				DALBase.update(admin);
				request.getSession().setAttribute("admin", admin);
				try {
					if (forwardurl != null)
						response.sendRedirect(SystemParam.getSiteRoot()
								+ forwardurl);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}


	/***************************************************************************
	 * *****************信息注销监听支持*****************************
	 **************************************************************************/
	public void delete() {
		String id = request.getParameter("id");
		DALBase.delete("admin", " where id=" + id);
		binding();
	}

	/***************************************************************************
	 * ***************保存动作监听支持******************************
	 **************************************************************************/
	public void save() {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String rolename = request.getParameter("rolename");
		String creator = request.getParameter("creator");
		String createtime = request.getParameter("createtime");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");

		String realname = request.getParameter("realname");
		String nickname = request.getParameter("nickname");
		String sex = request.getParameter("sex");
		String xiangpian = request.getParameter("xiangpian");
		SimpleDateFormat sdfadmin = new SimpleDateFormat("yyyy-MM-dd");
		Admin admin = new Admin();
		admin.setUsername(username == null ? "" : username);
		admin.setPassword(password == null ? "" : password);
		
		admin.setCreator(creator == null ? "" : creator);
		
		admin.setCreatetime(new Date());
		
		admin.setEmail(email == null ? "" : email);
		admin.setTel(tel == null ? "" : tel);
		admin.setLogtimes(0);
		admin.setRealname(realname == null ? "" : realname);
		admin.setNickname(nickname == null ? "" : nickname);
		admin.setSex(sex == null ? "" : sex);
		admin.setXiangpian(xiangpian == null ? "" : xiangpian);
		DALBase.save(admin);
		// 保存附件
	
		// 绑定数据
		binding();
	}

	
	/***************************************************************************
	 * **********************更新内部支持*********************
	 **************************************************************************/
	public void update() {
		String id = request.getParameter("id");
		if (id == null)
			return;
		Admin admin = (Admin) DALBase.load(Admin.class, new Integer(id));
		if (admin == null)
			return;
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String rolename = request.getParameter("rolename");
		String creator = request.getParameter("creator");
		String createtime = request.getParameter("createtime");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String logtimes = request.getParameter("logtimes");
		String realname = request.getParameter("realname");
		String nickname = request.getParameter("nickname");
		String sex = request.getParameter("sex");
		String xiangpian = request.getParameter("xiangpian");
		SimpleDateFormat sdfadmin = new SimpleDateFormat("yyyy-MM-dd");
		admin.setUsername(username);
		admin.setCreator(creator);
		admin.setEmail(email);
		admin.setTel(tel);
		admin.setRealname(realname);
		admin.setNickname(nickname);
		admin.setSex(sex);
		admin.setXiangpian(xiangpian);
		DALBase.update(admin);
		binding();
	}

	/***************************************************************************
	 * **********************加载内部支持*********************
	 **************************************************************************/
	public void load() {
		//
		String id = request.getParameter("id");
		String actiontype = "save";
		if (id != null) {
			Admin admin = (Admin) DALBase.load("admin", "where id=" + id);
			if (admin != null) {
				request.setAttribute("admin", admin);
			}
			actiontype = "update";
		}
		request.setAttribute("id", id);
		request.setAttribute("actiontype", actiontype);
		
		try {
			request.getRequestDispatcher("adminadd.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/***************************************************************************
	 * **********************数据绑定内部支持*********************
	 **************************************************************************/
	public void binding() {
		String filter = "";
		String username = request.getParameter("username");
		if (username != null)
			filter = "  where username like '%" + username + "%'  ";
		//
		int pageindex = 1;
		int pagesize = 10;
		// 获取当前分页
		String currentpageindex = request.getParameter("currentpageindex");
		// 当前页面尺寸
		String currentpagesize = request.getParameter("pagesize");
		// 设置当前页
		if (currentpageindex != null)
			pageindex = new Integer(currentpageindex);
		// 设置当前页尺寸
		if (currentpagesize != null)
			pagesize = new Integer(currentpagesize);
		List<Admin> listadmin = DALBase.getPageEnity("admin", filter, pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("admin", filter == null ? "" : filter);
		request.setAttribute("listadmin", listadmin);
		PagerMetal pm = new PagerMetal(recordscount);
		// 设置尺寸
		pm.setPagesize(pagesize);
		// 设置当前显示页
		pm.setCurpageindex(pageindex);
		// 设置分页信息
		request.setAttribute("pagermetal", pm);
		// 分发请求参数
		dispatchParams(request, response);
		try {
			request.getRequestDispatcher("/admin/adminmanager.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
