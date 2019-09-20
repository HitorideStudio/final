<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.9.0/css/all.css" integrity="sha384-i1LQnF23gykqWXg6jxC2ZbCbUMxyw5gLZY6UiUS98LYV5unm8GWmfkIS6jqJfb4E" crossorigin="anonymous">
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
<!-- Navigation -->
<nav class="navbar navbar-light bg-light static-top">
    <div class="container">
      <a class="navbar-brand" href="#">Go !</a>
      <div class="dropdown">
  <button class="btn btn-danger" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <i class="far fa-user"></i>
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
  <c:choose>
  <c:when test="${sessionScope.memId ==null }">
    <a class="dropdown-item" href="/project2_final/signup/login.do">Login</a>
  </c:when>
  <c:otherwise>
   <a class="dropdown-item" href="/project2_final/signup/modify.do">info</a>
   <a class="dropdown-item" href="/project2_final/signup/logout.do" >logout</a>
   <a class="dropdown-item" href="/project2_final/memberBoard/write.do" >board</a>
  </c:otherwise>
  </c:choose>  
  </div>
</div>
   
    </div>
  </nav>
