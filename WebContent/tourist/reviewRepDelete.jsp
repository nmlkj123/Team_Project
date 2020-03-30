<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/dbcon2.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String unq= request.getParameter("unq");
	String content= request.getParameter("content");
	int c= stmt.executeUpdate("delete from tourist_review_board where id='"+id+"' and pid='"+unq+"' and content='"+content+"'");
	
	
	if(c>0){
		%>1<%
	}else{
		
		%>0<%
	}
%>