<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/dbcon2.jsp" %> 

<%
String Domain = "http://localhost:8080";
String RealPath = "C:/Users/user/eclipse-workspace/jeju/WebContent";
%>
<%
String unq = request.getParameter("unq");
String columns = "a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,pid";
        

String sql = " select "+columns+ " from tourist_use  "
	   + " where pid='"+unq+"'  ";
ResultSet rs = stmt.executeQuery(sql);

rs.next(); // 포인터 이동
String a1 = rs.getString("a1");
String a2 = rs.getString("a2");
String a3 = rs.getString("a3");
String a4 = rs.getString("a4");
String a5 = rs.getString("a5");
String a6 = rs.getString("a6");
String a7 = rs.getString("a7");
String a8 = rs.getString("a8");
String a9 = rs.getString("a9");
String a10 = rs.getString("a10");
String a11 = rs.getString("a11");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용안내수정</title>
<link rel="stylesheet" href="../css/adminlayout.css">
</head>

<style>


</style>
<body>
<div class="container">
	<div class="adminLeft">
	 <%@include file="../include/leftMenu.jsp" %>
	</div>

	<div class="adminRight">
	<form name="frm" method="post" action="useModifySave.jsp">
			<input type="hidden" name="unq" value="<%=unq%>">
	<table class="table1">

		<tr>
			<th style="width:80px;">소개</th>
			<td>
		<input type="text" style="width:500px" name="a1" value="<%=a1 %>">
			</td>
			</tr>
			
			<tr>
			<th style="width:40px;">상세정보</th>
			<td>
		<input type="text" style="width:500px" name="a2" value="<%=a2 %>">
			</td>
			</tr>
			
			<tr>
			<th style="width:40px;">이용시간</th>
			<td>
		<input type="text" style="width:500px" name="a3" value="<%=a3 %>">
			</td>
			</tr>
			
			<tr>
			<th style="width:40px;">요금정보</th>
			<td>
		<input type="text" style="width:500px" name="a4" value="<%=a4 %>">
			</td>
			</tr>
			
			<tr>
			<th style="width:40px;">장소특성</th>
			<td>
		<input type="text" style="width:500px" name="a5" value="<%=a5 %>">
			</td>
			</tr>
			
			<tr>
			<th style="width:40px;">주요목적</th>
			<td>
		<input type="text" style="width:500px" name="a6" value="<%=a6 %>">
			</td>
			</tr>
			
			<tr>
			<th style="width:40px;">주요목적 기타</th>
			<td>
		<input type="text" style="width:500px" name="a7" value="<%=a7 %>">
			</td>
			</tr>
			
			<tr>
			<th style="width:40px;">평균소요시간</th>
			<td>
		<input type="text" style="width:500px" name="a8" value="<%=a8 %>">
			</td>
			</tr>
			
			<tr>
			<th style="width:40px;">경사도(난이도)</th>
			<td>
		<input type="text" style="width:500px"  name="a9" value="<%=a9 %>">
			</td>
			</tr>
			
			<tr>
			<th style="width:40px;">편의시설</th>
			<td>
		<input type="text" style="width:500px" name="a10" value="<%=a10 %>">
			</td>
			</tr>
			
				<tr>
			<th style="width:40px;">기타상세</th>
			<td>
		<input type="text" style="width:500px" name="a11" value="<%=a11 %>">
			</td>
			</tr>

  </table>
  		<p style="width:800px; text-align:center;">
		<button type="submit" 
			 onclick="fn_submit();return false;">저장</button>
		<button type="reset">재작성</button>
		
	</p>
  </form>
	</div>





  
</div>


</body>
</html>