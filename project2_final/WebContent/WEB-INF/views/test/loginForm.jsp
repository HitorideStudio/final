<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Login</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
<form action="loginPro.do" method="post">
    	id:<input type="text" name ="id"/>
    	pw:<input type="password" name="pw"/>
    	<input type="submit" value="로그인"/> 
    </form>
    <button onclick="location.href='form.do'">가입하기</button><br>

