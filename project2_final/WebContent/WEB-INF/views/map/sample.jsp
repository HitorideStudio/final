<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">

function searchPlaces(){
	 $.ajax({
	        url:'search.do',
	        type:'get',
	        data: {keyword:$("#keyword").val()},
	        success:function(data){
	        			var address = new Array();
	        			var list = new Array();
	        			<c:forEach items="${list}" var="list">
	        			address.push("${list.address}");
	        			list.push("${list.place}");
	        			</c:forEach>
	        			alert(address[1]);
	        },
	        error:function(data){
	          alert("에러");
	        }
	    });
}
</script>
 <form onsubmit="searchPlaces(); return false;">
  키워드 : <input type="text" name="keyword" size="15"> 
<button type="submit">검색하기</button> 
</form>
</body>
</html>