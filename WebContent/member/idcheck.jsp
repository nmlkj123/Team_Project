<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../include/dbcon2.jsp" %>
    
    <%
    String userid = request.getParameter("userid");
    if(userid==null){
    	%>
    	<script>
    	alert("잘못된접근");
    	self.close();
    	</script>
    	<%
    	return;
    	}
    %>
    <%
    //아이디값을 조건으로 갯수를 파악한다.
    String sql="select count(*) cnt from member ";
    sql+= " where userid='"+userid+"' ";
    
    ResultSet rs = stmt.executeQuery(sql);
    rs.next();
    int cnt=rs.getInt("cnt");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복체크</title>
</head>
<style>
.div1 {
width:98%;
height:100px;
font-size:16px;
color:#777777;
font-weight:bold;
font-family:맑은 고딕;
margin:5px;
border:1px solid skyblue;
text-align:center;
vertical-align:middle;
line-height:15.0px;
}

</style>
<body>

<div class="div1">
<%
if(cnt==0){
	%>
사용할수 있는 아이디입니다.
	<% 
} else {
%>
이미사용중인 아이디입니다.
<%
}
%>
<br><br><br>
<input type="button" value="닫기" onclick ="self.close();">
</div>



</body>
</html>