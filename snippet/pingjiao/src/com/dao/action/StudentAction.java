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
 * 学生控制
 * 
 */

public class StudentAction extends PageActionBase {
	@Override
	public void onLoad() {
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		if (actiontype == null)
			return;
		if (actiontype.equals("getAll"))
			getAll();
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
		Student student = (Student) DALBase.load(Student.class, new Integer(id));
		if (student != null) {
			if (!student.getPassword().equals(password1)) {
				try {
					request.setAttribute("errormsg", "<label class='error'>原始密码不正确，不能修改</label>");
					request.getRequestDispatcher(errorpageurl).forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				student.setPassword(repassword1);
				DALBase.update(student);
				request.getSession().setAttribute("student", student);
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
		DALBase.delete("student", " where id=" + id);
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
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String zhuanye = request.getParameter("zhuanye");
		String jiguan = request.getParameter("jiguan");
		String mobile = request.getParameter("mobile");
		String banji = request.getParameter("class");
		String photo = request.getParameter("photo");
		String mianmao = request.getParameter("mianmao");
		String address = request.getParameter("address");
		String des = request.getParameter("des");
		String password = request.getParameter("password");
		String nation = request.getParameter("nation");
		String birthday = request.getParameter("birthday");
		SimpleDateFormat sdfstudent = new SimpleDateFormat("yyyy-MM-dd");
		Student student = new Student();
		student.setStno(stno == null ? "" : stno);
		student.setName(name == null ? "" : name);
		student.setSex(sex == null ? "" : sex);
		student.setZhuanye(zhuanye == null ? "" : zhuanye);
		student.setJiguan(jiguan == null ? "" : jiguan);
		student.setMobile(mobile == null ? "" : mobile);
		student.setBanji(banji == null ? "" : banji);
		student.setPhoto(photo == null ? "" : photo);
		student.setMianmao(mianmao == null ? "" : mianmao);
		student.setAddress(address == null ? "" : address);
		student.setDes(des == null ? "" : des);
		student.setPassword("123456");
		student.setNation(nation == null ? "" : nation);
		if (birthday != null) {
			try {
				student.setBirthday(sdfstudent.parse(birthday));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			student.setBirthday(new Date());
		}
		Boolean validateresult=saveValidate( "where stno='"+stno+"'");
		if(validateresult){
			try {
				request.setAttribute("errormsg","<label class='error'>已经存在的学号</label>");
				request.setAttribute("student", student);
				List<Object> zhuanye_datasource = DALBase.getEntity("major", "");
				request.setAttribute("zhuanye_datasource", zhuanye_datasource);
				List<Object> banji_datasource = DALBase.getEntity("banji", "");
				request.setAttribute("banji_datasource", banji_datasource);
				request.setAttribute("actiontype", "save");
				request.getRequestDispatcher(errorurl).forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return;
		}
		DALBase.save(student);
		// 保存附件
		if (forwardurl == null) {
			forwardurl = "/admin/studentmanager.do?actiontype=get";
		}
		try {
			response.sendRedirect(SystemParam.getSiteRoot() + forwardurl);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//新增验证
	private boolean saveValidate(String filter){
		return DALBase.isExist("student", filter);
	}

	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Student student = (Student) DALBase.load(Student.class, new Integer(id));
		if (student == null)
			return;
		String stno = request.getParameter("stno");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String zhuanye = request.getParameter("zhuanye");
		String jiguan = request.getParameter("jiguan");
		String mobile = request.getParameter("mobile");
		String banji = request.getParameter("class");
		String photo = request.getParameter("photo");
		String mianmao = request.getParameter("mianmao");
		String address = request.getParameter("address");
		String des = request.getParameter("des");
		String nation = request.getParameter("nation");
		String birthday = request.getParameter("birthday");
		SimpleDateFormat sdfstudent = new SimpleDateFormat("yyyy-MM-dd");
		if (stno != null)
			student.setStno(stno);
		if (name != null)
			student.setName(name);
		student.setSex(sex);
		student.setZhuanye(zhuanye);
		student.setJiguan(jiguan);
		student.setMobile(mobile);
		student.setBanji(banji);
		student.setPhoto(photo);
		student.setMianmao(mianmao);
		student.setAddress(address);
		student.setDes(des);
		student.setNation(nation);
		if (birthday != null) {
			try {
				student.setBirthday(sdfstudent.parse(birthday));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		DALBase.update(student);
		if (forwardurl == null) {
			forwardurl = "/admin/studentmanager.do?actiontype=get";
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
			Student student = (Student) DALBase.load("student", "where id=" + id);
			if (student != null) {
				request.setAttribute("student", student);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		List<Object> zhuanye_datasource = DALBase.getEntity("major", "");
		request.setAttribute("zhuanye_datasource", zhuanye_datasource);
		List<Object> banji_datasource = DALBase.getEntity("banji", "");
		request.setAttribute("banji_datasource", banji_datasource);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/studentadd.jsp";
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
		String  name=request.getParameter("name");
		String stno = request.getParameter("stno");
		if (stno != null)
			filter += "  and stno like '%" + stno + "%'  ";
		if(name!=null)
			filter+=  "  and name  like '%"+name+"%'";
		//
		int pageindex = 1;
		int pagesize = 14;
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
		List<Student> liststudent = DALBase.getPageEnity("student", filter, pageindex, pagesize);
		int recordscount = DALBase.getRecordCount("student", filter == null ? "" : filter);
		request.setAttribute("liststudent", liststudent);
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
			forwardurl = "/admin/studentmanager.jsp";
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
	
	public void getAll() {
		String filter = "where 1=1 ";
		List<Student> liststudent = DALBase.getEntity("student", filter);
		int recordscount = DALBase.getRecordCount("student", filter == null ? "" : filter);
		request.setAttribute("liststudent", liststudent);
		List<Object> xuenian_datasource = DALBase.getEntity("xuenian", "");
		request.setAttribute("xuenian_datasource", xuenian_datasource);
		// 分发请求参数
		dispatchParams(request, response);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/studentmanager.jsp";
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
