<%@page import="tourist.TouristReviewPaging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/dbcon2.jsp" %>
<%
	String pg = request.getParameter("pg");
	String dpid = request.getParameter("pid");
	if(pg==null || pg.equals("")){
		   pg="1";
	}
	
	int endNum=Integer.parseInt(pg)*5;
	   int startNum=endNum-4;
	   ResultSet trs = stmt.executeQuery("select count(*)as total from tourist_review where pid='"+dpid+"'");
	   trs.next(); 
	   int totalA=trs.getInt("total");
	   TouristReviewPaging touristPaging=new TouristReviewPaging(); 
	   touristPaging.setCurrentPage(Integer.parseInt(pg));
	   touristPaging.setPageBlock(3);
	   touristPaging.setPageSize(5);
	   touristPaging.setTotalA(totalA);
	   touristPaging.setDpid(dpid);
	   touristPaging.makePagingHTML();
	   
	String deptno=request.getParameter("deptno");
	ResultSet rs=stmt.executeQuery("select * from(select rownum as rn ,t.* from(select unq,pid,id,name,content,image,hashtag,star,logtime from tourist_review where pid='"+dpid+"' order by unq desc)t) where rn>='"+startNum+"' and rn<='"+endNum+"'");
	Statement stmt2= conn.createStatement();
	Statement stmt3= conn.createStatement();
	String memId=(String)session.getAttribute("memId");
		
%>   

<link rel="stylesheet" href="../css/review.css">
<link rel="stylesheet" href="../css/buttons.css">
<link rel="stylesheet" href="../css/pagingList.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script charset=utf-8">

$(document).ready(function(){
	var scmove = $('.tab_cont').offset().top-220;
	$('html, body').animate( { scrollTop : scmove }, 400 );
	$(".delete_rep").click(function(){
		var dd='<%=memId %>';
		if(dd=='null'){
			alert("로그인하세요");
			location.href="../member/login.jsp";
			return false;
		}
		var re=confirm("정말로 삭제하시겠습니까?");
		if(re){
			var id=$(this).attr("id");
			var unq=$(this).attr("unq");
			var tex=$($(this).closest(".user_content")).find("p[class='review_txt']").text();
			
			$.ajax({
				type:'POST',
				url:'reviewRepDelete.jsp',
				data:'id='+id+'&unq='+unq+'&content='+tex,
				error:function(){
					alert("실패");
				},
				success:function(data){
					if(data.trim()=="1"){
						alert("삭제하였습니다.");
						review(<%=pg%>,<%=dpid%>);
					}else{
						
						alert("등록실패.");
					}
				}
			});
		}else{
		    
		}
	});
	$(".delete_review").click(function(){
		var dd='<%=memId %>';
		if(dd=='null'){
			alert("로그인하세요");
			location.href="../member/login.jsp";
			return false;
		}
		var re=confirm("정말로 삭제하시겠습니까?");
		if(re){
			var id=$(this).attr("id");
			var unq=$(this).attr("unq");
			$.ajax({
				type:'POST',
				url:'reviewDelete.jsp',
				data:'id='+id+'&unq='+unq,
				error:function(){
					alert("실패");
				},
				success:function(data){
					if(data.trim()=="1"){
						alert("삭제하였습니다.");
						review(<%=pg%>,<%=dpid%>);
					}else{
						
						alert("등록실패.");
					}
				}
			});
		}else{
		    
		}
	});
	$(".review_write_buttton").click(function(){
		var dd='<%=memId %>';
		if(dd=='null'){
			alert("로그인하세요");
			location.href="../member/login.jsp";
			return false;
		}
		$.ajax({
			url:'reviewWrite.jsp',
			type:'POST',
			data:'dpid='+<%=dpid%>,
			dataType:'html',
			success:function(result){
				$(".review_writeForm").html(result);
			}
		});
		
		
	});
	$(".reg_ripple_btn1").click(function(){
		
		var dd='<%=memId %>';
		if(dd=='null'){
			alert("로그인하세요");
			location.href="../member/login.jsp";
			return false;
		}
		
		var tex=$($(this).closest(".reg_ripple_area")).find("textarea").val();
		if(tex.length<5){
			alert("5자이상 입력해주삼");
		}else{
			$.ajax({
				type:'POST',
				url:'reviewRefSave.jsp?content='+tex+'&pid='+$(this).attr("id"),
				error:function(){
					alert("실패");
				},
				success:function(data){
					if(data.trim()=="1"){
						alert("등록하였습니다.");
						review(<%=pg%>,<%=dpid%>);
					}else{
						
						alert("등록실패.");
					}
				}
			});
		}
		
	});
	$(".rwview_r").click(function(){
		if($($(this).closest(".r_area_li")).find(".rpon").length> 0){
			$($(this).closest(".r_area_li")).find(".rpon").removeClass("rpon");
			return false;
		}
		$($(this).closest(".r_area_li")).find(".reply_list").addClass("rpon"); 
	});
	$(".rwview_w,.reg_ripple_btn2").click(function(){
		if($($(this).closest(".r_area_li")).find(".ron").length> 0){
			$($(this).closest(".r_area_li")).find(".ron").removeClass("ron");
			return false;
		}
		$($(this).closest(".r_area_li")).find(".reg_ripple").addClass("ron"); 
	});
	$(".like_button").click(function(){
		var dd='<%=memId %>';
		if(dd=='null'){
			alert("로그인하세요");
			location.href="../member/login.jsp";
			
		}else{
			var rr=$(this).prev();
			$.ajax({
				type:'GET',
				url:'reviewLikeSave.jsp?pid='+$(this).attr("id"),
				error:function(){
					alert("실패");
				},
				success:function(data){
					if(data.trim()=="1"){
						alert("추천하였습니다.");
						$(rr).text(Number($(rr).text())+1);
					}else{
						
						alert("이미추천하였습니다.");
					}
				}
			});
		}
		
	
	});
	
});
</script>  
<p class="r_title">여행가의 리뷰
<span style="font-size: 24px; font-weight: 800; color: rgb(243, 143, 30); line-height: 24px; margin-left: 0px;">
(<%=totalA %>)
</span>
</p>
<div class="button-4 review_write_buttton" style="border-radius: 10px;">
    <div class="eff-4"></div>
    <a href="javascript:void(0)" > 리뷰등록 </a>
