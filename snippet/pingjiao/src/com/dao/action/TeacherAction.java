package com.dao.action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SQLQuery;
import org.hibernate.Query;
import com.dao.dal.*;
import com.dao.bll.*;
import com.dao.entity.*;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.text.MessageFormat;
import com.dao.util.PagerMetal;

/**************************
 * 
 * @author zx
 * 
 * 教师控制
 * 
 */

public class TeacherAction extends PageActionBase {
	@Override
	public void onLoad() {
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		if (actiontype == null)
			return;
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
		Teacher teacher = (Teacher) DALBase.load(Teacher.class, new Integer(id));
		if (teacher != null) {
			if (!teacher.getPassword().equals(password1)) {
				try {
					request.setAttribute("errormsg", "<label class='error'>原始密码不正确，不能修改</label>");
					request.getRequestDispatcher(errorpageurl).forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				teacher.setPassword(repassword1);
				DALBase.update(teacher);
				request.getSession().setAttribute("teacher", teacher);
				try {
					if (forwardurl != null)
						response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		DALBase.delete("teacher", " where id=" + id);
		binding();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String tno = request.getParameter("tno");
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		String jiguan = request.getParameter("jiguan");
		String zhiwei = request.getParameter("zhiwei");
		String zhicheng = request.getParameter("zhicheng");
		String xueli = request.getParameter("xueli");
		String mianmao = request.getParameter("mianmao");
		String nation = request.getParameter("nation");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String jieshao = request.getParameter("jieshao");
		String name = request.getParameter("name");
		String gradschool = request.getParameter("gradschool");
		String major = request.getParameter("major");
		String photo = request.getParameter("photo");
		SimpleDateFormat sdfteacher = new SimpleDateFormat("yyyy-MM-dd");
		Teacher teacher = new Teacher();
		teacher.setTno(tno == null ? "" : tno);
		teacher.setPassword("123456");
		teacher.setSex(sex == null ? "" : sex);
		teacher.setJiguan(jiguan == null ? "" : jiguan);
		teacher.setZhiwei(zhiwei == null ? "" : zhiwei);
		teacher.setZhicheng(zhicheng == null ? "" : zhicheng);
		teacher.setXueli(xueli == null ? "" : xueli);
		teacher.setMianmao(mianmao == null ? "" : mianmao);
		teacher.setNation(nation == null ? "" : nation);
		teacher.setEmail(email == null ? "" : email);
		teacher.setTel(tel == null ? "" : tel);
		teacher.setJieshao(jieshao == null ? "" : jieshao);
		teacher.setName(name == null ? "" : name);
		teacher.setGradschool(gradschool == null ? "" : gradschool);
		teacher.setMajor(major == null ? "" : major);
		teacher.setPhoto(photo == null ? "" : photo);
		// 产生验证
		Boolean validateresult = saveValidate("where tno='" + tno + "'");
		if (validateresult) {
			try {
				request.setAttribute("errormsg", "<label class='error'>已经存在工号</label>");
				request.setAttribute("teacher", teacher);
				request.setAttribute("actiontype", "save");
				request.getRequestDispatcher(errorurl).forward(request,
						response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return;
		}
		DALBase.save(teacher);
		
		if (forwardurl == null) {
			forwardurl = "/admin/teachermanager.do?actiontype=get";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 新增验证
	private boolean saveValidate(String filter) {
		return DALBase.isExist("teacher", filter);
	}

	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Teacher teacher = (Teacher) DALBase.load(Teacher.class, new Integer(id));
		if (teacher == null)
			return;
		String tno = request.getParameter("tno");
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		String jiguan = request.getParameter("jiguan");
		String zhiwei = request.getParameter("zhiwei");
		String zhicheng = request.getParameter("zhicheng");
		String xueli = request.getParameter("xueli");
		String mianmao = request.getParameter("mianmao");
		String nation = request.getParameter("nation");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String jieshao = request.getParameter("jieshao");
		String name = request.getParameter("name");
		String gradschool = request.getParameter("gradschool");
		String major = request.getParameter("major");
		String photo = request.getParameter("photo");
		SimpleDateFormat sdfteacher = new SimpleDateFormat("yyyy-MM-dd");
		if(tno!=null)
			teacher.setTno(tno);
		teacher.setSex(sex);
		teacher.setJiguan(jiguan);
		teacher.setZhiwei(zhiwei);
		teacher.setZhicheng(zhicheng);
		teacher.setXueli(xueli);
		teacher.setMianmao(mianmao);
		teacher.setNation(nation);
		teacher.setEmail(email);
		teacher.setTel(tel);
		teacher.setJieshao(jieshao);
		if(name!=null)
			teacher.setName(name);
		teacher.setGradschool(gradschool);
		teacher.setMajor(major);
		teacher.setPhoto(photo);
		DALBase.update(teacher);
		if (forwardurl == null) {
			forwardurl = "/admin/teachermanager.do?actiontype=get";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/******************************************************
	 *********************** 加载内部支持*********************
	 *******************************************************/
	public void load() {
		//
		String id = request.getParameter("id");
		String actiontype = "save";
		dispatchParams(request, response);
		if (id != null) {
			Teacher teacher = (Teacher) DALBase.load("teacher", "where id=" + id);
			if (teacher != null) {
				request.setAttribute("teacher", teacher);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/teacheradd.jsp";
		}
		try {
			request.getRequestDispatcher(forwardurl).forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void binding() {
		String filter = "where 1=1 ";
		String teachername = request.getParameter("teachername");
		if (teachername != null)
			filter += "  and teachername like '%" + teachername + "%'  ";
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
		List<Teacher> listteacher = DALBase.getPageEnity("teacher", filter, pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("teacher", filter == null ? "" : filter);
		request.setAttribute("listteacher", listteacher);
		PagerMetal pm = new PagerMetal(recordscount);
		// 设置尺寸
		pm.setPagesize(pagesize);
		// 设置当前显示页
		pm.setCurpageindex(pageindex);
		// 设置分页信息
		request.setAttribute("pagermetal", pm);
		// 分发请求参数
		dispatchParams(request, response);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/teachermanager.jsp";
		}
		try {
			request.getRequestDispatcher(forwardurl).forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
