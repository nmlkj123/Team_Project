<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

session.removeAttribute("memId");
session.removeAttribute("memName");

%>
<script>
alert("로그아웃");
location.href="../main/main.jsp";
</script>