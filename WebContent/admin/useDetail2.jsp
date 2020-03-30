<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@include file="../include/dbcon2.jsp" %>
    <%
    String unq=request.getParameter("unq"); //unq받기
    ResultSet rs6 = stmt.executeQuery("select count(*) as cnt from restaurant_use where pid="+unq+"");
    rs6.next();
    int cnt = rs6.getInt("cnt");
    if(cnt==0){
    	%>
    	<script>
    		alert("이용정보를 추가하세요");
    		history.back();
    	</script>
    	<% 
    	return;
    }
    String sql= "select a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11 "; 
    sql+=" from restaurant_use ";//sql작성
     	sql+=	"where pid='"+unq+"' ";

    
    

    	ResultSet rs=stmt.executeQuery(sql); //sql적용
		rs.next();
		String a1 = rs.getString("a1");
		String a2 = rs.getString("a2");
		String a3 = rs.getString("a3");
		String a4 = rs.getString("a4");
		String a5 = rs.getString("a5");
		String a6 = rs.getString("a6");
		String a7 = rs.getString("a7");
		String a8 = rs.getString("a8");
		String a9 = rs.getString("a9");
		String a10 = rs.getString("a10");
		String a11 = rs.getString("a11");
		
	
		
		String empty="";
	    if(a1==null){
	    	a1=empty;
	    }
		
	    if(a2==null){
	    	a2=empty;
	    }
	    if(a3==null){
	    	a3=empty;
	    }
	    if(a4==null){
	    	a4=empty;
	    }
	    if(a5==null){
	    	a5=empty;
	    }
	    if(a6==null){
	    	a6=empty;
	    }
	    if(a7==null){
	    	a7=empty;
	    }
	    if(a8==null){
	    	a8=empty;
	    }
	    if(a9==null){
	    	a9=empty;
	    }
	    if(a10==null){
	    	a10=empty;
	    }
	    if(a11==null){
	    	a11=empty;
	    }
	    
	    
	
   %>
    
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광지</title>
</head>



<style>
table.tb{
width:1000px;
height:600px;
font-size:15px;
margin-left:10px;
padding:5px;
line-height:25px;
margin-top:40px;
font-family:맑은 고딕;
letter-spacing:1px;

}

td {
font-size:20px;
border-bottom:1px solid gray;
margin-left:20px;
height:30px;
}
.h2{
margin-left:20px;
margin-top:30px;
}
</style>

 <script>
   function fn_delete(){
    	
    	if(confirm("정말로 지우시겠습니까?")){
    	location ="useDelete2.jsp?unq=<%=unq %>";
    }
    </script>
    
<body>
	<h2 class="h2">이용안내</h2>
	<table  class="tb" cellspacing="0" border="0" >
	
	
			<tr>
			
			<td width="30%";>소개</td>
			<td><%=a1 %></td>
				
			</tr>
			
			
			<tr>
			
			<td>상세정보</td>
			<td><%=a2 %></td>
				
			</tr>
			
			
			<tr>
			
			<td>이용시간</td>
			<td><%=a3 %></td>
				
			</tr>
			
			
			<tr>
			
			<td>요금정보</td>
			<td><%=a4 %></td>
				
			</tr>
			
			
			<tr>
			
			<td>장소특성</td>
			<td><%=a5 %></td>
				
			</tr>
			
			
			<tr>
			
			<td>주요목적</td>
			<td><%=a6 %></td>
				
			</tr>
			
			
			<tr>
			
			<td>주요목적기타</td>
			<td><%=a7 %></td>
				
			</tr>
			
			
			<tr>
			
			<td>경사도(난이도)</td>
			<td><%=a8 %></td>
				
			</tr>
			
			
			<tr>
			
			<td>편의시설</td>
			<td><%=a9 %></td>
				
			</tr>
			
			<tr>
			
			<td>기타상세</td>
			<td><%=a10 %></td>
				
			</tr>

        </table>
        
        <div>
        	<input type="button" value="수정"
        	onclick="location='useModify2.jsp?unq=<%=unq%>'">

       </div>
  </body>
</html>