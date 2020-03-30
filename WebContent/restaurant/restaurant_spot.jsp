<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../include/dbcon2.jsp" %>
<%String tunq=request.getParameter("tunq"); 
	if(tunq==""||tunq==null){
		%>
			<script>
				alert("잘못된접근");
				history.back();
				
			</script>
		<%
		return ;
	}
	String memId=(String)session.getAttribute("memId");
	ResultSet rs= stmt.executeQuery("select * from restaurant_spot where unq="+tunq+"");
	rs.next();
	String image =rs.getString("image");
	String name =rs.getString("name");
	String addr =rs.getString("addr");
	String addr2 =rs.getString("addr2");
	String tel =rs.getString("tel");
	String back =rs.getString("back");
	String hit =rs.getString("hit");
	String hashtag =rs.getString("hashtag");
	String x =rs.getString("x");
	String y =rs.getString("y");
	String deptno =rs.getString("deptno");
	
	stmt.executeUpdate("update restaurant_spot set hit=hit+1 where unq="+tunq+"");
	
	ResultSet rs2= stmt.executeQuery("select count(*) as cnt from restaurant_review where pid="+tunq+"");
	rs2.next();
	String rcount=rs2.getString("cnt");
	ResultSet rs3= stmt.executeQuery("select count(*) cnt from mylist where like_spot="+tunq+" and type=2");
	rs3.next();
	String like1 =rs3.getString("cnt");
	ResultSet rs4= stmt.executeQuery("select count(*) cnt from mylist where jjim_spot="+tunq+" and type=2");
	rs4.next();
	String jjim1 =rs4.getString("cnt");
%>

<!-- Start Head -->
<head>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=daa73ba7c8570b532786a65429768b2e"></script>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Aperitif - Custom Template</title>
 	 
	<link rel="stylesheet" href="../assets/css/style.min.css">
	<link rel="stylesheet" href="../assets/css/modules.css">
	<link rel="stylesheet" href="../css/touristDetail.css">
	<!-- Canonical URL usage -->
	<link rel="canonical" href="https://aperitif.io/">
	<link rel="stylesheet" href="../css/spot.css">
	<!-- Facebook Open Graph -->
	<meta property="og:url"                content="https://aperitif.io/" />
	<meta property="og:title"              content="Aperitif | The web template generator" />
	<meta property="og:description"        content="Aperitif is a rapid web template generation tool." />
	<meta property="og:image"              content="https://aperitif.io/img/aperitif-facebook.png" />
	<meta property="og:image:width"        content="1200" />
	<meta property="og:image:height"       content="630" />

	<!-- Twitter Cards -->
	<meta name="twitter:card" content="summary_large_image">
	<meta name="twitter:site" content="@Aperitif">
	<meta name="twitter:creator" content="@Aperitif">
	<meta name="twitter:title" content="Aperitif - The web template generator">
	<meta name="twitter:description" content="Aperitif is a rapid web template generation tool.">
	<meta name="twitter:image" content="https://aperitif.io/img/aperitif-card.png">
	<style>
.tourist_out{
	width:100%;
	text-align: center;
}
.tourist_content{
	width:80%;
	height:50px;
	display: inline-block;
	
}
#detailTap{
	width:100%;
	height: 50px;

}
.tab_btn{
	width: 20%;
	font: 400 13.3333px Arial;
	padding:0;
    border:0;
    margin:0;
	display: inline-block;
	float: left;
    height: 50px;
    background-color: #f4f4f4;
    border-top: 1px solid #e5e5e5;
    border-bottom: 2px solid #ef6d00
	
}
.tab_btn span{
	background:url(../images/top-dotted.gif) right no-repeat;
	display:block;
	text-decoration:none;
	text-transform:uppercase;
	white-space:nowrap;
	text-align:center;
	font-weight: bold;
	font-family: inherit;
    font-size: inherit;
    color: inherit;
    cursor: pointer;
    text-transform: inherit;
}

.tab_cont{
	width:100%;
	display: inline-block;
	/* border: 2px solid green; */
	margin-top: 20px;
}
 .on{
 	padding:0;
    border:0;
    border: 2px solid #ef6d00;
    border-bottom: 0;
    margin:0;
    background-color:#ffffff;
	width: 20%
	height: 50px;
	font: 400 13.3333px Arial;
	box-sizing: border-box;

} 
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../js/tspot.js"></script>

