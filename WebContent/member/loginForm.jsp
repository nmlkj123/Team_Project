<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>회원가입</title>
    
    <script type="text/javascript">

function email_change(){

if(document.join.email.options[document.join.email.selectedIndex].value == '0'){

 document.join.email2.disabled = true;

 document.join.email2.value = "";

}

if(document.join.email.options[document.join.email.selectedIndex].value == '9'){

 document.join.email2.disabled = false;

 document.join.email2.value = "";

 document.join.email2.focus();

} else{

 document.join.email2.disabled = true;

 document.join.email2.value = document.join.email.options[document.join.email.selectedIndex].value;

}

}

function checkValue()
{   
   var form = document.userInfo;
   
   if(!form.id.value) {
      alert("아이디를 입력하세요");
      return false;
   }
   
   if(!form.idDuplication.value != "idCheck") {
      alert("아이디 중복체크를 를 해주세요");
      return false;
   }
   
   if(!form.pwd.value) {
      alert("비밀번호를 입력하세요");
      return false;
   }
   
   if(!form.pwd.value != form.pwdcheck.value) {
      alert("비밀번호를 동일하게 입력하세요")
      return false;
   }
   
   if(!form.name.value) {
      alert("이름을 입력해주세요")
      return false;
   }
   form.submit();
}

</script>

</head>

        <link href='../css/join_style.css' rel='stylesheet' style='text/css'/>

<body>
    <!-- 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
    <div id="wrap">
        <h1 class="h1">회원가입</h1>
        <div class="tablebox">
        <form name="userInfo" method="post" action="../save/joinFormSave.jsp">
            <table>
                <tr>
                    <td class="td1">아이디</td>
                    <td>
                        <input class="input2" type="text" name="id" maxlength="20" onkeydown="inputIdChk()">
                        <input type="button" value="중복확인" onclick="openIdChk()">
                        <input type="hidden" name="idDuplication" value="idUncheck">    
                    </td>
                </tr>
                        
                <tr>
                    <td class="td1">패스워드</td>
                    <td>
                        <input class="input1" type="pwd" name="pwd" maxlength="15">
                    </td>
                </tr>
                
                <tr>
                    <td class="td1">패스워드 확인</td>
                    <td>
                        <input class="input1" type="pwdcheck" name="pwdcheck" maxlength="15">
                    </td>
                </tr>
                    
                <tr>
                    <td class="td1">이름</td>
                    <td>
                        <input class="input1" type="text" name="name" maxlength="40">
                    </td>
                </tr>
                
                <tr>
                    <td class="td1">주민번호</td>
                    <td>
                        <input class="input1" type="text" name="unqNumber" maxlength="40" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
                    </td>
                </tr>
                    
                <tr>
                    <td class="td1">성별</td>
                    <td>
                        <input type="radio" name="gender" value="남" checked>남
                        <input type="radio" name="gender" value="여" checked>여
                    </td>
                </tr>
                      
                <tr>
                    <td class="td1">이메일</td>
                    <td>
                        <input class="input5" type="text" name="email1" value="이메일" onfocus="this.value='';">   @

                  <input class="input5" type="text" name="email2" value="" disabled >

                  <select name="email" onchange="email_change()">
                     <option value="0" >선택하세요</option>
                      <option value="9">직접입력</option>
                      <option value="naver.com">naver.com</option>
                      <option value="nate.com">nate.com</option> 
                      <option value="daum.net">nate.com</option>
                        <option value="gmail.com">nate.com</option>
                     </select>
                    </td>
                </tr>
                    
                <tr>
                    <td class="td1">휴대전화</td>
                    <td>
                        <input class="input1" type="text" name="phone"  maxlength="11" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
                    </td>
                </tr>
                <tr>
                    <td class="td1">주소</td>
                    <td>
                        <input class="input4" type="text" name="address" maxlength="20">
                        <input type="button" value="검색" >    
                    </td>
                    
                </tr>
            </table>
            <br>
            <input type="button" onclick="checkValue();" value="가입">  <input type="button" value="취소">
        </form>
        </div>
    </div>
</body>
</html>