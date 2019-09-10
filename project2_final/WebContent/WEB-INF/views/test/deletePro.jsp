<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${check==1}">
	<script>
		alert("삭제완료..마음 바뀌면 다시 가입하세요");
		
	</script>
	
	<c:redirect url="main.do"></c:redirect>
</c:if>

<c:if test="${check!=1}">
	<script>
		alert("비번아닌데용");
		history.go(-1);
	</script>
</c:if>