<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../include/dbcon2.jsp" %>



<%
	String value= null;
	String realname= null;
	String realFolder=request.getServletContext().getRealPath("/contentImage");
	MultipartRequest multi=new MultipartRequest(
		request,
		realFolder,
		5*1024*1024,//byte단위,5mb단위로받겠다    순서-> kb,mb,gb,tb,pb,zb
		"utf-8",
		new DefaultFileRenamePolicy()//똑같은 파일이있을때 번호를부여해서 저장함
		);
	Enumeration files = multi.getFileNames();
    //넘오오는 파일주소값을 순서대로 담는다.
 

	 while(files.hasMoreElements()){
	   String name=(String)files.nextElement();
	
	   realname=multi.getFilesystemName(name); //
	
	  
	 }
	
	%>
../contentImage/<%=realname%>