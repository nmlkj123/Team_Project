<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/dbcon2.jsp" %>
<%
	String content=request.getParameter("content");
	String unq= request.getParameter("unq");
	
	ResultSet rs= stmt.executeQuery("select count(*) as cnt from restaurant_content where pid="+unq+"");
	rs.next();
	int c=0;
	if(rs.getInt("cnt")>0){
		c= stmt.executeUpdate("update restaurant_content set content='"+content+"',pid="+unq+" where pid="+unq+"");
	}else{
		c= stmt.executeUpdate("insert into restaurant_content values('"+content+"',"+unq+")");
	}
	
	
	
	if(c>0){
		%>1
		<script>alert("저장되었습니다"); location.href="SpotList2.jsp";</script>
		<%
		
	}else{
		
		%>0<%
	}
%>