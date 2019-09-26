<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<title>메인페이지</title>
</head>
<body>
             
<!-- Slide Show -->
<section>
  <img class="mySlides" src="../resources/img/a.jpg" width=100%>
  <img class="mySlides" src="../resources/img/b.jpg" width=100%>
  <img class="mySlides" src="../resources/img/c.jpg" width=100%>
</section>

<!-- Band Description -->
<section class="w3-container w3-center w3-content" style="max-width:600px">
  <a href="/project2_final/map/welcome.do">
  <h2 class="w3-wide">GO</h2>
  </a>
  <p class="w3-opacity"><i>We love hotplace</i></p>
  <p class="w3-justify">
  	 인스타그램 사진업로드 위치정보를 크롤링한 데이터를 사용하여 핫플레이스를 검색하는 사이트 입니다.
  </p>
</section>



<!-- Footer -->
<footer class="w3-container w3-padding-64 w3-center w3-black w3-xlarge">
  <a href="https://www.facebook.com/"><i class="fa fa-facebook-official"></i></a>
  
  <a href="https://twitter.com/?lang=ko"><i class="fa fa-twitter"></i></a>
  
  
</footer>

<script>
// Automatic Slideshow - change image every 3 seconds
var myIndex = 0;
carousel();

function carousel() {
  var i;
  var x = document.getElementsByClassName("mySlides");
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}
  x[myIndex-1].style.display = "block";
  setTimeout(carousel, 3000);
}
</script>


</body>
</html>