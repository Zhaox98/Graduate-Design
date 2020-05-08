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
 * 学年控制
 *
 */
public class XuenianAction extends  PageActionBase{
	@Override
	public void onLoad() {
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		if (actiontype == null)
			return ;
	}
	
    /********************************************************
    ******************信息注销监听支持*****************************
    *********************************************************/
	public void delete() {
		String id=request.getParameter("id");
		DALBase.delete("xuenian", " where id="+id);
		binding();
	}
	
    /*************************************************************
     ****************保存动作监听支持******************************
    **************************************************************/
	public void save() {
		String forwardurl=request.getParameter("forwardurl");
		//验证错误url
		String errorurl=request.getParameter("errorurl");
		String niandu=request.getParameter("niandu");
		SimpleDateFormat  sdfxuenian=new SimpleDateFormat("yyyy-MM-dd");
		Xuenian xuenian=new Xuenian();
		xuenian.setNiandu(niandu==null?"":niandu);
		DALBase.save(xuenian);
		// 保存附件
		// attachments(request,response,new Integer(xuenian.getId()).toString());
		if(forwardurl==null){
			forwardurl="/admin/xuenianmanager.do?actiontype=get";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot()+forwardurl);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	/******************************************************
	***********************内部附件支持*********************
	*******************************************************/
	public void attachments(String belongid) {
		DALBase.delete("attachement", MessageFormat.format(" where belongid=''{0}'' and belongtable=''xuenian'' ", belongid));
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
			a.setBelongtable("xuenian");
			a.setUrl(SystemParam.getSiteRoot()+"/upload/temp/" + a.getFilename());
			a.setTitle(a.getFilename());
			DALBase.save(a);
		}
	}
	
   	/******************************************************
	***********************更新内部支持*********************
	*******************************************************/
	public void update() {
    	String forwardurl=request.getParameter("forwardurl");
		String id=request.getParameter("id");
		if(id==null)
			return;
		Xuenian  xuenian=(Xuenian)DALBase.load(Xuenian.class,new Integer(id));
		if(xuenian==null)
			return;
		String niandu=request.getParameter("niandu");
		SimpleDateFormat  sdfxuenian=new SimpleDateFormat("yyyy-MM-dd");
		xuenian.setNiandu(niandu);
		DALBase.update(xuenian);
		// attachments(new Integer(xuenian.getId()).toString());
		if(forwardurl==null){
			forwardurl="/admin/xuenianmanager.do?actiontype=get";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot()+forwardurl);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
   	/******************************************************
	***********************加载内部支持*********************
	*******************************************************/
	public void load() {
		//
		String id=request.getParameter("id");
		String actiontype="save";
		dispatchParams(request, response);
		if(id!=null) {
			Xuenian  xuenian=(Xuenian)DALBase.load("xuenian","where id="+id);
			if(xuenian!=null) {
				request.setAttribute("xuenian", xuenian);
			}
			actiontype="update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl=request.getParameter("forwardurl");
		System.out.println("forwardurl="+forwardurl);
		if(forwardurl==null){
			forwardurl="/admin/xuenianadd.jsp";
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
	***********************数据绑定内部支持*********************
	*******************************************************/
	public void   binding(){
		String filter="where 1=1 ";
		String xuenian=request.getParameter("xuenian");
	  	if(xuenian!=null)
	    	filter+= "  and xuenian like '%" + xuenian + "%'  ";
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
		List<Xuenian> listxuenian = DALBase.getPageEnity("xuenian", filter, pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("xuenian", filter == null ? "" : filter);
		request.setAttribute("listxuenian", listxuenian);
		PagerMetal pm = new PagerMetal(recordscount);
		//设置尺寸
		pm.setPagesize(pagesize);
		//设置当前显示页
		pm.setCurpageindex(pageindex);
		// 设置分页信息
		request.setAttribute("pagermetal", pm);
		//分发请求参数
		dispatchParams(request, response);
		String forwardurl=request.getParameter("forwardurl");
		System.out.println("forwardurl="+forwardurl);
		if(forwardurl==null){
			forwardurl="/admin/xuenianmanager.jsp";
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
