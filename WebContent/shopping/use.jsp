<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@include file="../include/dbcon2.jsp" %>
    <%
    String unq=request.getParameter("unq"); //unq받기

    ResultSet rs3=stmt.executeQuery("select count(*) as cnt from tourist_use where pid="+unq+"");
    rs3.next();
    int cnt=rs3.getInt("cnt");
    if(cnt==0){
    	%>
    	<p>콘텐츠를 등록해주세요</p>
    	<%
    	return;
    }
    String sql= "select a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11 "; 
    sql+=" from tourist_use ";//sql작성
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



<style>
.tb{
width:80%;
height:600px;
font-size:15px;
margin:auto;
padding:5px;
line-height:25px;
border-collapse:collapse;
font-family:맑은 고딕;
letter-spacing:1px;
}
.tb tr{
border-bottom: 1px solid #e2e2e2;
}

.tdst {
    padding-top: 6px;
    padding-left: 22px;
    font-size: 18px;
    font-weight: 800;
    color: #8c8c8c;
    line-height: 26px;
    text-align: left;
    vertical-align: middle;
    background: url('../image/summary_dot.png') no-repeat 0 50%;
}
.tdst2 {
    padding: 6px 0;
    font-size: 18px;
    color: #333;
    line-height: 26px;
    text-align: left;
}
.h2{
	margin-left:100px;
	text-align:left;
    font-size: 24px;
    font-weight: 800;
    color: #1b1b1b;
    line-height: 24px;
}
</style>

 <script>
   function fn_delete(){
    	
    	if(confirm("정말로 지우시겠습니까?")){
    	location ="useDelete.jsp?unq=<%=unq %>";
    }
    </script>
    

	<h2 class="h2">이용안내</h2>
	<table  class="tb" cellspacing="0" border="0" >
		
	
			<tr >
			
			<td class="tdst" width="30%";>소개</td>
			<td class="tdst2"><%=a1 %></td>
				
			</tr>
			
			
			<tr>
			
			<td class="tdst">상세정보</td>
			<td class="tdst2"><%=a2 %></td>
				
			</tr>
			
			
			<tr>
			
			<td class="tdst">이용시간</td>
			<td class="tdst2"><%=a3 %></td>
				
			</tr>
			
			
			<tr>
			
			<td class="tdst">요금정보</td>
			<td class="tdst2"><%=a4 %></td>
				
			</tr>
			
			
			<tr>
			
			<td class="tdst">장소특성</td>
			<td class="tdst2"><%=a5 %></td>
				
			</tr>
			
			
			<tr>
			
			<td class="tdst">주요목적</td>
			<td class="tdst2"><%=a6 %></td>
				
			</tr>
			
			
			<tr>
			
			<td class="tdst">주요목적기타</td>
			<td class="tdst2"><%=a7 %></td>
				
			</tr>
			
			
			<tr>
			
			<td class="tdst">경사도(난이도)</td>
			<td class="tdst2"><%=a8 %></td>
				
			</tr>
			
			
			<tr>
			
			<td class="tdst">편의시설</td>
			<td class="tdst2"><%=a9 %></td>
				
			</tr>
			
			<tr>
			
			<td class="tdst">기타상세</td>
			<td class="tdst2"><%=a10 %></td>
				
			</tr>

        </table>
		<br>