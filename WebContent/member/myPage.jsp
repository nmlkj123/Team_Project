<%@page import="mylist.mylistjjimPaging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/dbcon2.jsp" %>
<%

String memId =(String)session.getAttribute("memId");//로그인시에만 마이페이지이용가능

if(memId == null || "".equals(memId)){

%> 

<script>
alert("로그인 해주세요.");
location="../member/login.jsp";
</script>
<%
return;
}
String pg =request.getParameter("pg");
 String deptno =request.getParameter("deptno");
 if(pg==null || pg.equals("")){
	   pg="1";
 }
 ResultSet rs1=stmt.executeQuery("select image from member where userid='"+memId+"'");
 rs1.next();
 String uimage=rs1.getString("image");

 ResultSet rs3=stmt.executeQuery("select count(*) as total from mylist where userid='"+memId+"' and jjim_spot>0");
 rs3.next();
 int endNum=Integer.parseInt(pg)*6;
 int startNum=endNum-5;
 int totalA=rs3.getInt("total");
 mylistjjimPaging touristPaging=new mylistjjimPaging(); 
  touristPaging.setCurrentPage(Integer.parseInt(pg));
  touristPaging.setPageBlock(3);
  touristPaging.setPageSize(6);
  touristPaging.setTotalA(totalA);
  touristPaging.setDeptno(deptno);
  touristPaging.makePagingHTML(); 
  ResultSet rs4=stmt.executeQuery("select count(*) as total from mylist where userid='"+memId+"' and like_spot>0");
  rs4.next();
  int totalB=rs4.getInt("total");
  ResultSet rs2 =stmt.executeQuery("select * from(select rownum rn ,t.* from(select * from mylist where userid='"+memId+"' and jjim_spot>0 )t) where rn>='"+startNum+"' and rn<='"+endNum+"'");

  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 좋아요리스트</title>
</head>
<%@include file="../template/top.jsp" %>
<link rel="stylesheet" href="../assets/css/style.min.css">
<link rel="stylesheet" href="../assets/css/modules.css">
<link rel="stylesheet" href="../css/myPage.css">
<link rel="stylesheet" href="../css/pagingList.css">
<script type="text/javascript">
function profilem() {
	location.href="../member/memberModify.jsp";
}

</script>
<body>
<!-- 마이페 -->
 <div class="container">
  <div class="content">
   <div class="profile_zone">
     
     <!-- 프로필내부요소 -->
     <div class="photo_zone">
      <div class="photo">
		<img src="../memberfiles/<%=uimage%>"><!-- image랑 연결 -->	
      </div>
      </div>   
     <div class="name_zone">
      <span class="user_name"><%=memId %></span>
      <span>님의 제주여행</span>
     </div>
     <div class="list_zone">
      <div class="list">
      <dl>
       <dt><a href="myPage.jsp?viewPage=1">나의 찜한 여행지</a></dt> <!-- 링크연결 -->
       <dd><%=totalA %></dd> <!-- select count(*) cnt1 from tour_jjim_list
       				 where userid='"+sessionId+"' -->
      </dl>
      
      <dl>
       <dt><a href="myPage2.jsp?viewPage=1">나의 좋아요 여행지</a></dt> <!-- 링크연결 -->
       <dd><%=totalB %></dd> <!-- select count(*) cnt2 from tour_like_list
       				 where userid='"+sessionId+"' -->
      </dl>
      
      </div>
      <button onclick="profilem();" >프로필수정</button>
     </div>
   
   </div>
   <!-- 목록출력 -->
   <div class="item_zone">
   <h3>&nbsp;나의 찜한 여행지(<%=totalA %>)</h3><!-- cnt1 연결 -->
    <table class="items">
     <tr>
     <%
     int no =1;
     while(rs2.next()) {
    	 String name2  = rs2.getString("name");
    	 String dname = rs2.getString("dname");
    	 String addr = rs2.getString("addr");
    	 String image = rs2.getString("image");
    	 int type =  rs2.getInt("type");
    	 String unq = rs2.getString("jjim_spot");
    	 if(no==4) out.print("</tr> <tr>"); 
	 %>
	      <td>
	      <% 
	      	 if(type==1){
	      		%><a href="../tourist/tourist_spot.jsp?tunq=<%=unq %>"><% 
	      	 }
	      	if(type==2){
	      		%><a href="../restaurant/restaurant_spot.jsp?tunq=<%=unq %>"><% 
	      	 }
	      	if(type==3){
	      		%><a href="../shopping/shopping_spot.jsp?tunq=<%=unq %>"><% 
	      	 }
	      	%>
	      	
	        <div class="listBox">
	      	 <img src="../touristImage/<%=image %>">
	      	 <% 
	      	 if(type==1){
	      		%><span>관광지</span><% 
	      	 }
	      	if(type==2){
	      		%><span>맛집</span><% 
	      	 }
	      	if(type==3){
	      		%><span>쇼핑</span><% 
	      	 }
	      	%>
	      	 
	      	 <p class="title"><%=name2 %></p>
	      	 <p class="cate"><%=dname %>><%=addr %></p>
	      	</div>
	      	</a>
	      </td>
	 <%
	 	no++;
     }
     %>
      </tr>
    </table>
   </div>
	<p class="paging_zone" align="center">
   	<%=touristPaging.getPagingHTML() %>
   	</p>
  
  </div>
 </div>
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>