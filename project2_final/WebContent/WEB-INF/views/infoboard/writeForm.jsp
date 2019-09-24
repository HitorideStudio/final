<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<title>마커 댓글</title>

<script type="text/javascript">
	function replyWrite(){
		var form = $("#writeForm")[0];
		var data = new FormData(form);
		$.ajax({
			url: "writePro.do",
			enctype:'multipart/form-data',
			type:"post",
			processData: false,
			contentType: false,
			cache: false,
			data: data,
			success: function(data){
				location.reload();
				}
			})
		}
</script>
</head>
<body>
${placename } 
${place}<br>

<c:if test="${count == 0 }">
		아직 댓글이 없어요
</c:if>
<table border="1" width=700 cellpadding="0" cellspacing="0" align="center">
	<tr height ="30">
		<td align="center"  width="100"  >사진</td>
		<td align="center"  width="250"  >댓글</td>
		<td align="center"  width="100"  >작성자</td>
		<td align="center"  width="100"  >작성일</td>    
	</tr>

<c:forEach items="${revo }" var="vo">
<tr>
	<td align="center"  width="100"  >
	<c:if test="${!vo.i_img.equals('notpicture') }">
		<img src="${vo.i_img }" width=100px>
	</c:if>
	<c:if test="${vo.i_img.equals('notpicture') }">
		사진없음
	</c:if>
	</td>
	<td align="center"  width="250"  >${vo.i_content }</td>
	<td align="center"  width="100"  >${vo.i_id }</td>
	<td align="center"  width="100"  >${vo.i_reg }</td>
	</tr>
</c:forEach>
</table>
<!-- 댓글 입력 폼 -->
<c:choose>
	<c:when test="${sessionScope.memId==null }">
		<input type="button" value="로그인 후 댓글 쓰기 가능" onclick="location='/project2_final/signup/login.do'"/> 
	</c:when>
<c:otherwise>
	<form action ="javascript:replyWrite()" method="post" enctype="multipart/form-data" id="writeForm">
 		<input type="hidden" name="i_shop" value="${number }"/>
 		<input type="hidden" name="i_placename" value="${placename }"/>
		<input type="hidden" name="i_id" value="${sessionScope.memId }" />
 		<input type ="file" name="i_img"/>
 		<textarea name="i_content" rows="2" cols="50" placeholder="댓글을 입력해 주세요"></textarea>
 		
 		<input type="submit" value="작성하기"/><br/>
 	</form>
</c:otherwise>
</c:choose>

</body>
</html>