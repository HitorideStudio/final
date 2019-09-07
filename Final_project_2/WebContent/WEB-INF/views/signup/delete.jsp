<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴_프로젝트2</title>
</head>
<body>
	<form name=deleteForm action="deletePro.do" method="post">
		회원탈퇴<br/>
		비밀번호:<input type="password" name="pw">
		<input type="submit" value="회원탈퇴">
		<input type="button" value="취소" onclick="jacascript:window.location='testloginout.do'">
	</form>
</body>
</html>