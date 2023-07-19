<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- <spring:message code="firstWord" />
<spring:message code="secondWord" />
<a href="<c:url value="/?lang=vi" />">VI</a>
<a href="<c:url value="/?lang=en" />">US</a> -->

<style>
    * {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: middle;}
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}
.fade {
  animation-name: fade;
  animation-duration: 4s;
}

@keyframes fade {
  from {opacity: 0.8} 
  to {opacity: 1}
}
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}
</style>

<div class="content">

    <!--slideshow-container-->
    <div class="" style="height:750px; width:100%;">
        <div class="mySlides fade" \>
            <img src="<c:url value="/images/Home/home7.jpg"/>" style="width:100%; height:750px">

        </div>

        <div class="mySlides fade">
            <img src="<c:url value="/images/Home/home1.jpg"/>" style="width:100%; height:750px">
        </div>

        <div class="mySlides fade">
            <img src="<c:url value="/images/Home/home2.png"/>" style="width:100%; height:750px">
        </div>
    </div>
    <br>
    <div style="text-align:center">
        <span class="dot"></span> 
        <span class="dot"></span> 
        <span class="dot"></span> 
    </div>

    <div class="container">
        <h4 class="text-center p-2 m-0"></h4>
        <div class="row ">
            <div class="col-6">
                <img src="<c:url value="/images/miy_moi.jpg" />" class="img-fluid" alt="image-discount1">
            </div>
            <div class="col-6">
                <img src="<c:url value="/images/miy_moi2.jpg" />" class="img-fluid" alt="image-discount2">
            </div>
        </div>
        <br/><br/>
        <div class="row ">
            <div class="col-6">
                <img src="<c:url value="/images/Home/home4.png" />" class="img-fluid" alt="image-discount1" style="height:310.6px">
            </div>
            <div class="col-6">
                <img src="<c:url value="/images/Home/home5.png" />" class="img-fluid" alt="image-discount2" style="height:310.6px; width:100%;" >
            </div>
        </div>
    </div>
</div>
            
            
<script>
let slideIndex = 0;
showSlides();

function showSlides() {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 4000);
}
</script>
            