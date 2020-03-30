<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/dbcon2.jsp" %>
<%
String unq=request.getParameter("tunq");
ResultSet rs3=stmt.executeQuery("select count(*) as cnt from shopping_content where pid="+unq+"");
rs3.next();
int cnt=rs3.getInt("cnt");
if(cnt==0){
	%>
	<p>콘텐츠를 등록해주세요</p>
	<%
	return;
}

ResultSet rs= stmt.executeQuery("select * from shopping_content where pid="+unq+"");
rs.next();

	
%>
<%=rs.getString("content") %>
	
	
