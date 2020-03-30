<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<head>
    <title>메인 화면</title>
    <script type="text/javascript"> 
	$(document).ready(function(){
		$('.bxslider').bxSlider({
			adaptiveHeight:true,
			slidMargin:0,
			nextSelector: '#slider-next'
		}); 
		
	});
	</script>
 
    
</head>
<body>
<section >
  <div class="bxslider" >
	  <div><img style="width:100% ;height: 450px;" src="../image/1.jpg" /></div> 
	  <div><img style="width:100%;height: 450px; "  src="../image/7.jpg" /></div> 
	  <div><img  style="width:100%;height: 450px; " src="../image/2.jpg" /></div>
  </div>

</section>
    
</body>
</html>


