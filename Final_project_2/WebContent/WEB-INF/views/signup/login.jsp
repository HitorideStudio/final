<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<form action="loginPro.do" method="post">
    	id:<input type="text" name ="id"/>
    	pw:<input type="password" name="pw"/>
    	<input type="submit" value="로그인"/> 
    </form>
    <button onclick="location.href='join.do'">가입하기</button><br>

</body>
</html>