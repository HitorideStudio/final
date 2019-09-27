<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>로그인</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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
            <h2>Go<br> Login</h2>
            <p>Login or register from here to access.</p>
         </div>
      </div>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
               <form action="loginPro.do" method="post">
                  <div class="form-group">
                     <label>User Name</label>
                     <input type="text" class="form-control" placeholder="User Name" name="id">
                  </div>
                  <div class="form-group">
                     <label>Password</label>
                     <input type="password" class="form-control" placeholder="Password" name="pw">
                  </div>
                  <input type="submit" class="btn btn-black" value="Login"/>                
               	<input type="button"class="btn btn-secondary" onclick="location='join.do'" value="Register"/>
               	<!-- 네이버로그인 버튼 -->
               	<a href="${url}"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
               	<!-- 카카오로그인 버튼 -->
               	<a id="kakao-login-btn"></a>
				<a href="http://developers.kakao.com/logout"></a>
				<script type='text/javascript'>
				//<![CDATA[
				// 사용할 앱의 JavaScript 키를 설정해 주세요.
				Kakao.init('545a5f015033824acfc1f335c12d37ca');
				// 카카오 로그인 버튼을 생성합니다.
				Kakao.Auth.createLoginButton({
				container : '#kakao-login-btn',
				success : function(authObj) {
				//alert(JSON.stringify(authObj));
				// 로그인 성공시, API를 호출합니다.
				Kakao.API.request({
					url : '/v1/user/me',
					success : function(res) {
						//alert(res.properties.nickname + res.id + '환영합니다');
						//alert(res.kaccount_email + '이메일');
						//alert(res.properties.profile_image +"사진파일");
						console.log(res);
						var pw = res.id; //유저의 카카오톡 고유 id
						var id = res.kaccount_email; //유저의 이메일
						var name = res.properties.nickname; //유저가 등록한 별명
						var img = res.properties.profile_image; // 유저가 등록한 프로필 사진

						console.log(authObj.access_token);
						//location.href = "loginPro_k.do?code="
							//+ authObj.access_token;
						location=  "/project2_final/signup/CheckSocial.do?id="+id+"&pw="+pw+"&img="+img+"&name="+name;

						},
						fail : function(err) {
							alert(JSON.stringify(err));
							}
						});
						},
					fail : function(err) {
					alert(JSON.stringify(err));
					}

					});

				//]]>
				</script>
               </form>
               
            </div>
         </div>
      </div>

</body>
</html>