<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 찾기</title>
</head>
<style>
.div1{
width:390px;
height:120px;
border:1px solid #777777;
margin:3px;  /*외부간격*/
padding:5px; /*내부간격*/
text-align:center;
vertical-align:middle;
line-height:1.6;
font-size:15px;
font-family:맑은 고딕;
color:#333333;
}
</style>
<script>
function fn_action(){
	var f=documnet.frm;
	if(f.dong.value==""){
		alert("동을 입력해주세요");
		f.dong.focus();
		return false;
	}
	f.submit();
}



</script>
<body>

<div class="div1">
<p>
찾으려는 동/읍을 입력해주세요.
</p>
<form name="frm" method="post" action="post2.jsp">
<input type="text" name="dong">
<button type="button" onclick="fn_action()">다음</button>
</form>

</div>
</body>
</html>