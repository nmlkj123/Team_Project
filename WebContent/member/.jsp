<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../include/dbcon2.jsp" %>
<% 
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	ResultSet rs=stmt.executeQuery("select count(*) as cnt from member where id="+id+"");
	rs.next();
	int cnt=rs.getInt("cnt");
	if(cnt>0){
		session.setAttribute("memId", id);
		%>
		<script>
			alert("로그인됨");
			locarion.href="../main/template.jsp";
		</script>
		<%
	}else{
		%>
		<script>
		alert("아이디나 비번이 틀림");
		locarion.href="../member/login.jsp";
		</script>
		<%
	}

%>