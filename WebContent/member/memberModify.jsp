<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/dbcon2.jsp" %>

<%
String userId=(String)session.getAttribute("memId");
String sql = " SELECT userid,pwd,tel,post1,post2,email1,email2,image ";
	   sql+= " 	FROM member ";
	   sql+= " 		WHERE userid = '"+userId+ "' ";

ResultSet rs = stmt.executeQuery(sql);
rs.next();


String userid = rs.getString("userid");
String pwd = rs.getString("pwd");
String tel = rs.getString("tel");
String post1 = rs.getString("post1");
String post2 = rs.getString("post2");
String email1 = rs.getString("email1");
String email2 = rs.getString("email2");
String image = rs.getString("image");
%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>Login</title>
  <link href='../css/join_style.css' rel='stylesheet' style='text/css'/>
  
  </head>
   
  <script>
  function fn_memberSubmit() {
	  /* 데이터 유효성 체크    */
	  var f = document.frm;

	  if(f.pwd.value == "") {
		  alert("패스워드를 입력해주세요.");
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
  
  function fn_post(){
	  url="../member/post1.jsp";
	  window.open(url,'post','width=400,height=150'); 
	  
	  
  }
  
  </script>
  
  <body>
    
     
  <div id="wrap">
       <br><br><br>
          <h1 class="h1">회원정보수정</h1>
        <div class="tablebox">
        
<form name="frm" method="post" action="memberModifySave.jsp" enctype="Multipart/form-data">
<table>
             
     <tr>
		<td class="td1">아이디</td>  
		<td><input class="input1" type="text" name="userid" readonly value=<%=userId %>></td>
	</tr>
                
     <tr>
        <td class="td1">비밀번호</td>
        <td>
        <input class="input1" type="password" name="pwd" maxlength="15">
        </td>
     </tr>
                
     <tr>
        <td class="td1">이메일</td>
        <td>
        <input class="input5" type="text" name="email1" value="<%=email1%>" maxlength="30">@
         <select class="input5" name="email2">
            <option value="naver.com" <%if("naver.com".equals(email2)) out.print("selected"); %>   >naver.com</option> 
 			<option value="daum.net"  <%if("daum.net".equals(email2)) out.print("selected"); %>   >daum.net</option> 
  			<option value="gmail.com" <%if("gmail.com".equals(email2)) out.print("selected"); %>  >gmail.com</option> 
   			<option value="nate.com"  <%if("nate.com".equals(email2)) out.print("selected"); %>  >nate.com</option>                       
          </select>
         </td>
      </tr>
                  
          <tr>
          <td class="td1" >연락처</td>
                    <td>
                        <input class="input1" type="text" name="tel" value="<%=tel%>">
                    </td>
                </tr>
                
         <tr>
		<td class="td1">주소</td>
		<td class="input1">
			<input type="text" class="input5" name="post1" value="<%=post1%>"style="width:73%;">
			<input type="button" class="button1" value="우편번호" onclick="fn_post()">
			<br>
			<input type="text" class="input5" name="post2" value="<%=post2 %>" style="width:98%;">
		</td>
	</tr>
	
	<tr>
			<td class="td1">이미지</td>
			<td><input class="input1" type ="file" name="file1" value="<%=image%>"></td>
		</tr>
		

	
 
	
</table>
 <br><br>
	
			<input type="submit" class="btn2" value="변경완료" 
					onclick="fn_memberSubmit(); return false;">
			
		
</form>
        
        </div>
 
 </div>
  </body>
</html>