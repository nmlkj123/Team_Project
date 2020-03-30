<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광지디테일화면</title>
</head>
<style>


</style>
<body>
 <div>
 <img  src="../imgMain/udo.jpg">
  
   <!-- 2.내부검정박스 -->
 <div class="innerBox">
   <!-- 3.내부 디테일정보 박스 -->
  <div class="infoName">
   <h3>우도</h3><!--해당관광지이름정보가져오기(데이터연결)-->
   <p style="margin-top:-20px;">(해양도립공원)</p>
  </div>

  <div class="stars">
   <p>별모양찍기</p>
  </div>
  
  <div class="tag">
   <p>#섬속의섬,블라블라 등등</p>
  
  </div>
  
  <div style="">
   <p class="title">&nbsp;&nbsp;&nbsp;기본정보</p>
    <div class="clear">
	   <p class="t_ele">주소</p>
	   <p class="t_cont">제주특별자치도 제주시 우도면 삼양고수물길 1</p>
    </div>
   
    <div class="clear">
   	   <p class="t_ele">연락처</p>
       <p class="t_cont">(+82)064-782-5671</p>       
    </div>
    <br><br><br>	
    <button type="button" onclick="location='map.jsp'">길찾기</button>
  </div>
  
 </div>
 </div>
 
 
 <!-- 상단박스 -->
 <div class="appraisalList">
 	<ul>
 		<li>
 		 <div class="icon_like"></div>
 		 <p class="font">좋아요</p>
 		 <p class="cnt">cnt</p>
 		</li>
 		<li>
 		 <div class="icon_zzim"></div>
 		 <p class="font">찜하기</p>
 		 <p class="cnt">cnt</p>
 		</li>
 		<li>
 		 <div class="icon_review"></div>
 		 <p class="font">리뷰수</p>
 		 <p class="cnt">cnt</p>
 		</li>
 		<li>
 		 <div class="icon_visit"></div>
 		 <p class="font">방문했어요</p>
 		 <p class="cnt">cnt</p>
 		</li>
 		<li>
 		 <div class="icon_hits"></div>
 		 <p class="font">조회수</p>
 		 <p class="cnt">cnt</p>
 		</li>
 		<li style="border:none;">
 		 <div class="icon_hits"></div>
 		 <p class="font">일정등록</p>
 		 <p class="cnt">cnt</p>
 		</li>
 	
 	</ul>
 </div>



</body>
</html>