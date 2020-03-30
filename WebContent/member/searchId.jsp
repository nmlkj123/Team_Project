<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon2.jsp" %>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String[] e=email.split("@");
if(e.length!=2){
	%>
	<script>
		alert("이메일형식 틀림.");
		history.back();
	</script>
	
	<%
	return;
}
ResultSet rs= stmt.executeQuery("select count(*) as cnt from member where name='"+name+"' and email1='"+e[0]+"' and email2='"+e[1]+"'");
rs.next();
int cnt=rs.getInt("cnt");
if(cnt==0 || cnt>1){
	%>
	<script>
		alert("아이디를 찾을수 없습니다.");
		history.back();
	</script>
	
	<%
	return;
}
ResultSet rs2= stmt.executeQuery("select  * from member where name='"+name+"' and email1='"+e[0]+"' and email2='"+e[1]+"'");
rs2.next();
String id=rs2.getString("userid");
%>
<script>
	
	alert("당신의아이디는<%=id%>");
	history.back();
</script>

<%

%>