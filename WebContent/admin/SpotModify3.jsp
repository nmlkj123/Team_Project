<%@page import="javax.swing.ImageIcon"%>
<%@page import="java.awt.Image"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/dbcon2.jsp" %> 
<%
String Domain = "http://localhost:8080/jeju";
String RealPath = "C:/Users/user/eclipse-workspace/jeju/WebContent";
%>
<%
String unq = request.getParameter("unq");
String deptno="";

String sql1 = " select s.unq, s.name, s.addr,s.addr2, s.tel, s.hashtag,s.x,s.y, t.dname,t.deptno "; 
		sql1+=" from shopping_spot s, shopping t ";
		sql1+=" where s.deptno=t.deptno and s.unq='"+unq +"' " ;
		Statement stmt1= conn.createStatement();
ResultSet rs1 = stmt1.executeQuery(sql1);

String sql2 = " select deptno,dname "; 
		sql2+=" from shopping ";
		
Statement stmt2= conn.createStatement();
ResultSet rs2 = stmt2.executeQuery(sql2);
rs1.next(); // 포인터 이동
deptno=rs1.getString("deptno");
String name = rs1.getString("name");
String addr = rs1.getString("addr");
String addr2 = rs1.getString("addr2");
String tel = rs1.getString("tel");
String hashtag = rs1.getString("hashtag");
String x = rs1.getString("x");
String y = rs1.getString("y");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광지 수정</title>
<link rel="stylesheet" href="../css/adminlayout.css">
</head>

<style>

input {
	width:300px;
	height:23px;
}
textarea {
	width:400px;
	height:200px;
}


</style>

<script>
function fn_submit() {
	
	var f = document.frm;
	if(f.name.value == "") {
		alert("관광지를 선택해주세요.");
		f.name.focus();
		return false;
	}
	f.submit();
}
</script>
<body>
<div class="container">
	<div class="adminLeft">
	<%@ include file="../include/leftMenu.jsp" %>
	</div>

	<div class="adminRight">
	<!-- 상품등록 -->
	<form name="frm" method="post" action="SpotModifySave3.jsp" 
			enctype="multipart/form-data" >
			
			<input type="hidden" name="unq" value="<%=unq%>">
	
	<table class="table2">
		<tr>
			<th>테마</th>
			<td><select name="deptno">
			<%
			while( rs2.next() ) {
			
				deptno = rs2.getString("deptno");
				String dname = rs2.getString("dname");
			%>
			<option value="<%=deptno%>"><%=dname %></option>
			
			<%
			}
			%>
				</select>
			</td>
		</tr>
		<tr>
			<th>관광지</th>
			<td><input type="text" name="name" value="<%=name%>"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="addr" value="<%=addr%>"></td>
		</tr>
		<tr>
			<th>주소2</th>
			<td><input type="text" name="addr2" value="<%=addr2%>"></td>
		</tr>
		<tr>
			<th>번호</th>
			<td><input type="text" name="tel" value="<%=tel%>"></td>
		</tr>
		<tr>
			<th>해시태그</th>
			<td><input type="text" name="hashtag" value="<%=hashtag%>"></td>
		</tr>
		<tr>
			<th>x</th>
			<td><input type="text" name="x" value="<%=x%>"></td>
		</tr>
		<tr>
			<th>y</th>
			<td><input type="text" name="y" value="<%=y%>"></td>
		</tr>
		<tr>
			<th>이미지</th>
			<td>
			<input type="file" name="file1"> <br>
	
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