<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트</title>
</head>
<body>

<img src="/Final_project_2/imgs/${vo.img}" width="250"/><br/>
<b>${sessionScope.memId }</b><br/>
${vo.name}

<button onclick="window.location='modify.do'">수정</button>
<button onclick="window.location='logout.do'">로그아웃</button>
<button onclick="window.location='delete.do'">탈퇴</button>

</body>
</html>