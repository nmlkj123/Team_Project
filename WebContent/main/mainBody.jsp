<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 /*
 좋아요 테이블 연결
 관광지 테이블 연결 
 조인해서 가장 좋아요 수가 많은 관광지 사진가져오기.
 img src="해당관광지패스"
 */
 String imgpath="../imgMain/";
 String path="";//mainKorean->카테고리링크
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!--링크걸기 -->
<style>

.imgdiv {
  background: rgba(55, 55, 55, 0.5);
  position: absolute;
  width: 200px;
  font-size:15px;
  font-weight:bold;
  color:white;
  height:30px;
  text-align:center;
  margin-top:35px;
  margin-right:2px;
  line-height:2.0;
}
.imgdiv2 {
  background: rgba(55, 55, 55, 0.5);
  position: absolute;
  width: 150px;
  font-size:13px;
  font-weight:bold;
  color:white;
  height:20px;
  text-align:center;
  margin-top:30px;
  margin-right:2px;
  line-height:1.8;
}


.td1 {
  width: 200px;
  position: relative; 
  text-align:center;
  
}
.td2 {
  width: 150px;
  position: relative; 
  text-align:center;
  
}
</style>
<body>
<!-- 각카테고리에서 좋아요1순위 출력 -->
 <div>
 <h3>맛집 BEST</h3>
   <table>
    <tr>
     <td class="td1">
 		<div class="imgdiv">향토음식</div>
 		<a href="">
		<img src="<%=imgpath %>traditional.jpg" width="200" height="100">
		</a>
    </td>
    <td class="td1">
 		<div class="imgdiv">카페/디저트</div>
 		<a href="">
		<img src="<%=imgpath %>cafe.jpg" width="200" height="100">
		</a>
    </td>
    <td class="td1">
 		<div class="imgdiv">한식</div>
 		<a href="">
		<img src="<%=imgpath %>korean.jpg" width="200" height="100">
		</a>
    </td>
   </tr>
   
   <tr>
     <td class="td1">
 		<div class="imgdiv">양식</div>
 		<a href="">
		<img src="<%=imgpath %>western.jpg" width="200" height="100">
		</a>
    </td>
    <td class="td1">
 		<div class="imgdiv">중식</div>
 		<a href="">
		<img src="<%=imgpath %>chinese.jpg" width="200" height="100">
		</a>
    </td>
    <td class="td1">
 		<div class="imgdiv">일식</div>
 		<a href="">
		<img src="<%=imgpath %>japanese.jpg" width="200" height="100">
		</a>
    </td>
   </tr>
 
   </table>
 </div>
 
 <div>
 <h3>관광지 BEST</h3>
   <table>
    <tr>
     <td class="td2">
 		<div class="imgdiv2">자연</div>
 		<a href="">
		<img src="<%=imgpath %>traditional.jpg" width="150" height="75">
		</a>
    </td>
    <td class="td2">
 		<div class="imgdiv2">문화관광</div>
 		<a href="">
		<img src="<%=imgpath %>traditional.jpg" width="150" height="75">
		</a>
    </td>
    <td class="td2">
 		<div class="imgdiv2">레저/체험</div>
 		<a href="">
		<img src="<%=imgpath %>cafe.jpg" width="150" height="75">
		</a>
    </td>
    <td class="td2">
 		<div class="imgdiv2">테마관광지</div>
 		<a href="">
		<img src="<%=imgpath %>korean.jpg" width="150" height="75">
		</a>
    </td>
   </tr>
   
   <tr>
     <td class="td2">
 		<div class="imgdiv2">섬속의섬</div>
 		<a href="">
		<img src="<%=imgpath %>traditional.jpg" width="150" height="75">
		</a>
    </td>
     <td class="td2">
 		<div class="imgdiv2">도보</div>
 		<a href="">
		<img src="<%=imgpath %>western.jpg" width="150" height="75">
		</a>
    </td>
    <td class="td2">
 		<div class="imgdiv2">포토스팟</div>
 		<a href="">
		<img src="<%=imgpath %>chinese.jpg" width="150" height="75">
		</a>
    </td>
    <td class="td2">
 		<div class="imgdiv2">템플스테이</div>
 		<a href="">
		<img src="<%=imgpath %>japanese.jpg" width="150" height="75">
		</a>
    </td>
   </tr>
   
   
   </table>
 </div>
</body>
</html>