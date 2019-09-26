<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<meta charset="UTF-8">
<title>회원가입</title>
</head>

<script language="JavaScript">
    
    function checkIt() {
        var userinput = eval("document.userinput");
        if(!userinput.id.value) {
            alert("ID를 입력하세요");
            return false;
        }
        
        if(!userinput.pw.value ) {
            alert("비밀번호를 입력하세요");
            return false;
        }
        if(userinput.pw.value != userinput.pw2.value)
        {
            alert("비밀번호를 동일하게 입력하세요");
            return false;
        }

        if(!userinput.name.value) {
            alert("이름을 입력하세요");
            return false;
        }
       
        if(!userinput.img.value) {
            alert("프로필 사진을 등록하세요");
            return false;
        }
        
    }

    // 아이디 중복 여부를 판단
    function openConfirmid(userinput) {
        // 아이디를 입력했는지 검사
        if (userinput.id.value == "") {
            alert("이메일를입력하세요");
            return;
        }
        // url과 사용자 입력 id를 조합합니다.
        url = "confirmId.do?id="+userinput.id.value ;
        
        // 새로운 윈도우를 엽니다.
        open(url, "confirm",  "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
    }
</script>
<style>
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
<body>
<div class="sidenav">
         <div class="login-main-text">
            <h2>Go<br> SignUp</h2>
            <p>register from here to access.</p>
         </div>
      </div>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
	<form action ="joinPro.do" method="post" enctype="multipart/form-data" 
	name="userinput" onSubmit="return checkIt()">
	<div class="form-group">
 		<label>아이디</label>
 		<input class="form-control" type ="text" name="id" placeholder="이메일형식으로 입력하세요"/>
 		<input  type="button" name="confirm_id" value="ID중복확인" 
        							OnClick="openConfirmid(this.form)"><br/>
    </div>
    <div class="form-group">
 		<label>비밀번호</label>
 		<input class="form-control" type ="password" name="pw"/>
 		</div>
 		<div class="form-group">
 		<label>비밀번호 확인</label>
 		<input class="form-control" type ="password" name="pw2"/>
 		</div>
 		<div class="form-group">
 		<label>이름</label>
 		<input class="form-control" type ="text" name="name"/>
 		</div>
 		<div class="form-group">
 		<label>프로필</label>
 		<input class="form-control" type ="file" name="img">
 		</div>
 	<input type="submit" class="btn btn-black" value="가입"/>
 	<input type="reset" class="btn btn-black" name="reset" value="다시입력">
    <input type="button" class="btn btn-black" value="가입안함" onclick="javascript:window.location='/project2_final/map/welcome.do'">
 	<br/>
 </form>
 </div>
 </div>
 </div>

</body>
</html>