package com.dao.action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SQLQuery;
import org.hibernate.Query;
import com.dao.dal.*;
import com.dao.bll.*;
import com.dao.entity.*;

import com.dao.util.HibernateSessionFactory;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.text.MessageFormat;
import com.dao.util.PagerMetal;

public class CourseAction extends PageActionBase {
	
	@Override
	public void onLoad() {
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		if (actiontype == null)
			return ;
		if (actiontype.equals("startXuanke")) {
			startXuanke();
		}
		if (actiontype.equals("endXuanke")) {
			endXuanke();
		}
		if (actiontype.equals("waitXuanke")) {
			waitXuanke();
		}
		if (actiontype.equals("getChoose")) {
			getChoose();
		}
	}

	private void waitXuanke() {
		String filter = "where status='选课中' ";
		String subname = request.getParameter("subname");
		if (subname != null)
			filter += "  and subname like '%" + subname + "%'  ";
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
		List<Course> listcourse = DALBase.getPageEnity("course", filter, pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("course", filter == null ? "" : filter);
		request.setAttribute("listcourse", listcourse);
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
			forwardurl = "/admin/coursemanager.jsp";
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

	private void endXuanke() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Course course = (Course) DALBase.load(Course.class, new Integer(id));
		if (course == null)
			return;
		course.setStatus("选课结束");
		DALBase.update(course);
		if (forwardurl == null) {
			forwardurl = "/admin/coursemanager.do?actiontype=get";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void startXuanke() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Course course = (Course) DALBase.load(Course.class, new Integer(id));
		if (course == null)
			return;
		course.setStatus("选课中");
		DALBase.update(course);
		if (forwardurl == null) {
			forwardurl = "/admin/coursemanager.do?actiontype=get";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		DALBase.delete("course", " where id=" + id);
		binding();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String subname = request.getParameter("subname");
		String subno = request.getParameter("subno");
		String xuefen = request.getParameter("xuefen");
		String des = request.getParameter("des");
		String tno=request.getParameter("tno");
		String tname=request.getParameter("tname");
		SimpleDateFormat sdfcourse = new SimpleDateFormat("yyyy-MM-dd");
		Course course = new Course();
		course.setSubname(subname == null ? "" : subname);
		course.setSubno(subno == null ? "" : subno);
		course.setXuefen(xuefen == null ? "" : xuefen);
		course.setDes(des == null ? "" : des);
		course.setTno(tno);
		course.setTname(tname);
		course.setStatus("选课中");
		course.setPjcount(0);
		course.setTotalscore(0);
		course.setAvgscore(0);
		// 产生验证
		Boolean validateresult = saveValidate(MessageFormat.format("where subname=''{0}'' or subno=''{1}''", subname,subno));
		if (validateresult) {
			try {
				request.setAttribute("errormsg", "<label class='error'>科目名称或编号重复</label>");
				request.setAttribute("course", course);
				request.setAttribute("actiontype", "save");
				request.getRequestDispatcher(errorurl).forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return;
		}
		DALBase.save(course);
		if (forwardurl == null) {
			forwardurl = "/admin/coursemanager.do?actiontype=get";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 新增验证
	private boolean saveValidate(String filter) {
		return DALBase.isExist("course", filter);
	}

	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Course course = (Course) DALBase.load(Course.class, new Integer(id));
		if (course == null)
			return;
		String subname = request.getParameter("subname");
		String subno = request.getParameter("subno");
		String xuefen = request.getParameter("xuefen");
		String des = request.getParameter("des");
		SimpleDateFormat sdfcourse = new SimpleDateFormat("yyyy-MM-dd");
		course.setSubname(subname);
		course.setSubno(subno);
		course.setXuefen(xuefen);
		course.setDes(des);
		DALBase.update(course);
		
		if (forwardurl == null) {
			forwardurl = "/admin/coursemanager.do?actiontype=get";
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
			Course course = (Course) DALBase.load("course", "where id=" + id);
			if (course != null) {
				request.setAttribute("course", course);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/courseadd.jsp";
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
	
	public void getChoose() {
		String SQL = "";
		String stno = request.getParameter("stno");
		String subname = request.getParameter("subname");
		SQL = "select kc.* from course kc ,xuanke xk where kc.subno=xk.subno ";
		if (stno != null)
			SQL+=" and xk.stno='"+stno+"'";
		if (subname != null)
			SQL += "  and kc.subname like '%" + subname + "%'  ";
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
		List<Course> listcourse = DALBase.runNativeSQLInPage(SQL, Course.class, pageindex, pagesize);
		int recordscount = DALBase.getNativeSQLCount(SQL);
		request.setAttribute("listcourse", listcourse);
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
			forwardurl = "/admin/coursemanager.jsp";
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

	
	public void binding() {
		String filter = "where 1=1 ";
		String subname = request.getParameter("subname");
		String tname=request.getParameter("tname");
		String tno=request.getParameter("tno");
		if (subname != null)
			filter += "  and subname like '%" + subname + "%'  ";
		if (tno != null)
			filter += "  and tno='" + tno + "'  ";
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
		List<Course> listcourse = DALBase.getPageEnity("course", filter, pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("course",
				filter == null ? "" : filter);
		request.setAttribute("listcourse", listcourse);
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
			forwardurl = "/admin/coursemanager.jsp";
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
