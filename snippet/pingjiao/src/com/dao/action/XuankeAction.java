package com.dao.action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.tiles.xmlDefinition.I18nFactorySet;
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

public class XuankeAction extends PageActionBase {
	
	public void  onLoad(){
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		// 更新
		if (actiontype.equals("addScore")) {
			addScore();
		}
	}

	private void addScore() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Xuanke xuanke = (Xuanke) DALBase.load(Xuanke.class, new Integer(id));
		if (xuanke == null)
			return;
		String score = request.getParameter("score");
		SimpleDateFormat sdfxuanke = new SimpleDateFormat("yyyy-MM-dd");
		xuanke.setStatus("选修完成");
		xuanke.setScore(score == null ? (double) 0 : new Double(score));
		DALBase.update(xuanke);
		if (forwardurl == null) {
			forwardurl = "/admin/xuankemanager.do?actiontype=get";
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
		DALBase.delete("xuanke", " where id=" + id);
		binding();
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String stno = request.getParameter("stno");
		String sname = request.getParameter("sname");
		String subno = request.getParameter("subno");
		String subname = request.getParameter("subname");
		String xktime = request.getParameter("xktime");
		String score = request.getParameter("score");
		SimpleDateFormat sdfxuanke = new SimpleDateFormat("yyyy-MM-dd");
		Xuanke xuanke = new Xuanke();
		xuanke.setStno(stno == null ? "" : stno);
		xuanke.setSname(sname == null ? "" : sname);
		xuanke.setSubno(subno == null ? "" : subno);
		xuanke.setStatus("选修中");
		xuanke.setSubname(subname == null ? "" : subname);
		if (xktime != null) {
			try {
				xuanke.setXktime(sdfxuanke.parse(xktime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			xuanke.setXktime(new Date());
		}
		xuanke.setScore(score == null ? (double) 0 : new Double(score));
		DALBase.save(xuanke);
		if (forwardurl == null) {
			forwardurl = "/admin/xuankemanager.do?actiontype=get";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Xuanke xuanke = (Xuanke) DALBase.load(Xuanke.class, new Integer(id));
		if (xuanke == null)
			return;
		String stno = request.getParameter("stno");
		String sname = request.getParameter("sname");
		String subno = request.getParameter("subno");
		String subname = request.getParameter("subname");
		String xktime = request.getParameter("xktime");
		String score = request.getParameter("score");
		SimpleDateFormat sdfxuanke = new SimpleDateFormat("yyyy-MM-dd");
		xuanke.setStno(stno);
		xuanke.setSname(sname);
		xuanke.setSubno(subno);
		xuanke.setSubname(subname);
		if (xktime != null) {
			try {
				xuanke.setXktime(sdfxuanke.parse(xktime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		xuanke.setScore(score == null ? (double) 0 : new Double(score));
		DALBase.update(xuanke);
		if (forwardurl == null) {
			forwardurl = "/admin/xuankemanager.do?actiontype=get";
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
			Xuanke xuanke = (Xuanke) DALBase.load("xuanke", "where id=" + id);
			if (xuanke != null) {
				request.setAttribute("xuanke", xuanke);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/xuankeadd.jsp";
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
		String filter = " ";
		String stno = request.getParameter("stno");
		if (stno != null)
			filter += " and xk.stno like '%" + stno + "%' ";
		String subname=request.getParameter("subname");
		if (subname != null)
			filter += " and xk.subname like '%" + subname + "%' ";
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
		String  tno=request.getParameter("tno");
		if(tno!=null)
		    filter += "  and kc.tno ='" + tno + "'  ";
		String SQL="select xk.* from course kc,xuanke xk where kc.subno=xk.subno  " + filter;
		List<Xuanke> listxuanke = DALBase.runNativeSQL(SQL, Xuanke.class);
		request.setAttribute("listxuanke", listxuanke);
		// 分发请求参数
		dispatchParams(request, response);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/xuankemanager.jsp";
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
