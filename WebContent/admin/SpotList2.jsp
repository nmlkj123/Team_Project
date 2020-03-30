<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/dbcon2.jsp" %> 


<%
int unit=5;
String viewPage=request.getParameter("viewPage");
if(viewPage==null){
	viewPage="1";
}
String totalsql="select count(*) total from restaurant_spot";
ResultSet rs2=stmt.executeQuery(totalsql);
rs2.next();
int total=rs2.getInt("total");

int totalPage=(int)Math.ceil((double)total/unit); 
//1(viewPage)->1 2->11 3->21
int startNo=(Integer.parseInt(viewPage)-1)*unit+1;
int endNo=startNo+(unit-1);

String   sql="select b.* from(select "; 
		sql+=" rownum rn, a.*from ";
		sql+= " (select s.unq, t.dname,s.name,s.addr,s.tel,s.image "; 
		sql+=" from restaurant_spot s , restaurant t ";
		sql+=" where s.deptno =t.deptno ";
		sql+=" order by unq asc)a )b where rn>="+startNo+" and rn <= " +endNo;
	
ResultSet rs = stmt.executeQuery(sql);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광지</title>
<link rel="stylesheet" href="../css/adminlayout.css">
</head>

<style>
td{
text-align:center;
}

</style>
<script type="text/javascript">

</script>
<body>
<div class="container">
	<div class="adminLeft">
	 <%@include file="../include/leftMenu.jsp" %>
	</div>

	<div class="adminRight">
	<table class="table1">
	
		<tr>
			<th width="20px">순번</th>
			<th width="50px">테마</th>
			<th width="100px">관광지</th>
			<th width="300px">주소</th>
			<th width="50px">전화</th>
			<th width="80px">이미지</th>
			
		</tr>
		
		<%
		
		while( rs.next() ) {
			String unq=rs.getString("unq");
			String dname = rs.getString("dname");
			String name = rs.getString("name");
			String addr = rs.getString("addr");
			String tel = rs.getString("tel");
			String image = rs.getString("image");
			int rn=rs.getInt("rn");

		%>
		<tr>
			
			<td><%=rn %></td>
			<td><%=dname %></td>
			<td><a href="tourDetail2.jsp?unq=<%=unq%>"><%=name %></a></td>
			<td><%=addr %></td>
			<td><%=tel %></td>
			<td><a href="../touristImage/<%=image %>"target="_blank"><%=image %></a></td>
			 
		</tr>
		<%
			
		}
		
		
		%>

		</table>
		<br><br><br>
					 <div class="p1">
					 
  <%
  for(int i=1; i<=totalPage; i++){
	  %>
	  <a href="SpotList2.jsp?viewPage=<%=i%>"><%=i %></a>
	  <%
	  
  }
  %>
  <div>
 			
 			<input type="button" value="추가"
        	onclick="location='Write2.jsp'">
        	 
  </div>
  
  
  </div>
    </form>
	</div>





  
</div>


</body>
</html>