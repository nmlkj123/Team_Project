<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/dbcon2.jsp" %>
    <%
    String unq=request.getParameter("unq");
    String a1=request.getParameter("a1");
    String a2=request.getParameter("a2");
    String a3=request.getParameter("a3");
    String a4=request.getParameter("a4");
    String a5=request.getParameter("a5");
    String a6=request.getParameter("a6");
    String a7=request.getParameter("a7");
    String a8=request.getParameter("a8");
    String a9=request.getParameter("a9");
    String a10=request.getParameter("a10");
    String a11=request.getParameter("a11");
    


    String sql="update tourist_use set ";
    sql+= " a1='"+a1+"', ";
    sql+= " a2='"+a2+"', ";
    sql+= " a3='"+a3+"', ";
    sql+= " a4='"+a4+"', ";
    sql+= " a5='"+a5+"', ";
    sql+= " a6='"+a6+"', ";
    sql+= " a7='"+a7+"', ";
    sql+= " a8='"+a8+"', ";
    sql+= " a9='"+a9+"', ";
    sql+= " a10='"+a10+"', ";
    sql+= " a11='"+a11+"' ";
    sql+= " where pid='"+unq+"' ";
    stmt.executeUpdate(sql);
    %>
    <script>
    alert("변경완료");
    location="SpotList.jsp";
    
    </script>
    
   
    
    