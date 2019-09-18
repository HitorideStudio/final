<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<meta charset="UTF-8">
<title>회원탈퇴_프로젝트2</title>
<style type="text/css">
body {
    font-family: "Lato", sans-serif;
}
.main-head{
    height: 150px;
    background: #FFF;   
}
.sidenav {
    height: 100%;
    background-color: #000;
    overflow-x: hidden;
    padding-top: 20px;
}
.main {
    padding: 0px 10px;
}
@media screen and (max-height: 450px) {
    .sidenav {padding-top: 15px;}
}
@media screen and (max-width: 450px) {
    .login-form{
        margin-top: 10%;
    }
    .register-form{
        margin-top: 10%;
    }
}

@media screen and (min-width: 768px){
    .main{
        margin-left: 40%; 
    }
    .sidenav{
        width: 40%;
        position: fixed;
        z-index: 1;
        top: 0;
        left: 0;
    }
    .login-form{
        margin-top: 80%;
    }
    .register-form{
        margin-top: 20%;
    }
}
.login-main-text{
    margin-top: 20%;
    padding: 60px;
    color: #fff;
}
.login-main-text h2{
    font-weight: 300;
}
.btn-black{
    background-color: #000 !important;
    color: #fff;
}
.btn-red{
    background-color: #000 !important;
    color: red;
}
</style>
</head>
<body>
<div class="sidenav">
         <div class="login-main-text">
            <h2>Go<br> membership withdrawal</h2>
            <p>Good bye..my friends</p>
         </div>
      </div>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
	<form name=deleteForm action="deletePro.do" method="post">
		<label>회원탈퇴</label>
		<div class="form-group">
		<label>비밀번호</label>
		<input type="password" name="pw">
		</div>
		<input class="btn btn-black" type="submit" value="회원탈퇴">
		<input class="btn btn-secondary" type="button" value="취소" onclick="jacascript:window.location='/project2_final/map/welcome.do'">
	</form>
</body>
</div>
</div>
</div>
</html>