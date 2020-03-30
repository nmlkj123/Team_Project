<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<!-- Start Head -->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Aperitif - Custom Template</title>
 	 
	<link rel="stylesheet" href="../assets/css/style.min.css">
	<link rel="stylesheet" href="../assets/css/modules.css">
	<link rel="stylesheet" href="../css/orangebutton.css">

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

<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>



</head>
<!-- End Head -->
<link rel="stylesheet" href="../css/touristDetail.css">

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
  <div data-layout="_r" style="height: 100px;">
    <div data-layout="al16">
      
    </div>
  </div>
</section>
<!--
  END MODULE AREA 2: Page Title 1
-->
<!-- 메인 -->
<%@include file ="../include/dbcon2.jsp" %>
    <%
    int unit =3;

    int vpage = 1; 

    String q=request.getParameter("q");
    String totSql="select count(*) total from tourist_spot "
    	  		+ "where name like '%"+q+"%' " 
    	 	    + "or addr2 like '%"+q+"%' "
    	 	    + "or hashtag like '%"+q+"%' "
    			+ "or  tel like '%"+q+"%' ";
    ResultSet totRs=stmt.executeQuery(totSql);
    totRs.next();
    int total1=totRs.getInt("total");
    int totalPage1=(int)Math.ceil((double)total1/unit); 
  	//1(viewPage)->1 2->11 3->21
  	int startNo1=(vpage-1)*unit+1;
  	int endNo1=startNo1+(unit-1);
    String sql="select b.* from(select rownum rn, a.* from( "
    		  + "select unq,name,addr,addr2,tel,image from tourist_spot "
    		  +" where unq like '%"+q+"%' "
    		  +" or name like '%"+q+"%' "
  	 	      + "or addr2 like '%"+q+"%' "
  	 	      + "or hashtag like '%"+q+"%' "
  			  + "or  tel like '%"+q+"%' )a )b " 
    		  + " where rn >= "+startNo1+" and rn <= "+endNo1;
    ResultSet rs=stmt.executeQuery(sql);
   
    
    %> 
    <!--맛집  -->
<%


    String totSql2="select count(*) total from restaurant_spot "
    	  		+ "where name like '%"+q+"%' " 
    	 	    + "or addr2 like '%"+q+"%' "
    	 	    + "or hashtag like '%"+q+"%' "
    			+ "or  tel like '%"+q+"%' ";
	Statement stmt2=conn.createStatement();
    ResultSet totRs2=stmt2.executeQuery(totSql2);
    totRs2.next();
    int total2=totRs2.getInt("total");
    int totalPage2=(int)Math.ceil((double)total2/unit); 
  	//1(viewPage)->1 2->11 3->21
  	int startNo2=(vpage-1)*unit+1;
  	int endNo2=startNo2+(unit-1);
    String sql2="select b.* from(select rownum rn, a.* from( "
    		  + "select unq,name,addr,addr2,tel,image from restaurant_spot "
    		  +" where unq like '%"+q+"%' "
    		  +" or name like '%"+q+"%' "
  	 	      + "or addr2 like '%"+q+"%' "
  	 	      + "or hashtag like '%"+q+"%' "
  			  + "or  tel like '%"+q+"%' )a )b " 
    		  + " where rn >= "+startNo2+" and rn <= "+endNo2;
    ResultSet rs2=stmt2.executeQuery(sql2);
   
    
    %> 
    <!-- 쇼핑 -->
<%


    String totSql3="select count(*) total from shopping_spot "
    	  		+ "where name like '%"+q+"%' " 
    	 	    + "or addr2 like '%"+q+"%' "
    	 	    + "or hashtag like '%"+q+"%' "
    			+ "or  tel like '%"+q+"%' ";
	Statement stmt3=conn.createStatement();
    ResultSet totRs3=stmt3.executeQuery(totSql3);
    totRs3.next();
    int total3=totRs3.getInt("total");
    int totalPage3=(int)Math.ceil((double)total3/unit); 
  	//1(viewPage)->1 2->11 3->21
  	int startNo3=(vpage-1)*unit+1;
  	int endNo3=startNo3+(unit-1);
    String sql3="select b.* from(select rownum rn, a.* from( "
    		  + "select unq,name,addr,addr2,tel,image from shopping_spot "
    		  +" where unq like '%"+q+"%' "
    		  +" or name like '%"+q+"%' "
  	 	      + "or addr2 like '%"+q+"%' "
  	 	      + "or hashtag like '%"+q+"%' "
  			  + "or  tel like '%"+q+"%' )a )b " 
    		  + " where rn >= "+startNo3+" and rn <= "+endNo3;
    ResultSet rs3=stmt3.executeQuery(sql3);
   
    
    %>
  <style>
