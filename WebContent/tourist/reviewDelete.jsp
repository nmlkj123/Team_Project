<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/dbcon2.jsp" %>
<%
	
	String id=request.getParameter("id");
	String unq= request.getParameter("unq");
	int c= stmt.executeUpdate("delete from tourist_review where id='"+id+"' and unq='"+unq+"'");
	
	
	if(c>0){
		%>1<%
	}else{
		
		%>0<%
	}
%>