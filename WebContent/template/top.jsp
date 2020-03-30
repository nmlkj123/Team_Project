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
		<%
		String id=(String)session.getAttribute("memId");
		String name=(String)session.getAttribute("memName");
		if(id==null){%>
			<div style="margin-right: 80px; float: right;">
			<a href="../member/login.jsp">로그인 </a>
			</div>
		<%}else if(id.equals("admin")){%>
			<div style="margin-right: 80px; float: right;">
			<a href="javascript:void(0)"><%=name %> 님 </a>
			<a href="../member/logout.jsp">로그아웃 </a>
			<a href="../admin/SpotList.jsp">관리자 </a>
			</div>
		<%} else{%>
			<div style="margin-right: 80px; float: right;">
			<a href="javascript:void(0)"><%=name %> 님 </a>
			<a href="../member/logout.jsp">로그아웃 </a>
			</div>
		<%}%>
	</div>
  <div class="menu" >
   <!-- 메뉴시작 -->
   <div class="logo_main">
	   <a href="../main/main.jsp"><img alt="" src="../image/logo.jpg" width="120px" height="62px">
	   </a>
   </div>
   
    <ul id="ddmenu" >   	 
      <li><a href="../tourist/tourist.jsp">관광지</a>
         <div>
          <a href="../tourist/tourist.jsp?deptno=">전체</a>
          <a href="../tourist/tourist.jsp?deptno=10">자연</a>
          <a href="../tourist/tourist.jsp?deptno=20">문화관광</a>
          <a href="../tourist/tourist.jsp?deptno=40">테마관광지</a>     
          <a href="../tourist/tourist.jsp?deptno=60">도보</a>
          <a href="../tourist/tourist.jsp?deptno=30">레저</a>
          <a href="../tourist/tourist.jsp?deptno=50">섬속의섬</a>   
         </div>
      </li>
      
      <li><a href="../restaurant/restaurant.jsp">맛집</a>
		 <div>
          <a href="../restaurant/restaurant.jsp?deptno=">전체</a>
          <a href="../restaurant/restaurant.jsp?deptno=10">향토음식</a>
          <a href="../restaurant/restaurant.jsp?deptno=20">한식</a> 
          <a href="../restaurant/restaurant.jsp?deptno=30">양식</a>
          <a href="../restaurant/restaurant.jsp?deptno=40">일식</a>  
          <a href="../restaurant/restaurant.jsp?deptno=50">중식</a>   
          <a href="../restaurant/restaurant.jsp?deptno=60">동남아식</a>
          <a href="../restaurant/restaurant.jsp?deptno=70">할랄프렌들리식</a>  
          <a href="../restaurant/restaurant.jsp?deptno=80">카페</a>     
         </div>
      </li>
      	
      <li><a href="../shopping/shopping.jsp">쇼핑</a>
  		 <div>
          <a href="../shopping/shopping.jsp?deptno=">전체</a>
          <a href="../shopping/shopping.jsp?deptno=10">특산품</a>
          <a href="../shopping/shopping.jsp?deptno=20">전통시장</a>     
          <a href="../shopping/shopping.jsp?deptno=30">상점.상가</a>
          <a href="../shopping/shopping.jsp?deptno=40">면세점</a>
          <a href="../shopping/shopping.jsp?deptno=50">플리마켓</a>   
          <a href="../shopping/shopping.jsp?deptno=60">관광기념품</a> 
         </div>
      </li>
      <li><a href="../member/myPage.jsp">나의여행</a></li>
    </ul>
    
    <!--  <input class="form-control input-sm" width="10px" height="10px" itemname="검색어"  >
      <button  class="btn btn-secondary my-2 my-sm-0">검색</button> -->

    
   <!-- 메뉴 종료 -->
    
   </div>
 <div class="top_fix"> 
	<form id="search-body" method="get" action="../main/search.jsp">
	  <button id="s-btn-body" type="submit">
	    <span id="s-btn"></span>
	  </button>
	  <div id="s-form-body">
	    <input id="s-form" name="q" type="text" placeholder="Search">
	  </div>
	</form>
</div> 
 </div>
 
