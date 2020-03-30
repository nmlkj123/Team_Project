<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@include file="../include/dbcon2.jsp" %>
    <%
    String unq=request.getParameter("unq"); //unq받기
    
    String sql= "select s.name,s.addr,s.addr2,s.tel,t.dname,t.deptno "; 
    sql+=" from shopping_spot s, shopping t ";//sql작성
     	sql+=	"where s.deptno=t.deptno and  unq='"+unq+"' " ;


    	ResultSet rs=stmt.executeQuery(sql); //sql적용
    	rs.next();
    	String deptno=rs.getString("deptno");
    	String dname=rs.getString("dname");
		String name=rs.getString("name");
		String addr=rs.getString("addr");
		String addr2=rs.getString("addr2");
		String tel=rs.getString("tel");

	
   %>
    
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광지</title>
<link rel="stylesheet" href="../css/adminlayout.css">
</head>

<style>
table.table1{
font-size:15px;
margin-left:100px;
width:800px;
border:0px solid #ccc;
cellspacing:0px;
font-family:맑은 고딕;
line-height:1.6;
margin-top:20px;

}
td{
text-align:center;
}
.div2{
text-align:center;
}

</style>
<script>
		function fn_delete(){
	confirm("정말 삭제하시겠습니까?");
	location="SpotDelete3.jsp?deptno=<%=deptno%>&unq=<%=unq%>";
	
}
</script>
<body>
<div class="container">
	<div class="adminLeft">
	 <%@include file="../include/leftMenu.jsp" %>
	</div>

	<div class="adminRight">
	<table class="table1">
	
			
			
			<tr>
			
			<td>관광지</td>
			<td><%=name %></td>
				
			</tr>
			
			<tr>
			
			<td>테마</td>
			<td><%=dname %></td>
				
			</tr>
			
			<tr>
			
			<td>주소</td>
			<td><%=addr %></td>
				
			</tr>
			
			<tr>
			
			<td>주소2</td>
			<td><%=addr2 %></td>
				
			</tr>
			
			<tr>
			
			<td>번호</td>
			<td><%=tel %></td>
				
			</tr>
			
			
			<tr>
			
			<td>이용안내</td>
			<td><a href="useDetail3.jsp?unq=<%=unq %>">link</a>
				<%
				ResultSet rs6 = stmt.executeQuery("select count(*) as cnt from shopping_use where pid="+unq+"");
			    rs6.next();
			    int cnt = rs6.getInt("cnt");
			    if(cnt==0){
				
				%>
				<a href="useWrite3.jsp?unq=<%=unq %>">추가</a>
				<%}%>
			</td>
			</tr>
			
			
			<tr>
			
			<td>상세정보</td>
			<td><a href="content3.jsp?unq=<%=unq %>">link</a>
			</td>
			</tr>
			
			
			
			

		</table>
		<br><br><br>

  <div class="div2">
  
        	<input type="button" value="수정"
        	onclick="location='SpotModify3.jsp?unq=<%=unq%>'">
        	<input type="button" value="삭제"
        	onclick="fn_delete()">  
  </div>
  
  
  </div>
    </form>
	</div>





  
</div>


</body>
</html>