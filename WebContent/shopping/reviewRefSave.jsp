<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/dbcon2.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String memId=(String)session.getAttribute("memId");
	String memName=(String)session.getAttribute("memName");
	String content=request.getParameter("content");
	String pid= request.getParameter("pid");
	int c= stmt.executeUpdate("insert into shopping_review_board values('"+memId+"','"+memName+"','"+content+"',sysdate,'"+pid+"')");
	
	
	if(c>0){
		%>1<%
	}else{
		
		%>0<%
	}
%>