.div1{

  float:left;
  margin-right:30px;
  }
.s_tit{
   
    margin: 20px auto 0;
    font-size: 18px;
    color: #1b1b1b;
    line-height: 20px;
    font-family:맑은고딕;
  
  }
  .s_theme{
    margin-top:9px;
    color: #8a8b8b;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    padding: 0 10px;
    font-size: 14px;
    font-weight: 400;
    line-height: 14px;
  
  }
table.tb1{

border:1px solid #fff;


}

btn{
height:20px;
width:30px;
}

.div3{
box-shadow: 3px 3px 3px 3px gray;
text-align:center;

}
.paging{
clear : both;
padding-left:40%;
padding-top:50px;

}
.searchp{
border-bottom:1px solid #e5e5e5; 
line-height: 22px;
margin-top:20px; 
font-size: 22px;
font-weight: 800;
color: #1b1b1b;
line-height: 22px;
padding: 0 0 10px 20px;
margin-bottom: 20px;
margin-top:60px;
background: url('../image/ico_arr_right2.jpg') no-repeat 0 5px;
}
.keyword{
 
line-height: 22px;
margin-top:20px; 
font-size: 28px;
font-weight: 800;
color: #ff7100;
line-height: 22px;

margin-bottom: 20px;
margin-top:60px;

}
.keyword2{

line-height: 22px;
margin-top:20px; 
font-size: 28px;
font-weight: 800;
color: #1b1b1b;
line-height: 22px;
margin-bottom: 20px;
margin-top:60px;

}
.searchspan{
margin-left: 0;
color: #ef6d00;
}
  </style>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
viewpage1= <%=vpage%>;
total1=<%=total1%>;
totalPage1=<%=totalPage1%>;

viewpage2= <%=vpage%>;
total2=<%=total2%>;
totalPage2=<%=totalPage2%>;

