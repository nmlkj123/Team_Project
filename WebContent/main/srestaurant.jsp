<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon2.jsp"%>   
<%
String q=(request.getParameter("q")).trim();
String t=request.getParameter("total");
String v=request.getParameter("viewPage");
int total=Integer.parseInt(t);
int unit=3;
int viewPage=Integer.parseInt(v);
int totalPage=(int)Math.ceil((double)total/unit); 
//1(viewPage)->1 2->11 3->21
int startNo=(viewPage-1)*unit+1;
int endNo=startNo+(unit-1);


ResultSet rs=stmt.executeQuery("select * from(select rownum rn, a.* from( select unq,name,addr,addr2,tel,image from restaurant_spot where unq like '%"+q+"%' or name like '%"+q+"%' or addr2 like '%"+q+"%' or hashtag like '%"+q+"%' or  tel like '%"+q+"%' )a ) where rn >= "+startNo+" and rn <="+endNo+"");

%>
   <tr >
      <%
      int count =0;
      
      while( rs.next() ) {
    	  	String unq = rs.getString("unq");
    	  	String name = rs.getString("name");
    	  	String image = rs.getString("image");
    	  	String addr2  = rs.getString("addr2");
    	  	String tel = rs.getString("tel");
      %>
      		<td style=" width:33%; padding:20px; margin: 0px; ">
      			<div class="div3">
      			
      <a href="../restaurant/restaurant_spot.jsp?tunq=<%=unq %>">
      <img src="../touristImage/<%=image %>" width="100%" height="190"></a><br>
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