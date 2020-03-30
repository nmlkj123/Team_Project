<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/dbcon2.jsp" %>
<%
	String memId=(String)session.getAttribute("memId");
	String pid= request.getParameter("pid");
	ResultSet rs= stmt.executeQuery("select count(*)as cnt from restaurant_review_like where pid="+pid+" and userid='"+memId+"'");
	rs.next();
	
	if(rs.getInt("cnt")>0){
		%>0<%
	}else{
		stmt.executeQuery("insert into restaurant_review_like values('"+memId+"','"+pid+"')");
		%>1<%
	}
%>