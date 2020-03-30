<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../include/dbcon2.jsp" %>
<% 
	String userid = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	ResultSet rs=stmt.executeQuery("select count(*) as cnt from member where userid='"+userid+"' and pwd='"+pwd+"'");
	rs.next();
	int cnt=rs.getInt("cnt");
	if(cnt>0){
		ResultSet rs2=stmt.executeQuery("select * from member where userid='"+userid+"'");
		rs2.next();
		
		session.setAttribute("memId", rs2.getString("userid"));
		session.setAttribute("memName", rs2.getString("name"));
		%>
		<script>
			alert("로그인됨");
			location.href="../main/main.jsp";
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