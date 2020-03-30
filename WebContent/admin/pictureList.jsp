<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon2.jsp"
 %> 

<%
String Domain = "http://localhost:8080/jeju";
String unq= request.getParameter("unq");

int unit=6;
String viewPage=request.getParameter("viewPage");
if(viewPage==null){
	viewPage="1";
}
String totalsql="select count(*) total from tourist_photo";
ResultSet rs2=stmt.executeQuery(totalsql);
rs2.next();
int total=rs2.getInt("total");

int totalPage=(int)Math.ceil((double)total/unit); 
//1(viewPage)->1 2->11 3->21
int startNo=(Integer.parseInt(viewPage)-1)*unit+1;
int endNo=startNo+(unit-1);

String sql= "select b.* from(select rownum rn, a.*from ";
	   sql+= " (select image from tourist_photo where pid='"+unq+"' )a )b ";
	   sql+= " where rn>="+startNo+" and rn <= " +endNo;

	  

ResultSet rs=stmt.executeQuery(sql);




%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진목록</title>

</head>
<style>
.a1{
font-size:20px;
text-align:center;
}
.div1{
font-size:30px;
font-family:맑은 고딕;
margin-left:80px;
}
img{
width:600px;
height:500px;
margin-left:80px;
}
</style>

<body>
<form  method="post" enctype="multipart/form-data" action="pictureSave.jsp">
<div><input type="hidden" name="unq" value="<%=unq %>" ></div>

<div style="float:right;">
    <input type="file" name="fileName1" class="file1">
    <input type="submit" value="전송">
</div>
<br><br><br>

<div class="div1">사진</div>

<br><br>
<table class="table1">
        <tr>
        <%
        int count=0;	
		while( rs.next() ) {
			String image = rs.getString("image");
		%>
		
			
			
			<td>
			<div><a href="<%=request.getRequestURL()%>?unq=<%=unq%>">
			<img src="../picturesTourist/<%=image %>"></a></div>
			 </td>
        <%
        if(count%3 ==2) {
        	out.print("</tr><tr>");
        }
        count++;
        }
        if(count==0) {
        	out.print("<td>등록된 사진이 없습니다.</td>");
        }
        %>
        </tr>
        </table>
	<br><br>
 <div class="a1">
					 
  <%
  for(int i=1; i<=totalPage; i++){
	  %>
	  <a href="pictureList.jsp?viewPage=<%=i%>&unq=<%=unq %>">[<%=i %>]</a>
	  <%
	  
  }
  %>
</div>

</form>
</body>
</html>