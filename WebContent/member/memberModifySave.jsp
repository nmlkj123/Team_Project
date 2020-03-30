<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbcon2.jsp" %>

<%
String path="/memberfiles";
String uploadpath = request.getRealPath(path);
int maxsize= 1024 * 1024 * 10 ;
MultipartRequest multi = new MultipartRequest
(request,uploadpath,maxsize,"utf-8",new DefaultFileRenamePolicy());
String userid = multi.getParameter("userid");
String pwd = multi.getParameter("pwd");
String tel = multi.getParameter("tel");
String post1 = multi.getParameter("post1");
String post2 = multi.getParameter("post2");
String email1 = multi.getParameter("email1");
String email2 = multi.getParameter("email2");

Enumeration files= multi.getFileNames();
int filesize=0;

 String file1=(String)files.nextElement();
 String orgName1 = multi.getFilesystemName(file1);

String sql = "update member set"
		   + " pwd='"+pwd+"',"
		   + " tel='"+tel+"',"
		   + " post1='"+post1+"',"
		   + " post2='"+post2+"',"
		   + " email1='"+email1+"',"
		   + " email2='"+email2+"', "
		   + " image='"+orgName1+"' "
		   + " where userid='"+userid+"' ";
stmt.executeUpdate(sql);
	%>
<script>
alert("변경완료");
location = "../member/myPage.jsp";
</script>