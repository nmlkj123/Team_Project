<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/dbcon2.jsp" %>
<%
	String realFolder=request.getServletContext().getRealPath("/reviewImage");
	MultipartRequest multi=new MultipartRequest(
		request,
		realFolder,
		5*1024*1024,//byte단위,5mb단위로받겠다    순서-> kb,mb,gb,tb,pb,zb
		"utf-8",
		new DefaultFileRenamePolicy()//똑같은 파일이있을때 번호를부여해서 저장함
		);


	String memId=(String)session.getAttribute("memId");
	if(memId==null||memId.equals("")){
		%>0<%
		return;
	}

	String punq= multi.getParameter("punq");
	String image =multi.getFilesystemName("image");


	int c= stmt.executeUpdate("insert into tourist_photo values('"+image+"','"+punq+"')");


	
	
	if(c>0){
		%>1<%
	}else{
		
		%>0<%
	}

	

	
%>