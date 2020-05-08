package com.dao.action;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jfree.chart.JFreeChart;
import org.jfree.chart.servlet.ServletUtilities;

import com.dao.bll.SimpleStatistics;
import com.dao.bll.SystemParam;
import com.dao.dal.DALBase;
import com.dao.entity.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class TongjiAction extends ActionSupport {

	public String execute() {
		HttpServletResponse response = (HttpServletResponse)ActionContext.getContext().get(org.apache.struts2.StrutsStatics.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest)ActionContext.getContext().get(org.apache.struts2.StrutsStatics.HTTP_REQUEST);
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);
		return null;
	}

	public void dispatchParams(HttpServletRequest request,
		HttpServletResponse response) {
		Enumeration params = request.getParameterNames();
		while (params.hasMoreElements()) {
			String paramname = params.nextElement().toString();
			String value = request.getParameter(paramname);
			request.setAttribute(paramname, value);
		}
	}

}
