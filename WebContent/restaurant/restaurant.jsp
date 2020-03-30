<%@page import="restaurant.RestaurantPaging"%>
<%@page import="shopping.ShoppingPaging"%>
<%@page import="tourist.TouristPaging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon2.jsp" %>
 	
   <%
 	   	String pg =request.getParameter("pg");
 	      String deptno =request.getParameter("deptno");
 	      if(pg==null || pg.equals("")){
 	   	   pg="1";
 	      }
 	      
 	     
 	      
 	      int endNum=Integer.parseInt(pg)*6;
 	      int startNum=endNum-5;
 	      ResultSet rs3;
 	   	if(deptno==null || deptno.equals("")||deptno.equals("null")){
 	   		deptno="";
 	   		rs3=stmt.executeQuery("select count(*)as total from restaurant_spot");
 	   		
 	      }else{
 	   		rs3=stmt.executeQuery("select count(*)as total from restaurant_spot where deptno='"+deptno+"'");
 	   		 
 	      }
 	       
 	      rs3.next();
 	      int totalA=rs3.getInt("total");
 	      RestaurantPaging touristPaging=new RestaurantPaging(); 
 	      touristPaging.setCurrentPage(Integer.parseInt(pg));
 	      touristPaging.setPageBlock(3);
 	      touristPaging.setPageSize(6);
 	      touristPaging.setTotalA(totalA);
 	      touristPaging.setDeptno(deptno);
 	      touristPaging.makePagingHTML();
 	      
 	      String sql="select deptno,dname from restaurant ";
 	      ResultSet rs=stmt.executeQuery(sql);
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
<link rel="stylesheet" href="../css/pagingList.css">
<style type="text/css">

#iscate{
	color: #FF7100;
}
.tourist_click_button:hover{
cursor: pointer;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".tourist_click_button").click(function(){
		location.href="restaurant_spot.jsp?tunq="+$(this).attr("id");
	});
	
});

</script>
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
<div class="tourist_div1">제주의 전통음식부터 다양한 음식의 천국 제주도</div>
<br><br>
<div class="tourist_div2">
여행의 즐거움 중 빼놓을 수 없는 것은 단연 음식이다. 제주도는 흑돼지, 말요리 그리고 해산물 등 다양한 음식문화를 접할 수 있다. 
제주도의 전통 음식부터 줄을 서서 기다리는 최고 인기의 음식까지 모두 즐겨보자.


</div>
<br><br>


<table class="tourist_table1" >
<tr>
<th bgcolor="#ff7f00" rowspan="2"><a style="color:#ffffff;" href ="?deptno=">전체</a></th>
<%
String title="전체";
int count=0;
while(rs.next()){
	if(deptno.equals(rs.getString("deptno"))){
		%>
		<th><a id="iscate" href="restaurant.jsp?deptno=<%=rs.getString("deptno") %>"><%=rs.getString("dname") %></a></th>
		
		<% 
		title=rs.getString("dname");
	}else{
		%>
		<th><a href="restaurant.jsp?deptno=<%=rs.getString("deptno") %>"><%=rs.getString("dname") %></a></th>
		<%
	}
	count++;
	if(count%4==0){
		%>
		</tr>
		<%
	}
}

while(count%4!=0){
	%>
	<th></th>
	<%
	count++;
}

%>




</table>

<br><br><br>

<h3 align="left"><%=title %></h3>

<div class="tourist_list">
<ul>
<% 
int cnt=0;
String classn="";
ResultSet rs2;
if(deptno==null || deptno.equals("")||deptno.equals("null")){
		rs2=stmt.executeQuery("select * from(select rownum rn ,t.* from(select * from restaurant_spot order by unq desc)t) where rn>='"+startNum+"' and rn<='"+endNum+"'");
}else{
	    rs2=stmt.executeQuery("select * from(select rownum rn ,t.* from(select * from restaurant_spot where deptno='"+deptno+"' order by unq desc)t) where rn>='"+startNum+"' and rn<='"+endNum+"'");
}
while(rs2.next()){
	
	
	String unq=rs2.getString("unq");
	String image=rs2.getString("image");
	String jjim=rs2.getString("jjim");
	String review=rs2.getString("review");
	String back=rs2.getString("back");
	String hit=rs2.getString("hit");
	String hashtag=rs2.getString("hashtag");
	String deptnoo=rs2.getString("deptno");
	String name=rs2.getString("name");
	String addr=rs2.getString("addr");
	String addr2=rs2.getString("addr2");
	Statement stmt2=conn.createStatement();
	String deptname=""; 
	ResultSet rs10=stmt2.executeQuery("select * from restaurant where deptno='"+deptnoo+"'");
	rs10.next();
	deptname=rs10.getString("dname");
	/*리뷰개수  */
	ResultSet rs5= stmt2.executeQuery("select count(*) as cnt from restaurant_review where pid="+unq+"");
	rs5.next();
	String rcount=rs5.getString("cnt");
	
	ResultSet rs6= stmt2.executeQuery("select count(*) cnt from mylist where like_spot="+unq+" and type=2");
	rs6.next();
	String like1 =rs6.getString("cnt");
	ResultSet rs7= stmt2.executeQuery("select count(*) cnt from mylist where jjim_spot="+unq+" and type=2");
	rs7.next();
	String jjim1 =rs7.getString("cnt");
	
	cnt++;
	if(cnt==4)cnt=1;
	if(cnt==1){
		classn="tourist_table2_l";
	}
	if(cnt==2){
		classn="tourist_table2_c";
	}
	if(cnt==3){
		classn="tourist_table2_r";
	}
	
	%>

<li>
<div>

<form name="frm" method="post" action="">
<table class="<%=classn%> tourist_click_button" id="<%=unq %>" >
<tr>
<td class="tourist_td1" colspan="3" >
	<div class="t_img">
	<a><img alt="" src="../touristImage/<%=image%>" width="100%" height="100%"> </a>
	<div class="t_tag">음식점</div>
	</div>
</td>
</tr>

<tr>
<th colspan="3" style=""><%=name%></th>
</tr>

<tr>
<th colspan="3"><%=deptname %>><%=addr2%></th>
</tr>

<tr>
<th height="10px" colspan="3"style="color: #FF7100;"><%=hashtag%></th>

</tr>

<tr>
<td class="tourist_td2">
<img class=src1 src="../image/like.png"><br>
<button type="button" class="tourist_button1"style="color: black;">좋아요<br><%=like1%></button>
</td>

<td class="tourist_td2">
<img class=src1 src="../image/zzim.png"><br>
<button type="button" class="tourist_button1" style="color: black;">찜하기<br><%=jjim1%></button>
</td>

<td class="tourist_td2">
<img class=src1 src="../image/review.png"><br>
<button type="button" class="tourist_button1"style="color: black;">리뷰<br><%=rcount%></button>
</td>

</tr>

</table>
</form>
</div>
</li>
<%
}

%>

</ul>

</div>
<!--list end  -->
</div>
<div><br><br><%=touristPaging.getPagingHTML() %></div>
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
			
			