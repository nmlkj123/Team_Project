<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>Login</title>
 <link href='../css/join_style.css' rel='stylesheet' style='text/css'/>
  </head>
   <style>
       
    </style>
  <script>
  function fn_memberSubmit() {
	  /* 데이터 유효성 체크    */
	  var f = document.frm;
	  if(f.userid.value == "") {
		  alert("아이디를 입력해주세요.");
		  return false;
	  }
	  if(f.pwd.value == "") {
		  alert("패스워드를 입력해주세요.");
		  return false;
	  }
	  if(f.name.value == "") {
		  alert("이름을 입력해주세요.");
		  return false;
	  }
	
	  if(f.tel.value == "") {
		  alert("연락처를 입력해주세요.");
		  return false;
	  }
	  if(f.post1.value == "") {
		  alert("주소를 입력해주세요.");
		  return false;
	  }
	  if(f.post2.value == "") {
		  alert("주소를 입력해주세요.");
		  return false;
	  }
	  if(f.email1.value == "") {
		  alert("이메일를 입력해주세요.");
		  return false;
	  }
  	  if(f.email2.value == "") {
		  alert("이메일를 입력해주세요.");
	 	  return false;
  }
	  
	  f.submit();
	  
  }
  
  function fn_popup() {
	  
	  var id = document.frm.userid.value;
	  if(id == "") {
		  alert("아이디를 입력해주세요.");
		  document.frm.userid.focus();
		  return false;
	  }
	  var url = "idcheck.jsp?userid="+id;
	  // window.open('웹주소','별칭','옵션');
	  window.open(url,'popup','width=400,height=150');
  }
  
  function fn_post(){
	  url="../member/post1.jsp";
	  window.open(url,'post','width=400,height=150'); 
	  
	  
  }
  
  </script>
  
  <body>
    
     
 
      <div id="wrap">
       <br><br><br>
          <h1 class="h1">회원가입</h1>
        <div class="tablebox">
        
        
<form name="frm" method="post" action="memberSave.jsp">
<table>

		
		
		
                <tr>
                    <td class="td1">아이디</td>
                    <td>
                        <input class="input1" type="text" name="userid" maxlength="20" style="width:73%;">
                        <input class="btn1" type="button" value="중복확인"onclick="fn_popup()" >    
                    </td>
                </tr>
                        
                <tr>
                    <td class="td1">비밀번호</td>
                    <td>
                        <input class="input1" type="password" name="pwd" maxlength="15">
                    </td>
                </tr>
                
               
                    
                <tr>
                    <td class="td1">이름</td>
                    <td>
                        <input class="input1" type="text" name="name" maxlength="40">
                    </td>
                </tr>
  
                    
                <tr>
                    <td class="td1">이메일</td>
                    <td>
                        <input class="input5" type="text" name="email1" maxlength="30">@
                        <select class="input5" name="email2">
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>                        
                        </select>
                    </td>
                </tr>
                    
                <tr>
                    <td class="td1">휴대전화</td>
                    <td>
                        <input class="input1" type="text" name="tel" />
                    </td>
                </tr>
         <tr>
		<td class="td1">주소</td>
		<td class="input1">
			<input type="text" class="input5" name="post1" style="width:73%;">
			<input type="button" class="btn1" value="우편번호" onclick="fn_post()">
			
			<input type="text" class="input2" name="post2" style="width:98%;">
		</td>
	</tr>
	<tr>
	</table>
	<br><br>
           
		
			<input type="submit" class="btn2" value="가입완료" 
					onclick="fn_memberSubmit(); return false;">
			<input type="reset"  class="btn2" value="재작성">

</form>
        
        </div>
        </div>
 
 
  </body>
  
</html>