<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="../include/dbcon2.jsp"%> 
<%
String unq=request.getParameter("unq");
String t=request.getParameter("total");
String v=request.getParameter("viewPage");
int total=Integer.parseInt(t);
int unit=12;
int viewPage=Integer.parseInt(v);
int totalPage=(int)Math.ceil((double)total/unit); 
//1(viewPage)->1 2->11 3->21
int startNo=(viewPage-1)*unit+1;
int endNo=startNo+(unit-1);

String sql= "select b.* from(select rownum rn, a.*from ";
	   sql+= " (select image from shopping_photo where pid='"+unq+"' order by rownum desc )a )b ";
	   sql+= " where rn>="+startNo+" and rn <= " +endNo;

	  

ResultSet rs=stmt.executeQuery(sql);
%>
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
		
       
        %>
        </tr>