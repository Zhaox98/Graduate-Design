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
import com.opensymphony.xwork2.Result;

/**************************
 * 
 * @author zx
 * 
 * 评教控制
 * 
 */

public class PingjiaoAction extends PageActionBase {
	@Override
	public void onLoad() {
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		if (actiontype == null)
			return;
	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String id = request.getParameter("id");
		DALBase.delete("pingjiao", " where id=" + id);
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
		String stname = request.getParameter("stname");
		String subno = request.getParameter("subno");
		String subname = request.getParameter("subname");
		String des = request.getParameter("des");
		SimpleDateFormat sdfpingjiao = new SimpleDateFormat("yyyy-MM-dd");
		Pingjiao pingjiao = new Pingjiao();
		pingjiao.setStno(stno == null ? "" : stno);
		pingjiao.setStname(stname == null ? "" : stname);
		pingjiao.setSubno(subno == null ? "" : subno);
		pingjiao.setSubname(subname == null ? "" : subname);
		pingjiao.setDefen(getDefen());
		pingjiao.setDes(des==null?"":des);
		pingjiao.setPjtime(new Date());
		
		// 产生验证
		Boolean validateresult = saveValidate(MessageFormat.format("where subno=''{0}'' and stno=''{1}'' ",subno,stno));
		if (validateresult) {
			try {
				request.setAttribute("errormsg", "<label class='error'>已经评教过</label>");
				request.setAttribute("pingjiao", pingjiao);
				request.setAttribute("actiontype", "save");
				request.getRequestDispatcher(errorurl).forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return;
		}
	    Boolean result=DALBase.save(pingjiao);
	    if(result){
	    	Course  course=(Course)DALBase.load("course", "where subno='"+subno+"'");
			if(course!=null) {
				course.setPjcount(course.getPjcount()+1);
				course.setTotalscore(course.getTotalscore()+pingjiao.getDefen());
				course.setAvgscore(((double)course.getTotalscore())/course.getPjcount());
				DALBase.update(course);
			}
	    	
	    }
		if (forwardurl == null) {
			forwardurl = "/admin/pingjiaomanager.do?actiontype=get";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 新增验证
	private boolean saveValidate(String filter) {
		return DALBase.isExist("pingjiao", filter);
	}
	
	private int getDefen(){
		List<Pjitems> pjitemslist=(List<Pjitems>)DALBase.getEntity("pjitems", "");
		int totalscore=0;
		for(Pjitems pjitems : pjitemslist){
			String pjfen=request.getParameter("items"+pjitems.getId());
			if(pjfen!=null)
				totalscore+=Integer.parseInt(pjfen);
		}
		return totalscore;
	}
	
	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Pingjiao pingjiao = (Pingjiao) DALBase.load(Pingjiao.class, new Integer(id));
		if (pingjiao == null)
			return;
		String stno = request.getParameter("stno");
		String stname = request.getParameter("stname");
		String subno = request.getParameter("subno");
		String subname = request.getParameter("subname");
		String defen = request.getParameter("defen");
		String pjtime = request.getParameter("pjtime");
		SimpleDateFormat sdfpingjiao = new SimpleDateFormat("yyyy-MM-dd");
		pingjiao.setStno(stno);
		pingjiao.setStname(stname);
		pingjiao.setSubno(subno);
		pingjiao.setSubname(subname);
		pingjiao.setDefen(defen == null ? 0 : new Integer(defen));
		if (pjtime != null) {
			try {
				pingjiao.setPjtime(sdfpingjiao.parse(pjtime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		DALBase.update(pingjiao);
		if (forwardurl == null) {
			forwardurl = "/admin/pingjiaomanager.do?actiontype=get";
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
			Pingjiao pingjiao = (Pingjiao) DALBase.load("pingjiao", "where id=" + id);
			if (pingjiao != null) {
				request.setAttribute("pingjiao", pingjiao);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		String subno=request.getParameter("subno");
		if(subno!=null){
			Teacher teacher=(Teacher)DALBase.loadInNativeSQL(Teacher.class, MessageFormat.format("select t.* from teacher t,course  kc where t.tno=kc.tno and kc.subno=''{0}''",subno));
			if(teacher!=null)
				request.setAttribute("teacher", teacher);
			List<Pjitems> listpjitems=DALBase.getEntity("pjitems", "");
			if(listpjitems!=null)
				request.setAttribute("listpjitems", listpjitems);
			Course  course=(Course)DALBase.load("course", "where subno='"+subno+"'");
			if(course!=null)
				request.setAttribute("course", course);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/pingjiaoadd.jsp";
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
		String stno = request.getParameter("stno");
		if (stno != null)
			filter += "  and stno like '%" + stno + "%'  ";
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
		List<Pingjiao> listpingjiao = DALBase.getPageEnity("pingjiao", filter, pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("pingjiao", filter == null ? "" : filter);
		request.setAttribute("listpingjiao", listpingjiao);
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
			forwardurl = "/admin/pingjiaomanager.jsp";
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
