<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = (Connection)DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","jeju","1234");

Statement stmt = conn.createStatement();
request.setCharacterEncoding("utf8");
%>