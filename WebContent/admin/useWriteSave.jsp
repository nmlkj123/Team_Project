<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <%@ include file="../include/dbcon2.jsp" %>
   
   <%
  
   
   String pid=request.getParameter("pid");
   String a1= request.getParameter("a1");
   String a2= request.getParameter("a2");
   String a3= request.getParameter("a3");
   String a4= request.getParameter("a4");
   String a5= request.getParameter("a5");
   String a6= request.getParameter("a6");
   String a7= request.getParameter("a7");
   String a8= request.getParameter("a8");
   String a9= request.getParameter("a9");
   String a10= request.getParameter("a10");
   String a11= request.getParameter("a11");
   
   
   
   
   String colums="pid,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11";
   
   
   String sql= "insert into tourist_use("+colums+") "
		   + " values( " 
		   +" '"+pid+"',"
		   +" '"+a1+"',"
		   +" '"+a2+"',"
		   +" '"+a3+"',"
		   +" '"+a4+"', "
		   +" '"+a5+"',"
		   +" '"+a6+"',"
		   +" '"+a7+"',"
		   +" '"+a8+"',"
		   +" '"+a9+"', "
		   +" '"+a10+"', "
   		   +" '"+a11+"')";
 
   stmt.executeUpdate(sql);
   %>
   
   <script>
   alert("저장되었습니다");
   location="SpotList.jsp";
   </script>