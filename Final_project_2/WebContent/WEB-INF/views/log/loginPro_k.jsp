<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오로그인테스트</title>
</head>
<body>
카카오로그인 테스트페이지

	<c:if test="${userId eq null}">
		<a href="https://kauth.kakao.com/oauth/authorize
            ?client_id=10cac2f9f4c5108554c926ad58b85242
            &redirect_uri=http://localhost:8080/login
            &response_type=code"> <img src="/img/kakao_account_login_btn_medium_wide_ov.png">
		</a>
	</c:if>
	<c:if test="${userId ne null}">
		<h1>로그인 성공입니다</h1>
	</c:if>

</body>
</html>