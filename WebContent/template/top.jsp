<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="../css/style_1.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#ddmenu > li').hover(menu_open, menu_close);
		$('#ddmenu > li div a').hover(side_open, side_close);
		
	});
	
	function side_open(){
		$(this).css('color','#FF7100');	
			
	}
	 
	function side_close(){
		$(this).css('color','#A6A6A6');	
			
	}
	
	function menu_open(){
		$(".top_fix").css('visibility','hidden');
		$(this).find('div').css('visibility','visible');
		/* $(this).find('>a').css('color','gold'); */
	}
	 
	function menu_close(){
			
		$(this).find('div').css('visibility','hidden');
		$(".top_fix").css('visibility','visible');
	}
  
</script>

<div id="wrap" class="jbFixed" >
	<div class="menu_top">
		<a href="#">로그인 </a>
	</div>
  <div class="menu" >
   <!-- 메뉴시작 -->
   <div class="logo_main">
	   <a href="#"><img alt="" src="../image/logo.jpg" width="120px" height="62px">
	   </a>
   </div>
   
    <ul id="ddmenu" >   	 
      <li><a href="../tourist/tourist.jsp">관광지</a>
         <div>
          <a href="http://www.JHTA.co.kr">전체</a>
          <a href="#">자연</a>
          <a href="#">문화관광</a>
          <a href="#">테마관광지</a>     
          <a href="#">도보</a>
          <a href="#">레저</a>
          <a href="#">섬속의섬</a>   
         </div>
      </li>
      
      <li><a href="#">맛집</a>
		 <div>
          <a href="http://www.JHTA.co.kr">전체</a>
          <a href="#">향토음식</a>
          <a href="#">한식</a> 
          <a href="#">양식</a>
          <a href="#">일식</a>  
          <a href="#">중식</a>   
          <a href="#">동남아식</a>
          <a href="#">무슬림프렌들리</a>  
          <a href="#">카페</a>     
         </div>
      </li>
      	
      <li><a href="#">쇼핑</a>
  		 <div>
          <a href="http://www.JHTA.co.kr">전체</a>
          <a href="#">전체</a>
          <a href="#">전통시장</a>
          <a href="#">플리마켓</a>     
          <a href="#">면세점</a>
          <a href="#">상점/상가</a>
          <a href="#">특산품</a>   
          <a href="#">관광기념품</a> 
         </div>
      </li>
      <li><a href="#">나의여행</a></li>
    </ul>
    
    <!--  <input class="form-control input-sm" width="10px" height="10px" itemname="검색어"  >
      <button  class="btn btn-secondary my-2 my-sm-0">검색</button> -->

    
   <!-- 메뉴 종료 -->
    
   </div>
 <div class="top_fix"> 
	<form id="search-body">
	  <button id="s-btn-body" type="submit">
	    <span id="s-btn"></span>
	  </button>
	  <div id="s-form-body">
	    <input id="s-form" type="text" placeholder="Search">
	  </div>
	</form>
</div> 
 </div>
 
