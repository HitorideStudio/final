<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인게시글 입력창</title>
</head>
<body>
	<form action ="writePro.do" method="post" enctype="multipart/form-data">
 		
		<input type="hidden" name="b_id" value="${sessionScope.memId }" />
 		<input type ="file" name="b_img">
 		<textarea name="b_content" rows="2" cols="50" >${number }</textarea>
 	<input type="submit" value="작성하기"/><br/>
 	</form>


</body>
</html>