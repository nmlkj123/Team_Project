<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/dbcon2.jsp" %>

<%
	String memId=(String)session.getAttribute("memId");
	String unq= request.getParameter("tunq");
	String name= request.getParameter("name");
	String deptno= request.getParameter("deptno");
	String image= request.getParameter("image");
	String addr= request.getParameter("addr");
	ResultSet rs2=stmt.executeQuery("select * from shopping where deptno="+deptno+"");
	rs2.next();
	String dname=rs2.getString("dname");
	ResultSet rs=stmt.executeQuery("select count(*) as cnt from mylist where jjim_spot= "+unq+" and userid='"+memId+"'and type=3");
	rs.next();
	int cnt=rs.getInt("cnt");
	if(cnt>0){
		stmt.executeUpdate("delete from mylist where jjim_spot="+unq+" and userid='"+memId+"' and type=3");
		%>0<%
		return;
	}else{
		stmt.executeUpdate("insert into mylist(userid,jjim_spot,deptno,dname,type,addr,name,image) values('"+memId+"',"+unq+",'"+deptno+"','"+dname+"','"+3+"','"+addr+"','"+name+"','"+image+"') ");
		%>1<%
	}
	

%>