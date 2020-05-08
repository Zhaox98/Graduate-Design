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
 * 排课表控制
 * 
 */

public class PaikeAction extends PageActionBase {
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
		DALBase.delete("paike", " where id=" + id);
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
		String tname = request.getParameter("tname");
		String xuenian = request.getParameter("xuenian");
		String weekday = request.getParameter("weekday");
		String kejie = request.getParameter("kejie");
		String major=request.getParameter("major");
	    String banji=request.getParameter("class");
		SimpleDateFormat sdfpaike = new SimpleDateFormat("yyyy-MM-dd");
		Paike paike = new Paike();
		paike.setTno(tno == null ? "" : tno);
		paike.setTname(tname == null ? "" : tname);
		paike.setXuenian(xuenian == null ? "" : xuenian);
		paike.setWeekday(weekday == null ? "" : weekday);
		paike.setKejie(kejie == null ? "" : kejie);
	    paike.setMajor(major==null?"":major);
        paike.setBanji(banji==null?"":banji);
		Boolean validateresult=saveValidate( MessageFormat.format("where tno=''{0}'' and kejie=''{1}'' and xuenian=''{2}''  ",tno,kejie,xuenian));
		if(validateresult){
			try {
				request.setAttribute("errormsg","<label class='error'>该时间已经为老师排课了</label>");
				request.setAttribute("paike", paike);
				request.setAttribute("actiontype", "save");
				request.getRequestDispatcher(errorurl).forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return;
		}
		DALBase.save(paike);
		if (forwardurl == null) {
			forwardurl = "/admin/paikemanager.do?actiontype=get";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//新增验证
	private  boolean  saveValidate(String filter){
		return	DALBase.isExist("paike", filter);
	}

	/******************************************************
	 *********************** 内部附件支持*********************
	 *******************************************************/
	public void attachments(String belongid) {
		DALBase.delete("attachement", MessageFormat.format(" where belongid=''{0}'' and belongtable=''paike'' ", belongid));
		String[] photos = request.getParameterValues("fileuploaded");
		if (photos == null)
			return;
		for (int i = 0; i < photos.length; i++) {
			Attachement a = new Attachement();
			a.setType("images");
			a.setPubtime(new Date());
			a.setBelongfileldname("id");
			a.setFilename(photos[i]);
			a.setBelongid(belongid);
			a.setBelongtable("paike");
			a.setUrl(SystemParam.getSiteRoot() + "/upload/temp/" + a.getFilename());
			a.setTitle(a.getFilename());
			DALBase.save(a);
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
		Paike paike = (Paike) DALBase.load(Paike.class, new Integer(id));
		if (paike == null)
			return;
		String tno = request.getParameter("tno");
		String tname = request.getParameter("tname");
		String xuenian = request.getParameter("xuenian");
		String weekday = request.getParameter("weekday");
		String kejie = request.getParameter("kejie");
		String major=request.getParameter("major");
	    String banji=request.getParameter("class");
		SimpleDateFormat sdfpaike = new SimpleDateFormat("yyyy-MM-dd");
		paike.setTno(tno);
		paike.setTname(tname);
		paike.setXuenian(xuenian);
		paike.setWeekday(weekday);
		paike.setKejie(kejie);
		paike.setMajor(major==null?"":major);
	    paike.setBanji(banji==null?"":banji);
		DALBase.update(paike);
		if (forwardurl == null) {
			forwardurl = "/admin/paikemanager.do?actiontype=get";
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
			Paike paike = (Paike) DALBase.load("paike", "where id=" + id);
			if (paike != null) {
				request.setAttribute("paike", paike);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		List<Object> tno_datasource = DALBase.getEntity("teacher", "");
		request.setAttribute("tno_datasource", tno_datasource);
		List<Object> xuenian_datasource = DALBase.getEntity("xuenian", "");
		request.setAttribute("xuenian_datasource", xuenian_datasource);
		List<Object> major_datasource=DALBase.getEntity("major","");
     	request.setAttribute("major_datasource",major_datasource);
		List<Object> banji_datasource=DALBase.getEntity("banji","");
    	request.setAttribute("banji_datasource",banji_datasource);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/paikeadd.jsp";
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
		String tno = request.getParameter("tno");
		String xuenian=request.getParameter("xuenian");
		if (tno != null)
			filter += "  and tno like '%" + tno + "%'  ";
		//
		if (xuenian != null)
			filter += "  and xuenian like '%" + xuenian + "%'  ";
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
		List<Paike> listpaike = DALBase.getPageEnity("paike", filter, pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("paike", filter == null ? "" : filter);
		request.setAttribute("listpaike", listpaike);
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
			forwardurl = "/admin/paikemanager.jsp";
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
