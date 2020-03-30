<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon2.jsp" %>

<%
String unq = request.getParameter("unq"); 
String deptno = request.getParameter("deptno"); 


String  sql= " delete from restaurant_photo where pid='"+unq+"' ";
stmt.executeUpdate(sql);
sql= " delete from restaurant_use where pid='"+unq+"' ";
stmt.executeUpdate(sql);
sql= " delete from restaurant_content where pid='"+unq+"' ";
stmt.executeUpdate(sql);
sql= " delete from restaurant_review_like where pid='"+unq+"' ";
stmt.executeUpdate(sql);
sql= " delete from restaurant_review_board where pid='"+unq+"' ";
stmt.executeUpdate(sql);
sql= " delete from restaurant_review where pid='"+unq+"' ";
stmt.executeUpdate(sql);

sql= " delete from restaurant_spot where unq='"+unq+"' ";

stmt.executeUpdate(sql);
	
%>
<script>
alert("처리되었습니다.");
location = "../admin/SpotList2.jsp";

</script>

%>