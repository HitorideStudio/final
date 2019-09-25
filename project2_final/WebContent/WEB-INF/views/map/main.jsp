<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>
테스트페이지
<button onclick="window.location='/project2_final/map/welcome.do'">Go!</button>
	<form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" name="keyword" id="keyword"> 
                    <button type="submit">검색하기</button> 
                </form>


</body>
</html>