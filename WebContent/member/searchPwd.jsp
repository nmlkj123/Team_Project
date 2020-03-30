<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon2.jsp" %>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");

ResultSet rs= stmt.executeQuery("select count(*) as cnt from member where name='"+name+"' and userid='"+id+"'");
rs.next();
int cnt=rs.getInt("cnt");
if(cnt==0 || cnt>1){
	%>
	<script>
		alert("비밀번호를 찾을수 없습니다.");
		history.back();
	</script>
	
	<%
	return;
}
ResultSet rs2= stmt.executeQuery("select  * from member where name='"+name+"' and userid='"+id+"'");
rs2.next();
String pwd=rs2.getString("pwd");
%>
<script>
	
	alert("당신의비밀번호는<%=pwd%>");
	history.back();
</script>

<%

%>