<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="../include/dbcon2.jsp" %>
<%
Statement stmt2=conn.createStatement();
Statement stmt3=conn.createStatement();
ResultSet rs = stmt.executeQuery("select * from tourist_spot where rownum <5");
ResultSet rs2 = stmt2.executeQuery("select * from restaurant_spot where rownum <5");
ResultSet rs3 = stmt3.executeQuery("select * from shopping_spot where rownum <5");



%>
<!DOCTYPE html>
<html lang="en">
<!-- Start Head -->
<head>
	

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Aperitif - Custom Template</title>
 	 
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

<body class="default" style="width: 100%;margin: 0;">

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

<!--
START MODULE AREA 3: Hero 1
-->
<section >
 <jsp:include page="slider.jsp" />
</section>
<!--
END MODULE AREA 3: Hero 1
-->

<!--
START MODULE AREA 4: Lightbox
-->
<section>
  <div data-layout="_r">
    <div data-layout="al16">
      <h1 style="color:#ef6d00;">제주관광 명소</h1>
    </div>
  </div>
</section>
<section class="MOD_FEATURE">
  <div data-layout="_r">
  <%while(rs.next()){ 
	String unq = rs.getString("unq");
  	String image = rs.getString("image");
  	String name = rs.getString("name");
  	String hashtag = rs.getString("hashtag");
  	
  %>
    <div data-layout="ch8 ec4">
      <a href="../tourist/tourist_spot.jsp?tunq=<%=unq %>" class="MOD_FEATURE_Container" style="border: 2px solid #ef6d00;">
        <img class="MOD_FEATURE_Picture" style="height: 200px;" src="../touristImage/<%=image %>" alt="">
        <div class="MOD_FEATURE_TextContainer">
          <p class="MOD_FEATURE_Title" style="text-align:center; color: #1b1b1b;font-size: 20px;" data-theme="_ts2"><%=name %></p>
          <p class="MOD_FEATURE_Description" style="text-align:center; color:#ef6d00; font-size: 12px;"> <%=hashtag %> </p>
        </div>
      </a>
    </div>
    <%} %>
  </div>
</section>
<br><br><br>
<div style="width:80%; margin: 0 auto;"><iframe width="100%" height="538" src="https://www.youtube.com/embed/r_4i13-IIR0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>
<!--
END MODULE AREA 4: Lightbox
-->
<br><br><br>
<section>
  <div data-layout="_r">
    <div data-layout="al16">
      <h1 style="color:#BDBDBD;">제주 맛집</h1>
    </div>
  </div>
</section>
<section class="MOD_FEATURE">
  <div data-layout="_r">
  <%while(rs2.next()){ 
	String unq = rs2.getString("unq");
  	String image = rs2.getString("image");
  	String name = rs2.getString("name");
  	String hashtag = rs2.getString("hashtag");
  	
  %>
    <div data-layout="ch8 ec4">
      <a href="../restaurant/restaurant_spot.jsp?tunq=<%=unq %>" class="MOD_FEATURE_Container" style="border: 2px solid #BDBDBD;">
        <img class="MOD_FEATURE_Picture" style="height: 200px;" src="../touristImage/<%=image %>" alt="">
        <div class="MOD_FEATURE_TextContainer">
          <p class="MOD_FEATURE_Title" style="text-align:center; color: #1b1b1b;font-size: 20px;" data-theme="_ts2"><%=name %></p>
          <p class="MOD_FEATURE_Description" style="text-align:center; color:#ef6d00; font-size: 12px;"> <%=hashtag %> </p>
        </div>
      </a>
    </div>
    <%} %>
  </div>
</section>
<!--
START MODULE AREA 5: Footer 1
-->

<section>
  <div data-layout="_r">
    <div data-layout="al16">
      <h1 style="color:#FFA7A7;">제주 쇼핑</h1>
    </div>
  </div>
</section>
<section class="MOD_FEATURE">
  <div data-layout="_r">
  <%while(rs3.next()){ 
	String unq = rs3.getString("unq");
  	String image = rs3.getString("image");
  	String name = rs3.getString("name");
  	String hashtag = rs3.getString("hashtag");
  	
  %>
    <div data-layout="ch8 ec4">
      <a href="../shopping/shopping_spot.jsp?tunq=<%=unq %>" class="MOD_FEATURE_Container" style="border: 2px solid #FFA7A7;">
        <img class="MOD_FEATURE_Picture" style="height: 200px;" src="../touristImage/<%=image %>" alt="">
        <div class="MOD_FEATURE_TextContainer">
          <p class="MOD_FEATURE_Title" style="text-align:center; color: #1b1b1b;font-size: 20px;" data-theme="_ts2"><%=name %></p>
          <p class="MOD_FEATURE_Description" style="text-align:center; color:#ef6d00; font-size: 12px;"> <%=hashtag %> </p>
        </div>
      </a>
    </div>
    <%} %>
  </div>
</section>
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
			
			