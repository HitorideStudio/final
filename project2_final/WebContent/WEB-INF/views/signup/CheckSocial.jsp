<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>	
	<c:when test="${check ==0 }">
			<c:redirect url="joinPro2.do" >
				<c:param name="id" value="${vo.id }"></c:param>
				<c:param name="pw" value="${vo.pw }"></c:param>
				<c:param name="img" value="${vo.img }"></c:param>
				<c:param name="name" value="${vo.name }"></c:param>
			</c:redirect>	
	</c:when>
	<c:otherwise>
		<c:redirect url="loginPro.do">
				<c:param name="id" value="${vo.id }"></c:param>
				<c:param name="pw" value="${vo.pw }"></c:param>
			</c:redirect>	
	</c:otherwise>
</c:choose>
