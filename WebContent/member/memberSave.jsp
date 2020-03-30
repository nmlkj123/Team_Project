<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbcon2.jsp" %>

<%
String userid = request.getParameter("userid");
String pwd = request.getParameter("pwd");
String chkpwd = request.getParameter("chkpwd");
String name = request.getParameter("name");
String email1 = request.getParameter("email1");
String email2 = request.getParameter("email2");
String post1 = request.getParameter("post1");
String post2 = request.getParameter("post2");
String tel = request.getParameter("tel");

%>

<%
if(userid == null || pwd == null) {
%>
	<script>
	alert("잘못된접근!!");
	history.back();
	</script>
<%
	return;
}
String column = "unq,userid,pwd,name,email1,email2,tel,post1,post2";
String sql = "insert into member("+column+") values(memer_seq.nextval, "
		   + " '"+userid+"',"
		   + " '"+pwd+"',"
		   + " '"+name+"',"
		   + " '"+email1+"',"
		   + " '"+email2+"',"   
		   + " '"+tel+"',"
		   + " '"+post1+"',"
		   + " '"+post2+"') ";
		  
		   
		 

	stmt.executeUpdate(sql);
%>
<script>
alert("저장완료");
location = "login.jsp";
</script>