<script>


function content2(){
	$.ajax({
		url:'content.jsp?tunq='+<%=tunq%>,
		type:'POST',
		dataType:'html',
		success:function(result){
			$('.tab_cont').html(result);
		}
	});
}
function use(){
	$.ajax({
		url:'use.jsp?unq='+<%=tunq%>,
		type:'POST',
		dataType:'html',
		success:function(result){
			$('.tab_cont').html(result);
		}
	});
}
function photo(){
	$.ajax({
		url:'photo.jsp?unq='+<%=tunq%>,
		type:'POST',
		dataType:'html',
		success:function(result){
			$('.tab_cont').html(result);
		}
	});
}
function maps(){
	$.ajax({
		url:'map.jsp',
		type:'POST',
		data:'image2=<%=image%>'+'&addr2=<%=addr%>'+'&name2=<%=name%>'+'&x=<%=x%>'+'&y=<%=y%>',
		dataType:'html',
		success:function(result){
			$('.tab_cont').html(result);
		}
	});
}
function review(pg,num){
	$.ajax({
		url:'review.jsp',
		type:'POST',
		data:'pg='+pg+'&pid='+num,
		dataType:'html',
		success:function(result){
			$('.tab_cont').html(result);
			
		}
	});
}
$(document).ready(function(){
	var para = document.location.href.split("#");
	if(para.length==1){
		$("button[st='#content']").addClass("on");
		content2();
		}
	if(para[1]=="photo"||para[1]=="content"||para[1]=="use"||para[1]=="map"||para[1]=="review"){
		$('#detailTap .tab_btn').removeClass('on');
		$("button[st='#"+para[1]+"']").addClass("on");
		if(para[1]=="content"){
			content2();
			
		}else if(para[1]=="use"){
			use();
			
		}else if(para[1]=="photo"){
			photo();
			
		}else if(para[1]=="map"){
			maps();
			
		}else if(para[1]=="review"){
			review("1","<%=tunq%>");
			
		}
	}
	
	$(".like_button4").click(function(){
		var dd='<%=memId %>';
		if(dd=='null'){
			alert("로그인하세요");
			return false;
		}
		$.ajax({
			url:'like_plus.jsp',
			type:'POST',
			data:'tunq=<%=tunq%>'+'&name=<%=name%>'+'&addr=<%=addr2%>'+'&deptno=<%=deptno%>'+'&image=<%=image%>',
			dataType:'html',
			success:function(result){
				if(result.trim()=="1"){
					vs=$($(".like_button4").closest(".liketd")).find(".cnt");
					$(vs).text(Number($(vs).text())+1);
					alert("좋아요를 눌렀습니다");
				}else{
					vs=$($(".like_button4").closest(".liketd")).find(".cnt");
					$(vs).text(Number($(vs).text())-1);
					alert("좋아요를 취소했습니다");
				}
				
			}
		});
	});
	$(".jjim_button4").click(function(){
		var dd='<%=memId %>';
		if(dd=='null'){
			alert("로그인하세요");
			return false;
		}
		$.ajax({
			url:'jjim_plus.jsp',
			type:'POST',
			data:'tunq=<%=tunq%>'+'&name=<%=name%>'+'&addr=<%=addr2%>'+'&deptno=<%=deptno%>'+'&image=<%=image%>',
			dataType:'html',
			success:function(result){
				if(result.trim()=="1"){
					vs=$($(".jjim_button4").closest(".jjimtd")).find(".cnt");
					$(vs).text(Number($(vs).text())+1);
					alert("찜했습니다");
				}else{
					vs=$($(".jjim_button4").closest(".jjimtd")).find(".cnt");
					$(vs).text(Number($(vs).text())-1);
					alert("찜을 취소했습니다");
				}
				
			}
		});
	});
	$(".findload").click(function(){
		$('#detailTap .tab_btn').removeClass('on');
		$("button[st='#map']").addClass("on");
		maps();
		var scmove = $('.tab_cont').offset().top-220;
		$('html, body').animate( { scrollTop : scmove }, 400 );
	});
	$('.tab_btn').click(function(){
		if($(this).hasClass("on") == true){
			return false;
		}
		$('#detailTap .tab_btn').removeClass('on');
		$(this).addClass("on");
		
		var st=$(this).attr('st');
		if(st=="#content"){
			content2();
			location.href="#content";
		}else if(st=="#use"){
			use();
			location.href="#use";
		}else if(st=="#photo"){
			photo();
			location.href="#photo";
		}else if(st=="#map"){
			maps();
			location.href="#map";
		}else if(st=="#review"){
			review("1","<%=tunq%>");
			location.href="#review";
		}
		
		return false;
		
	});

	
});
</script>

