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
	String memName=(String)session.getAttribute("memName");
	if(memId==null||memId.equals("")){
		%>0<%
		return;
	}
	String content=multi.getParameter("content");
	String pid= multi.getParameter("pid");
	String image =multi.getFilesystemName("image");
	String hashtag= multi.getParameter("hashtag");
	String star= multi.getParameter("star");
	String chk= multi.getParameter("chk");

	int c= stmt.executeUpdate("insert into shopping_review values(shopping_REVIEW_SEQ.nextval,'"+pid+"','"+memId+"','"+memName+"','"+content+"','"+image+"','"+hashtag+"','"+star+"',sysdate)");

	if(chk.equals("1")){
		
		int i  = stmt.executeUpdate("update shopping_spot set back=back+1 where unq='"+pid+"'" );
		
	}
	
	
	if(c>0){
		%>1<%
	}else{
		
		%>0<%
	}

	

	
%>