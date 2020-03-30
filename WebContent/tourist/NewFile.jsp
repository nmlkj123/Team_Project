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
  <div data-layout="_r" style="height: 200px;">
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
    int pageing = 10;
    String viewPage = request.getParameter("viewPage");
    if(viewPage == null || "".equals(viewPage)) {
    	viewPage = "1";
    }

    int vpage = Integer.parseInt(viewPage); 

    String q=request.getParameter("q");
    String totSql="select count(*) total from tourist_spot "
    	  		+ "where name like '%"+q+"%' " 
    	 	    + "or addr2 like '%"+q+"%' "
    			+ "or  tel like '%"+q+"%' ";
    ResultSet totRs=stmt.executeQuery(totSql);
    totRs.next();
    int total=totRs.getInt("total");

    /* 페이징의 범위의 마지막 페이지번호 
     * ceil(1.2) -> (int) 2.0  */
    int lastPage =  (int)Math.ceil((double)total/unit);

    // viewPage  (1~10) -> 1 , (11~20) -> 11 , (21~30) -> 21 
    // if(7)  ->  7-1/10 -> floor(0.6) -> 0*10 + 1 -> 1
    // if(12) -> 12-1/10 -> floor(1.1) -> 1*10 + 1 -> 11
    // if(23) -> 23-1/10 -> floor(2.2) -> 2*10 + 1 -> 21
    int range1 = (int)(Math.floor((double)(vpage-1)/pageing))*pageing + 1;
    int range2 = range1 + (pageing-1);
    if(range2 > lastPage) range2 = lastPage;

    String viewBef="";
    if(range1 > pageing) {
    	int before = range1 - pageing;
    	viewBef="<a href='search.jsp?viewPage="+before+"'>[이전]</a>";
    } else {
    	viewBef="[이전]";
    }
    String viewNex="";
    if(range2<lastPage) {
    	int next = range2+1;
    	viewNex="<a href='goodsList.jsp?viewPage="+next+"'>[다음]</a>";
    } else {
    	viewNex="[다음]";
    }
    
    int startIdx = (vpage-1)*unit + 1; 

    /* 테이블 출력 끝 번호
     * lastIdx => startIdx + 9; */
   int lastIdx = startIdx + (unit-1);

   // 행-시작번호
   int rownumber = total - (startIdx-1);

   // 마지막 페이지 번호
   int lastPageNo = lastPage; 
    
    String sql="select b.* from(select rownum rn, a.* from( "
    		  + "select unq,name,addr,addr2,tel,image from tourist_spot "
    		  +" where unq like '%"+q+"%' "
    		  +" or name like '%"+q+"%' "
  	 	      + "or addr2 like '%"+q+"%' "
  			  + "or  tel like '%"+q+"%' "
			  + "or  image like '%"+q+"%' )a )b " 
    		  + " where rn >= "+startIdx+" and rn <= "+lastIdx;
    ResultSet rs=stmt.executeQuery(sql);
   
    
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
tb1.td{
margin-top:0px;
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
  </style>


   <form  method="get" action="search.jsp">
   <input type="text" name="q" value="<%=q%>">
  <button type="submit" >검색</button>
   
     
       

<br><br>
<hr>
 '<%=q %>'검색결과(<%=total %>)건
 <br><br><br>
 
    
        <table class="tb1">
        <tr valign="top">
      <%
      int count =0;
      while( rs.next() ) {
    	  	String unq = rs.getString("unq");
    	  	String name = rs.getString("name");
    	  	String image = rs.getString("image");
    	  	String addr2  = rs.getString("addr2");
    	  	String tel = rs.getString("tel");
      %>
      		<td style="padding:30px; ">
      			<div class="div3">
      			
      <a href="../tourist/tourist_spot.jsp?tunq=<%=unq %>">
      <img src="../touristImage/<%=image %>" width="260" height="190"></a><br>
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
      
    
      <div class="paging">
 <%=viewBef %>
	
	<%
	for(int i=range1; i<=range2; i++) {
	%>
		<a href="search.jsp?q=<%=q %>&viewPage=<%=i %>"><%=i %></a>    
	<%
	}
	%>
	
	<%=viewNex %>
	
	<a href="search.jsp?q=<%=q %>&viewPage=<%=lastPage %>">[마지막 페이지]</a>
	</div>
 	    
 
 </form>
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