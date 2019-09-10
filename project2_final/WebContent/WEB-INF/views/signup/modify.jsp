<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify_project2</title>
</head>
<body>
<form action ="modifyPro.do" method="post" enctype="multipart/form-data">
 	id : ${vo.id}<br/>
 	pw : <input type ="password" name="pw" value="${vo.pw}"/><br/>
 	name : <input type ="text" name="name" value="${vo.name}"/><br/>
 	img:<img src="/Final_project_2/imgs/${vo.img}" width="150"/> 
 	<input type ="file" name="img"><br/>
 	<input type="hidden" name="org" value="${vo.img}"/><br/>
 	<input type="submit" value="수정하기"/><br/>
</form>
</body>
</html>