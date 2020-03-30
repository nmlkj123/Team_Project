<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>로그인</title>
   <script>
    
     function fn_loginSave() {
     /* 데이터 유효성 체크    */
     var f = document.frm;
     if(f.id.value == "") {
        alert("아이디를 입력해주세요.");
        return false;
     }
     if(f.name.value == "") {
        alert("비밀번호를 입력해주세요.");
        return false;
     }
     f.submit();
}
        
        //버튼 클릭시 화면으로 이동
        function fn_searchId() {
            location.href="loginFindId.jsp";
        }
        
        function fn_searchPass() {
            location.href="loginFindPwd.jsp";
        }
        
        function fn_joinForm() {
            location.href="member.jsp";
        }
        </script>
<%@include file="../template/top.jsp" %>
<link rel="stylesheet" href="../assets/css/style.min.css">
<link rel="stylesheet" href="../assets/css/modules.css">
</head>
<style>
   .box1 {
   border: solid 3px #FE9A2E;
   border-radius:20px;
   height: 800px;
   width: 500px;
   margin:0 auto; 
   }
   
   .box2 {
   border: solid 3px #FE9A2E;
   border-radius:20px;
   height: 60px;
   width: 150px;
   margin-left: 170px;
   margin-top: 240px;
   padding-top: 10px;
   background-color:#FAFAFA;
   text-align: center;
   font-size:30px;
   font-family: 맑은 고딕;
   }
   
   .box3 {
   margin-top: 120px;
   }
   
   .bg {
     background: url(../image/bg.jpg) no-repeat;
    background-size: 500px 800px;
   
   }
   
   .input1 {
   border: solid 2px #FE9A2E;
   border-radius:5px;
   margin-top: 20px;
   margin-left:155px;
   height: 35px;
   width: 180px;
   text-align: center;
   font-size: 16px;
   font-family: 맑은 고딕;
   }
   
   .input2 {
   border: solid 2px #FE9A2E;
   border-radius:5px;
   height: 40px;
   width: 100px;
   margin-top:70px;
   margin-left:53px;
   font-size:12px;
   font-family: 맑은 고딕;
   color:#FFFFFF;
   background-color: #5e5e5e;
   }
   
   .input3 {
   border: solid 2px #FE9A2E;
   border-radius:5px;
   margin-top: 20px;
   margin-left:200px;
   background-color:white;
   height: 35px;
   width: 95px;
   text-align: center;
   font-size: 16px;
   font-family: 맑은 고딕;
   }
</style>
<body>
<section>
  <div data-layout="_r" style="height: 100px;">
    <div data-layout="al16">
      
    </div>
  </div>
</section>
<div class="box1 bg">
   <div class="box2">비번찾기</div>
   <form name="frm" method="post" action="searchPwd.jsp">
   <div class="box3">
   <table>
         <tr>
            <input class="input1" type=id name="id"onclick="this.value=''" value="아이디" maxlength="30"><br>
         </tr>
         
         <tr>
            <input class="input1" type=id name="name" onclick="this.value=''" value="이름"  maxlength="15"><br>
         </tr>
         
         <tr>
            <input class="input3" type="button" name="login" value="찾기"
            onclick="fn_loginSave(); return false;"><br>
         </tr>
         <tr>
            <input class="input2" type="button" name="fid" value="아이디찾기"
            onclick="fn_searchId();">
            <input class="input2" type="button" name="fpwd" value="비밀번호찾기"
            onclick="fn_searchPass();">
            <input class="input2" type=button name="join" value="회원가입"
            onclick="fn_joinForm();"><br>
         </tr>
   </table>
   </div>
   </form>
   </div>
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>

</html>