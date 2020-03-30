<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon2.jsp" %>
<%
String punq=request.getParameter("punq");
%>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script> 
<script>
$().ready(function(){
	$(".review_write_exit").click(function(){
		$(".photo_writeForm").empty();
		
	});

});
function checkValue(){
	$('#imageW').text("");
	if($('#image').val().length==0){
		$('#imageW').text("이미지추가");
		$('#imageW').css("color","red");
		$('#imageW').css("font-size","9pt");
		$('#imageW').css("font-weight","bold");
		
		$('#image').focus();
		return false;
	}
	
		
	
	var form=$("#riviewWInfo")[0];
	var data=new FormData(form);
	
	$.ajax({
		url:'photoWriteSave.jsp',
		type:'POST',
		enctype: 'multipart/form-data',
		data:data,
		processData: false,
        contentType: false,
		success:function(data){
			if(data.trim()=="1"){
				alert("등록하였습니다.");
				$(".photo_writeForm").empty();
				photo('<%=punq%>');
			}else{
				
				alert("로그인하세요.");
				$(".photo_writeForm").empty();
			}
		}
	});
}

</script>

<link href='../css/reviewWrite.css' rel='stylesheet' style='text/css'/>
<style>
.rwtablebox {
      transition: opacity .39s;
      background: #fff;
      padding: 20px 40px;
      margin-left: -350px;
    padding: 40px;
    border: 1px solid #ef6d00;
    width: 600px;
    height: auto;
    opacity: 1;
    top: 180px;
    display: block;
    position: absolute;
	font-size: 13px;
    left: 50%;
      }
</style>

<div class="rwwrap_out">
    <div id="rwwrap">
        <div class="rwtablebox">
        <form  style="text-align: center;" id="riviewWInfo" name="userInfo" enctype="multipart/form-data" >
            <table class="rwcontent">
               <tr>
                    <td class="rwtd0" colspan="2" style="padding-bottom:30px; ">이미지 올리기</td>
                    
                </tr>
                    
                <tr>
                    <td class="rwtd1">여행 사진</td>
                    <td>
                        <input class="rwinput4" type="file" id="image" name="image" value="파일선택" maxlength="40">
                        <div id="imageW"></div> 
                        <input type="hidden" name="punq" value="<%=punq%>">
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