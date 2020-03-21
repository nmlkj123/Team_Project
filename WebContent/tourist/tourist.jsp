<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon2.jsp" %>
 	
   <%
   String sql="select deptno,dname from tourist ";
   ResultSet rs=stmt.executeQuery(sql);
   request.setAttribute("url", "/project_App/tourist/tourist.jsp");

    %>
<!DOCTYPE html>
<html lang="en">
<!-- Start Head -->
<head>
	

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Aperitif - Custom Template</title>
 	 <link rel="stylesheet" href="../css/tourist.css">
	<link rel="stylesheet" href="../assets/css/style.min.css">
	<link rel="stylesheet" href="../assets/css/modules.css">

	<!-- Canonical URL usage -->
	<link rel="canonical" href="https://aperitif.io/">

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
  <div data-layout="_r" style="height: 200px;">
    <div data-layout="al16">
      
    </div>
  </div>
</section>
<!--
  END MODULE AREA 2: Page Title 1
-->

<!--
START MODULE AREA 3: Hero 1
-->
<div class="tourist_out" >
<div class="tourist_content">
<div class="tourist_div1">제주도 모든 여행지를 한 눈에…</div>
<br><br>
<div class="tourist_div2">
내가 가본 제주는 어디까지일까? 수많은 제주의 아름다운 여행지를 취향에 맞게 선택해보자. 368개의 크고 작은 오름을 비롯하여 눈 돌리면
어디에서나 마주치는 한라산 그리고 푸른 바다…. 제주의 보석 같은 여행지가 여러분의 선택을 기다린다.


</div>
<br><br>


<table class="tourist_table1" >
<tr>
<th bgcolor="#ff7f00" rowspan="3"><a style="color:#ffffff;" href ="?deptno=">전체</a></th>
<%
int count=0;
while(rs.next()){
	%>
	<th><a href="tourist.jsp?no=<%=rs.getString("deptno") %>"><%=rs.getString("dname") %></a></th>
	
<% 
	count++;
	if(count%4==0){
		%>
		</tr>
		<%
	}
}
%>




</table>

<br><br><br>

<h3 align="left">전체</h3>

<div class="tourist_list">
<ul>

<li>
<div>

<form name="frm" method="post" action="">
<table class="tourist_table2_l" >
<tr>
<td class="tourist_td1" colspan="3" >
	<div class="t_img">
	<img alt="" src="../image/1.jpg" width="100%" height="100%"> 
	<div class="t_tag">관광지</div>
	</div>
</td>
</tr>

<tr>
<th colspan="3" style="">우도</th>
</tr>

<tr>
<th colspan="3">제주도>주소</th>
</tr>

<tr>
<th height="10px" colspan="3"style="color: #FF7100;">#해쉬태그</th>

</tr>

<tr>
<td class="tourist_td2">
<img class=src1 src="../image/like.png"><br>
<button type="button" class="tourist_button1"style="color: black;">좋아요</button>
</td>

<td class="tourist_td2">
<img class=src1 src="../image/zzim.png"><br>
<button type="button" class="tourist_button1" style="color: black;">찜하기</button>
</td>

<td class="tourist_td2">
<img class=src1 src="../image/review.png"><br>
<button type="button" class="tourist_button1"style="color: black;">리뷰</button>
</td>

</tr>

</table>
</form>
</div>
</li>


</ul>

</div>
<!--list end  -->
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
</body>

</html>
			
			