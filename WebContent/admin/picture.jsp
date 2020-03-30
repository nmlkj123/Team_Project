<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/dbcon2.jsp" %> 

<%

String unq= request.getParameter("unq");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진추가</title>

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
	if(f.image.value=="") {
		alert("이미지를 등록해주세요");
		f.image.focus();
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
	<form name="frm" method="post" action= "pictureSave.jsp"
	enctype="Multipart/form-data">
	<table class="table1">

		<tr>
			<th>이미지 추가</th>
			
			<td><input type ="file" name="file1"></td>
			<input type="hidden" name="unq" value="<%=unq %>">
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