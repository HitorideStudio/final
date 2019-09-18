<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Login_kakao</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
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
				alert(JSON.stringify(authObj));
				// 로그인 성공시, API를 호출합니다.
				Kakao.API.request({
					url : '/v1/user/me',
					success : function(res) {
						alert(res.properties.nickname + res.id + '환영합니다');
						alert(res.kaccount_email + '이메일');
						alert(res.properties.profile_image +"사진파일");
						
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
	

</body>
</html>