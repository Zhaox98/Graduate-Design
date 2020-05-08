<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.wondertek.meeting.model.*"%>
<%@ page import="com.wondertek.meeting.util.ValidateUtil"%>

<%
	//防止IE缓存    
	response.setHeader("pragma", "no-cache");
	response.setHeader("cache-control", "no-cache");
	response.setDateHeader("Expires", 0);
	//设置编码    
	request.setCharacterEncoding("UTF-8");
 
	MeetingFiles meetingFiles = (MeetingFiles) request.getAttribute("meetingFiles");
	System.out.println("downloading.....");
	System.out.println("meetingFiles.getFileSaveName():" + meetingFiles.getFileSaveName());
	System.out.println("meetingFiles.getFileName():" + meetingFiles.getFileName());
	System.out.println(config.getServletContext().getRealPath(meetingFiles.getFilePath() + File.separator + meetingFiles.getFileSaveName()));

	java.io.BufferedInputStream bis = null;
	java.io.BufferedOutputStream bos = null;
	
	try {
		//获取下载文件名
		String filename = request.getParameter("filename");
		
		filename = new String(filename.getBytes("iso8859-1"), "UTF-8");
		
		System.out.println("filename="+filename);
		response.setContentType("application/x-msdownload");
		response.setHeader("Content-disposition","attachment; filename="+ new String(filename.getBytes("UTF-8"),"iso8859-1"));
		bis = new java.io.BufferedInputStream(new java.io.FileInputStream(config.getServletContext().getRealPath("/upload/temp/"+filename)));
		bos = new java.io.BufferedOutputStream(response.getOutputStream());
		byte[] buff = new byte[2048];
		int bytesRead;
		while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
			bos.write(buff, 0, bytesRead);	//写文件
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (bis != null)
			bis.close();
		if (bos != null)
			bos.close();
		out.clear();  //清除缓存
        out = pageContext.pushBody();
	}
%>
