<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon2.jsp" %>
<%
String rwpid=request.getParameter("dpid");
ResultSet rs = stmt.executeQuery("select * from restaurant_spot where unq='"+rwpid+"'");
rs.next();
String dname=rs.getString("name");
rs.close();
%>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script> 
<script>
$().ready(function(){
	$(".review_write_exit").click(function(){
		$(".review_writeForm").empty();
		
	});
	$('.starRev span').click(function(){
		  $(this).parent().children('span').removeClass('ons');
		  $(this).addClass('ons').prevAll('span').addClass('ons');
		  $("#star").val($(this).text());
		  return false;
		});
});
function checkValue(){
	$('#contentW').text("");
	$('#hashtagW').text("");
	if($('#content').val().length==0){
		$('#contentW').text("내용입력");
		$('#contentW').css("color","red");
		$('#contentW').css("font-size","9pt");
		$('#contentW').css("font-weight","bold");
		
		$('#content').focus();
		return false;
	}
	if($('#hashtag').val().length>0){
		var value=$("#hashtag").val();
		var n = value.indexOf("#");
		var s = value.charAt(0);
		var e = value.charAt(value.length-1);
		if(n==-1||s!="#"||e=="#"){
			$('#hashtagW').text("제대로된 태그입력");
			$('#hashtagW').css("color","red");
			$('#hashtagW').css("font-size","9pt");
			$('#hashtagW').css("font-weight","bold");
			$('#hashtag').focus();
			return false;
		}
		
	}
	if($('#hashtag').val().length>20){
		$('#hashtagW').text("너무많이입력");
		$('#hashtagW').css("color","red");
		$('#hashtagW').css("font-size","9pt");
		$('#hashtagW').css("font-weight","bold");
		$('#hashtag').focus();
		return false;
	}
		
	
	var form=$("#riviewWInfo")[0];
	var data=new FormData(form);
	
	$.ajax({
		url:'reviewWriteSave.jsp',
		type:'POST',
		enctype: 'multipart/form-data',
		data:data,
		processData: false,
        contentType: false,
		success:function(data){
			if(data.trim()=="1"){
				alert("등록하였습니다.");
				$(".review_writeForm").empty();
				review("1",<%=rwpid%>);
			}else{
				
				alert("로그인하세요.");
				$(".review_writeForm").empty();
			}
		}
	});
}

</script>

<link href='../css/reviewWrite.css' rel='stylesheet' style='text/css'/>
<style>
.starR{
	  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
	  background-size: auto 100%;
	  width: 30px;
	  height: 30px;
	  display: inline-block;
	  text-indent: -9999px;
	  cursor: pointer;
	}
.starR.ons{background-position:0 0;}
</style>

<div class="rwwrap_out">
    <div id="rwwrap">
        <div class="rwtablebox">
        <form  style="text-align: center;" id="riviewWInfo" name="userInfo" enctype="multipart/form-data" >
            <table class="rwcontent">
               <tr>
                    <td class="rwtd0" colspan="2" style="padding-bottom:30px; ">리뷰쓰기</td>
                    
                </tr>
               
                <tr>
                    <td class="rwtd1">평가</td>
                    <td>
                        <div class="starRev">
						  <span class="starR ons">1</span>
						  <span class="starR">2</span>
						  <span class="starR">3</span>
						  <span class="starR">4</span>
						  <span class="starR">5</span>  
						  <input type="hidden" id="star" name="star" value="1"> 
						  <input type="hidden" id="pid" name="pid" value="<%=rwpid%>"> 
						</div>
                    </td>
                </tr>
                        
                <tr>
                    <td class="rwtd1">방문 여부</td>
                    <td>
                        <input type="radio" name="chk" value="1">방문했습니다
                        <input type="radio" name="chk" value="2" checked>방문전입니다
                    </td>
                </tr>
                
                <tr>
                    <td class="rwtd1">장소 이름</td>
                    <td>
                        <input class="rwinput1" readonly type=text name="place" maxlength="30" value="<%=dname%>">
                    </td>
                </tr>
                    
                <tr>
                    <td class="rwtd1">여행 사진</td>
                    <td>
                        <input class="rwinput4" type="file" name="image" value="파일선택" maxlength="40"> 
                    </td>
                </tr>
                    
                <tr>
                    <td class="rwtd1">리뷰</td>
                    <td>
                        <textarea style="resize: none;" class="rwinput3" id="content" name="content"  maxlength="1000"></textarea>
                        <div id="contentW"></div>
                    </td>
                </tr>
                <tr>
                    <td class="rwtd1">태그</td>
                    <td>
                        <input class="rwinput1" type="text" name="hashtag" id="hashtag" onclick="this.value=''"
                        value="최소 3개,최대 10개" maxlength="20">
                        <div id="hashtagW"></div>
                    </td>
                    
                </tr>
            </table>
            <br>
            <input  class="rwbutton1" type="button" onclick="checkValue();" value="등록"> 
            <input class="rwbutton2 review_write_exit" type="button" value="취소">
        </form>
        </div>
    </div>
</div>