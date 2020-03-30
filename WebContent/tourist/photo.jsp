<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon2.jsp"
 %> 

<%
String memId=(String)session.getAttribute("memId");
String Domain = "http://localhost:8080/jeju";
String unq= request.getParameter("unq");

int unit=12;
int viewPage=1;
String totalsql="select count(*) total from tourist_photo where pid="+unq;
ResultSet rs2=stmt.executeQuery(totalsql);
rs2.next();
int total=rs2.getInt("total");

int totalPage=(int)Math.ceil((double)total/unit); 
//1(viewPage)->1 2->11 3->21
int startNo=(viewPage-1)*unit+1;
int endNo=startNo+(unit-1);

String sql= "select b.* from(select rownum rn, a.*from ";
	   sql+= " (select image from tourist_photo where pid='"+unq+"' order by rownum desc)a )b ";
	   sql+= " where rn>="+startNo+" and rn <= " +endNo;

	  

ResultSet rs=stmt.executeQuery(sql);




%>
<!DOCTYPE html>

<style>
.r_title{
float: left;
font-size: 24px;
font-weight: 800;
color: #1b1b1b;
line-height: 24px;

}
.a1{
font-size:20px;
text-align:center;

}
.div1{
font-size:30px;
font-family:맑은 고딕;
}
.table1{
margin-top:50px; 
}

.table1 td{
width:363px; 
height:100%
}
table.table1 img{
width:99%;
height:100%;
margin: 0;

}
</style>
<link rel="stylesheet" href="../css/buttons.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
var total=<%=total%>;
var viewPage=<%=viewPage%>;
var totalPage=<%=totalPage%>;
$(document).ready(function(){
	if(viewPage==totalPage){
		$(".a1").empty();
	}
	$(".p_write_buttton").click(function(){
		var dd='<%=memId %>';
		if(dd=='null'){
			alert("로그인하세요");
			location.href="../member/login.jsp";
			return false;
		}
		$.ajax({
			url:'photoWrite.jsp',
			type:'POST',
			data:'punq='+<%=unq%>,
			dataType:'html',
			success:function(result){
				
				$(".photo_writeForm").html(result);
			}
		});
		
		
	});
	$(".plus_btn").click(function(){
		viewPage=viewPage+1;
		
		$.ajax({
			type:'POST',
			url:'photoGetList.jsp?unq='+<%=unq%>+'&total='+total+'&viewPage='+viewPage,
			dataType:'html',
			error:function(){
				alert("실패");
			},
			success:function(data){
				$(".table1").append(data);
				if(viewPage==totalPage){
					$(".a1").empty();
				}
			}
		});
		
	});
	
});
</script>
<p class="r_title">사진<span style="font-size: 24px; font-weight: 800; color: rgb(243, 143, 30); line-height: 24px; margin-left: 0px;">
(<%=total %>)
</span>
</p>
<div class="button-4 p_write_buttton" style="border-radius: 10px;">
    <div class="eff-4"></div>
    <a href="javascript:void(0)" > 사진등록 </a>
</div>
<form  method="post" enctype="multipart/form-data" action="pictureSave.jsp">


<br><br>
<table class="table1">
        <tr>
        <%
        int count=0;	
		while( rs.next() ) {
			String image = rs.getString("image");
		%>
		
			
			
			<td>
			<div><a href="../picturesTourist/<%=image %>" data-lightbox="roadtrip">
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
 <div class="a1" >
	<input type="button" class="plus_btn" style="width:70%;height:30pt;" value="더보기">
      			 
  
</div>

</form>
<div class="photo_writeForm">

</div>