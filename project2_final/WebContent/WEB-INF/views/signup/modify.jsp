<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<meta charset="UTF-8">
<title>modify_project2</title>
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

</style>
</head>
<body>
<div class="sidenav">
         <div class="login-main-text">
            <h2>Go<br> Modify</h2>
            <p>Login or register from here to access.</p>
         </div>
      </div>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">

<form action ="modifyPro.do" method="post" enctype="multipart/form-data">
 	<div class="form-group">
 	${vo.id}
 	</div>
 	<div class="form-group">
 	<label>pw</label>
 	<input class="form-control" type ="password" name="pw" value="${vo.pw}"/>
 	</div>
 	<div class="form-group">
 	<label>name</label>
 	<input class="form-control" type ="text" name="name" value="${vo.name}"/>
 	</div>
 	<div class="form-group">
 	<img src="${vo.img}" width="150"/> 
 	<input class="form-control" type ="file" name="img">
 	</div>
 	<input type="hidden" name="org" value="${vo.img}"/><br/>
 	<input class="btn btn-black" type="submit" value="수정하기"/>
 	<input type="button"class="btn btn-secondary" onclick="location='/project2_final/map/welcome.do'" value="홈으로"/>
 	
</form>
</div>
</div>
</div>

</body>
</html>