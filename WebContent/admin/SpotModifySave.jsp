<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/dbcon2.jsp" %>
    <%

    String Domain = "http://localhost:8080/jeju";
    String RealPath = "C:/User/user/eclipse-workspace/jeju/WebContent";
    
    
    String path="/touristImage";  //이미지 위치
    String uploadpath = request.getRealPath(path);  //이미지 경로인식
    int maxsize= 1024 * 1024 * 10 ; //10M
    MultipartRequest multi = new MultipartRequest
    		(request,uploadpath,maxsize,"utf-8",new DefaultFileRenamePolicy());
    
    String unq=multi.getParameter("unq");
    String name=multi.getParameter("name");
    String addr=multi.getParameter("addr");
    String addr2=multi.getParameter("addr2");
    String tel=multi.getParameter("tel");
    String deptno=multi.getParameter("deptno");
    String oldname1=multi.getParameter("oldname1");
    String hashtag=multi.getParameter("hashtag");
    String x=multi.getParameter("x");
    String y=multi.getParameter("y");
    
    
    
   Enumeration files= multi.getFileNames();
   int filesize=0;
    
    String file1=(String)files.nextElement();
    String orgName1 = multi.getFilesystemName(file1); 
    
    
    

    
   String sql= "update tourist_spot set "
		  	   + " name='"+name+"', "
		  	   + " addr='"+addr+"', "
		  	   + " addr2='"+addr2+"', "
		  	   + " tel='"+tel+"', "
    		   + " image='"+orgName1+"', "
    		   + " hashtag='"+hashtag+"', "
    	       + " x='"+x+"', "
    	       + " y='"+y+"', "
    		   + " deptno='"+deptno+"' "
    		   +" where unq = '"+unq+"'  ";
  
  stmt.executeUpdate(sql); 
   %>
    <script>
    alert("수정완료");
    location="../admin/SpotList.jsp";
    </script>
   