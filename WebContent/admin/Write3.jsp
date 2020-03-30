<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/dbcon2.jsp" %> 

<%

String sql=" select deptno,dname from shopping ";
			
ResultSet rs=stmt.executeQuery(sql);



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주도 관광명소 추가</title>

<link rel="stylesheet" href="../css/adminlayout.css">
</head> 

<style>

input{

width:300px;
height:23px;

}

textarea{

width:500px;
height:80px;

}
</style>
<script>
function fn_submit() {
	var f=document.frm;
	if(f.name.value=="") {
		alert("관광지를 입력하세요");
		f.name.focus();
		return false;
	}
	
	var f=document.frm;
	if(f.deptno.value=="") {
		alert("테마를 골라주세요");
		f.deptno.focus();
		return false;
	}
	
	var f=document.frm;
	if(f.addr.value=="") {
		alert("주소를 입력해주세요");
		f.addr.focus();
		return false;
	}
	
	var f=document.frm;
	if(f.tel.value=="") {
		alert("연락처를 입력해주세요");
		f.tel.focus();
		return false;
	}
	
	var f=document.frm;
	if(f.tel.value=="") {
		alert("이미지를 넣어주세요");
		f.tel.focus();
		return false;
	}
	f.submit();
}


</script>

<body>
<div class="container">
	<div class="adminLeft">
	 <%@include file="../include/leftMenu.jsp" %>
	</div>

	<div class="adminRight">
	<!-- 상품등록 -->
	<form name="frm" method="post" action= "WriteSave3.jsp"
	enctype="Multipart/form-data">
	<table class="table1">
		<tr>
			<th>관광지</th>
			<td><input type ="text" name="name"></td>
		
		</tr>
		<tr>
			<th>테마</th>
			<td><select name="deptno">
			<%
			while(rs.next() ) {
			String deptno= rs.getString("deptno");
			String dname= rs.getString("dname");
			%>
			
			<option value="<%=deptno%>"><%=dname %></option>
			<%
			}
			%>
			</select>
		 </td>
		
		</tr>
		<tr>
			<th>주소</th>
			<td><input type ="text" name="addr"></td>
		
		</tr>
		
		<tr>
			<th>주소2</th>
			<td><input type ="text" name="addr2"></td>
		
		</tr>
		<tr>
			<th>해시태그</th>
			<td><input type ="text" name="hashtag"></td>
		
		</tr>
		<tr>
			<th>연락처</th>
			<td><input type ="text" name="tel"></td>
		
		</tr>
		<tr>
			<th>위도</th>
			<td><input type ="text" name="x"></td>
		
		</tr>
		<tr>
			<th>경도</th>
			<td><input type ="text" name="y"></td>
		
		</tr>
				
		<tr>
			<th>이미지</th>
			<td><input type ="file" name="file1"></td>
		</tr>


	</table>
	<p style="width:800px; text-align:center;">
	<button type = "submit"
	onclick ="fn_submit();return false;">저장</button>	
	<button type="reset">재작성</button>
	</p>
	
</form>
	</div>
	
</div>

</body>
</html>