viewpage3= <%=vpage%>;
total3=<%=total3%>;
totalPage3=<%=totalPage3%>;
$(document).ready(function(){
	
	if(viewpage1==totalPage1){
		$(".a1").empty();
	}
	if(totalPage1==0){
		$(".a1").empty();
	}
	if(viewpage2==totalPage2){
		$(".a2").empty();
	}
	if(totalPage2==0){
		$(".a2").empty();
	}
	if(viewpage3==totalPage3){
		$(".a3").empty();
	}
	if(totalPage3==0){
		
		$(".a3").empty();
	}
	$(".plus_btn1").click(function(){
		viewpage1=viewpage1+1;
		
		$.ajax({
			type:'POST',
			url:'stourist.jsp?q=<%=q%> &total='+total1+'&viewPage='+viewpage1,
			dataType:'html',
			error:function(){
				alert("실패");
			},
			success:function(data){
				$(".tb1").append(data);
				if(viewpage1==totalPage1){
					$(".a1").empty();
				}
			}
		});
	});
		
		
	$(".plus_btn2").click(function(){
		viewpage2=viewpage2+1;
		
		$.ajax({
			type:'POST',
			url:'srestaurant.jsp?q=<%=q%> &total='+total2+'&viewPage='+viewpage2,
			dataType:'html',
			error:function(){
				alert("실패");
			},
			success:function(data){
				$(".tb2").append(data);
				if(viewpage2==totalPage2){
					$(".a2").empty();
				}
			}
		});
		
	});
	
	
	$(".plus_btn3").click(function(){
		viewpage3=viewpage3+1;
		
		$.ajax({
			type:'POST',
			url:'sshopping.jsp?q=<%=q%> &total='+total3+'&viewPage='+viewpage3,
			dataType:'html',
			error:function(){
				alert("실패");
			},
			success:function(data){
				$(".tb3").append(data);
				if(viewpage3==totalPage3){
					$(".a3").empty();
				}
			}
		});
		
	});
	
});
</script>
<div style="width: 100%;">
<div style="width: 60%;  margin: 0 auto;">
  <p class="keyword">우도<span class="keyword2">검색결과</span></span></p>
   
     
       


 	 <p class="searchp">관광지<span style="margin-left: 12px;font-size: 18px;font-weight: 400;">검색결과<span class="searchspan"><%=total1 %></span>건</span></span></p>

 
    
        <table class="tb1" style="margin: auto;">
        <tr >
      <%
      int count =0;
      while( rs.next() ) {
    	  	String unq = rs.getString("unq");
    	  	String name = rs.getString("name");
    	  	String image = rs.getString("image");
    	  	String addr2  = rs.getString("addr2");
    	  	String tel = rs.getString("tel");
      %>
      		<td  style=" width:33%; padding:20px;margin: 0px ">
      			<div class="div3">
      			
      <a href="../tourist/tourist_spot.jsp?tunq=<%=unq %>">
      <img src="../touristImage/<%=image %>" width="100%" height="190"></a><br>
      			<p class="s_tit"><%=name%></p>
      			<p class="s_theme">주소><%=addr2 %></p>
      			<p class="s_theme">연락처><%=tel %></p>
      			</div>
      		</td>
    
      <%
      		if(count%3==2) {
      			%>
      			</tr><tr>
	<%      
		}
   
     	count++;
     	
      
      }
      %>
     
      
       </tr>
       </table>
       
       
       <% 
      if(count == 0) {
    	  
    	  out.print("<div>검색결과가 없습니다.</div>");
    	  
      }
  
      %>
      
    
   <div class="a1" style="width: 100%;  text-align: center;" >
		 
  	<a href="javascript:void(0);" class="btn-gradient red block plus_btn1">더보기</a>
	</div>
	<!--맛집  -->
 	 <p class="searchp">맛집<span style="margin-left: 12px;font-size: 18px;font-weight: 400;">검색결과<span class="searchspan"><%=total2 %></span>건</span></span></p>
 <br>
 
    
        <table class="tb2" style="margin: auto;">
        <tr >
      <%
      int count2 =0;
      while( rs2.next() ) {
    	  	String unq = rs2.getString("unq");
    	  	String name = rs2.getString("name");
    	  	String image = rs2.getString("image");
    	  	String addr2  = rs2.getString("addr2");
    	  	String tel = rs2.getString("tel");
      %>
      		<td style=" width:33%; padding:20px; margin: 0px; ">
      			<div class="div3">
      			
      <a href="../restaurant/restaurant_spot.jsp?tunq=<%=unq %>">
      <img src="../touristImage/<%=image %>" width="100%" height="190"></a><br>
      			<p class="s_tit"><%=name%></p>
      			<p class="s_theme">주소><%=addr2 %></p>
      			<p class="s_theme">연락처><%=tel %></p>
      			</div>
      		</td>
    
      <%
      		if(count2%3==2) {
      			%>
      			</tr><tr>
	<%      
		}
   
     	count2++;
     	
      
      }
      %>
     
      
       </tr>
       </table>
       
       
       <% 
      if(count2 == 0) {
    	  
    	  out.print("<div>검색결과가 없습니다.</div>");
    	  
      }
  
      %>
      
    
   <div class="a2" style="width: 100%; text-align: center;" >
	<a href="javascript:void(0);" class="btn-gradient red block plus_btn2">더보기</a>
      			 
  
	</div> 
	<!--쇼핑  -->
 	 <p class="searchp">쇼핑<span style="margin-left: 12px;font-size: 18px;font-weight: 400;">검색결과<span class="searchspan"><%=total3 %></span>건</span></span></p>
 <br>
 
    
        <table class="tb3"  style="margin: auto;">
        <tr >
      <%
      int count3 =0;
      while( rs3.next() ) {
    	  	String unq = rs3.getString("unq");
    	  	String name = rs3.getString("name");
    	  	String image = rs3.getString("image");
    	  	String addr2  = rs3.getString("addr2");
    	  	String tel = rs3.getString("tel");
      %>
      		<td style=" width:33%; padding:20px; margin: 0px;">
      			<div class="div3">
      			
      <a href="../shopping/shopping_spot.jsp?tunq=<%=unq %>">
      <img src="../touristImage/<%=image %>" width="100%;" height="190"></a><br>
      			<p class="s_tit"><%=name%></p>
      			<p class="s_theme">주소><%=addr2 %></p>
      			<p class="s_theme">연락처><%=tel %></p>
      			</div>
      		</td>
    
      <%
      		if(count2%3==2) {
      			%>
      			</tr><tr>
	<%      
		}
   
     	count2++;
     	
      
      }
      %>
     
      
       </tr>
       </table>
       
       
       <% 
      if(count2 == 0) {
    	  
    	  out.print("<div>검색결과가 없습니다.</div>");
    	  
      }
  
      %>
      
    
   <div class="a3" style="width: 100%; text-align: center;" >
	<a href="javascript:void(0);" class="btn-gradient red block plus_btn3">더보기</a>
      			 
  
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
</body>

</html>