</div>

<div class="r_area">
<!---->
	<ul class="r_area_ul">
	<!---->

		<%while(rs.next()){
			String unq=rs.getString("unq");
			String pid=rs.getString("pid");
			String id=rs.getString("id");
			String name=rs.getString("name");
			String content=rs.getString("content");
			String image=rs.getString("image");
			String hashtag=rs.getString("hashtag");
			String star=rs.getString("star");
			String logtime=rs.getString("logtime");
			ResultSet rsrc;
			rsrc=stmt2.executeQuery("select count(*) as cnt from tourist_review_board where pid="+unq+"");
			rsrc.next();
			String cnt=rsrc.getString("cnt");
			rsrc.close();
			
			rsrc=stmt2.executeQuery("select count(*) as lcnt from tourist_review_like where pid="+unq+"");
			rsrc.next();
			String lcnt=rsrc.getString("lcnt");
			rsrc.close();
			
			String profile="default.jpg";
			
			rsrc=stmt2.executeQuery("select count(*) as cnt from member where userid='"+id+"'");
			rsrc.next();
			int icnt=rsrc.getInt("cnt");
			rsrc.close();
			if(icnt>0){
				rsrc=stmt2.executeQuery("select image from member where userid='"+id+"'");
				rsrc.next();
				profile=rsrc.getString("image");
				rsrc.close();
			}
			
			%>
		<li class="r_area_li">
		<!---->
			<div class="r_area_div">
			<!---->
				<div class="r_area_img">
					<div align="left" ><img alt="" src="../memberfiles/<%=profile %>" style="border-radius: 70px;" width="80px" height="80px" ></div>
					<p align="center" style=" margin:0;padding:0; width:80px;height:14px; margin-top: 10px; font-size: 14px; line-height: 10px;" class="user_name"><%=name %></p>
					<p align="center" style="color: #555; margin:0;padding:0; width:80px;height:14px; margin-top: 10px; font-size: 12px; line-height: 10px;" class="reg_date"><%=logtime %></p>
					<p align="center" style="margin:0;padding:0; width:80px;height:14px; margin-top: 15px; font-size: 14px; line-height: 10px;" class="score_count_p" style="width: 100%;">

						<%
						int max=Integer.parseInt(star);
						for(int i=1;i<=5;i++){
							if(i>max){
								
							
							%><span class="starRc">별</span>
							<%
							}else{
							
							%>
							<span class="starRc oncs">별</span>
							<%} %>
							<%}%>
					
					</p>
				</div>
				
				<div class="r_area_content">
					<div class="check_like" style="width: 94px;height: 24px;">
					<p  style="display: block; margin: 0;padding-left: 20px;float: left; background: url('../image/like.png ') no-repeat 0 50%;background-size: 15px 11px;font-size: 14px;color: #ef6d00;line-height: 23px; "><%=lcnt %></p>
					<button class=" review_item_button like_button" id="<%=unq %>" style=" margin-left: 8px;border: 1px solid #ef6d00; color: #ef6d00; line-height: 21px;">
					추천
					</button>
					</div>
					<div class="check_hastag">
						<ul class="check_list">
							<!---->
							
							<%if(hashtag!=null){
							String[] has= hashtag.split("#");
							if(has.length!=0){
								for(String aa:has){
									if(!((aa.trim()).equals(""))){
									%><li class="top"><a style="font-size: 14px;color: #ef6d00;text-decoration: none;" href="#">#<%=aa %> </a></li><%
									}
								}
							}}
								
							 %>
							</ul>
					</div>
					<%if(session.getAttribute("memId")!=null){
						if(session.getAttribute("memId").equals(id)){
						%>
					<div style=" margin: 0;padding: 0;"><img id="<%=id %>" unq=<%=unq %> class="delete_review" style="cursor: pointer;float: right;" src="../image/btn_del_x.png" alt="" class="close_btn"></div>
					<%}} %>
					<div style="margin:0; ">
					<!--  -->
					
					<p style="word-break:break-all; margin-top:40px; width:690px; text-align: left;font-size: 14px;color: #535353; line-height: 22px;letter-spacing: -.5px;"><%=content %></p>
					<%if(!(image.equals("null"))){ %>
					<ul class="review_img_list">
						<li>
							<a href="../reviewImage/<%=image %>"  data-lightbox="roadtrip"   class="img20"><img src="../reviewImage/<%=image %>"  alt="미등록" class="">
							</a>
						</li>
						
					</ul >
					<%} %>
					</div>
					<div style="clear:both; display:block; bottom: 0;float: left;margin-top: 15px;">
						<button class="review_item_button rwview_r">댓글(<%=cnt %>)</button>
						<button class="review_item_button rwview_w">댓글쓰기</button>
					</div>
				</div>			
			</div>
			<!--댓글쓰는부분  -->
			<ul class="reg_ripple ron">
				<li class="reg_ripple_item">
					<div class="reg_ripple_area">
						<div class="reg_ripple_input">
							<textarea placeholder="댓글을 입력하세요." maxlength="1000" title="댓글입력" class="reg_ripple_textarea"></textarea>
						</div>
						<div class="reg_ripple_btns">
							<button style="cursor: pointer;" class="reg_ripple_btn1" id="<%=unq %>">등록</button>
							<button style="cursor: pointer;" class="reg_ripple_btn2">취소</button>
						</div>
					</div>
				</li>
			</ul>
			<!--댓글달린 부분  -->
			
			<ul class="reply_list rpon">
			<%
				ResultSet rs2 =stmt3.executeQuery("select id,name,content,logtime,pid from tourist_review_board where pid="+unq+" order by logtime asc");
				
				while(rs2.next()){ 
					String id2=rs2.getString("id");
					String name2=rs2.getString("name");
					String content2=rs2.getString("content");
					String logtime2=rs2.getString("logtime");
					String pid2=rs2.getString("pid");
					
					String profile2="default.jpg";
					
					rsrc=stmt2.executeQuery("select count(*) as cnt from member where userid='"+id2+"'");
					rsrc.next();
					int icnt2=rsrc.getInt("cnt");
					rsrc.close();
					if(icnt>0){
						rsrc=stmt2.executeQuery("select image from member where userid='"+id2+"'");
						rsrc.next();
						profile2=rsrc.getString("image");
						rsrc.close();
					}
				%>
				<li class="reply_item">
					<div class="review_area">
						<div class="user_profile">
							<div class="photo_area">
								<img src="../memberfiles/<%=profile2 %>" alt="" class="user_profile_img">
								
							</div>
							<p class="user_name"><%=name2 %></p>
							<p class="reg_date"><%=logtime2 %></p>
						</div>
						<div class="user_content">
						<%if(session.getAttribute("memId")!=null){
						if(session.getAttribute("memId").equals(id2)){
						%>
					<div style=" margin: 0;padding: 0;"><img id="<%=id2 %>" unq=<%=pid2 %> class="delete_rep" style=" cursor: pointer;float: right;" src="../image/btn_del_x.png" alt="" class="close_btn"></div>
					<%}} %>
							<div class="review">
								<!---->
								<p class="review_txt"><%=content2 %></p>
							</div>
						</div>
					</div>
				</li>
				<!---->
				<% }%>
			</ul>
		</li>
		<%} %>
		
	</ul>
	<br><br>
	<%=touristPaging.getPagingHTML() %>
	
	
	<div class="review_writeForm">
	
	</div>
</div>
