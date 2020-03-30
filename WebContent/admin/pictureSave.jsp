<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@include file="../include/dbcon2.jsp"%>
    <%

    
    String path="/picturesTourist";  //이미지 위치
    String uploadpath = request.getRealPath(path);  //이미지 경로인식
    int maxsize= 1024 * 1024 * 10 ; //10M
    MultipartRequest multi = new MultipartRequest
    		(request,uploadpath,maxsize,"utf-8",new DefaultFileRenamePolicy());
    
   
    String unq=multi.getParameter("unq");
    
    Enumeration files= multi.getFileNames();
    int filesize=0;
    
     String file1=(String)files.nextElement();
     String orgName1 = multi.getFilesystemName(file1); //큰이미지
    
    
    String colums="image,pid";
    
    
    String sql2= "insert into tourist_photo("+colums+") "
 		   + " values( " 	   
 		   +" '"+orgName1+"',"
 		   +" '"+unq+"' ) ";
    stmt.executeUpdate(sql2);
    %>
     <script>
       alert("저장완료");
       location = "pictureList.jsp?unq=<%=unq%> ";
       
       </script>

 

 		   