<link href="../css/lightbox.css" rel="stylesheet" />

</head>
<!-- End Head -->

<body class="default">

<!--
START MODULE AREA 1: header1
-->
<header class="MOD_HEADER1">
  <jsp:include page="../template/top.jsp" />
  
</header>
<!--
END MODULE AREA 1: Header 1
-->

<!--
  START MODULE AREA 2: Page Title 1
-->
<section>
  <div data-layout="_r" style="height: 120px;">
    <div data-layout="al16">
      
    </div>
  </div>
</section>
<!--
  END MODULE AREA 2: Page Title 1
-->
<!-- 메인 -->
<div class="detailInfo">
 <div class="imgInfo">
 <img  src="../touristImage/<%=image %>">
  
   <!-- 2.내부검정박스 -->
 <div class="innerBox">
   <!-- 3.내부 디테일정보 박스 -->
  <div class="infoName">
   <h3><%=name %></h3><!--해당관광지이름정보가져오기(데이터연결)-->
   <p style="margin-top:-20px;">(<%=addr2 %>)</p>
  </div>

  <div class="stars">
   <p></p>
  </div>
  
  <div class="tag">
   <p><%=hashtag %></p>
  
  </div>
  
  <div class="textInfo">
   <p class="title">&nbsp;&nbsp;&nbsp;기본정보</p>
    <div>
	   <p class="t_ele">주소</p>
	   <p class="t_cont"><%=addr %></p>
    </div>
     
    <div style="clear: both;">
   	   <p class="t_ele">연락처</p>
       <p class="t_cont"><%=tel %></p>       
    </div>
    <br><br>	
    <button type="button" class="findload">길찾기</button>
  </div>
  
 </div>
 </div>
 
 <!-- 상단박스 -->
 <table class="appraisalList">
 	<tr>
 		<td class="liketd">
 		 <div class="icon_like like_button4"  style="cursor: pointer;"></div>
 		 <p class="font">좋아요</p>
 		 <p class="cnt"><%=like1 %></p>
 		</td>
 		<td class="jjimtd">
 		 <div class="icon_zzim jjim_button4" style="cursor: pointer;"></div>
 		 <p class="font">찜하기</p>
 		 <p class="cnt"><%=jjim1 %></p>
 		</td>
 		<td>
 		 <div class="icon_review"></div>
 		 <p class="font">리뷰수</p>
 		 <p class="cnt"><%=rcount %></p>
 		</td>
 		<td>
 		 <div class="icon_visit"></div>
 		 <p class="font">방문했어요</p>
 		 <p class="cnt"><%=back %></p>
 		</td>
 		<td>
 		 <div class="icon_hits"></div>
 		 <p class="font">조회수</p>
 		 <p class="cnt"><%=hit %></p>
 		</td>
 		<td style="border:none;">
 		 <div class="icon_hits"></div>
 		 <p class="font">일정등록</p>
 		 <p class="cnt">cnt</p>
 		</td>
 	
 	</tr>
 </table>
</div>

<div class="tourist_out">

	<div class="tourist_content">
		<div id="detailTap" class="tab_area item_7 clear">
		<button  type="button" class="tab_btn " st="#content">
			<span>상세 정보</span>
		</button><!--
		--><button type="button" class="tab_btn" st="#use">
			<span>이용안내</span>
		</button><!--
		--><button type="button" class="tab_btn" st="#photo">
			<span>사진</span>
		</button><!--
		--><button type="button" class="tab_btn" st="#map">
			<span>지도/주변관광지</span>
		</button><!--
		--><button type="button" class="tab_btn" st="#review">
		<span>리뷰</span>
		</button>
		</div>
		
		
		<!--  -->
		<div class="tab_cont" >
			
		
		
		</div>
		
	</div>
</div>
<!--
START MODULE AREA 5: Footer 1
-->
<jsp:include page="../template/footer.jsp"></jsp:include>
<!--
END MODULE AREA 5: Footer 1
-->

<script src="../assets/js/index.js"></script>
<script src="../css/lightbox.js"></script>

</body>

</html>