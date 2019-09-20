<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마커 댓글</title>
</head>
<body>
${number } ${placename } 
${place}

	<form action ="writePro.do" method="post" enctype="multipart/form-data">
 		<input type="hidden" name="i_shop" value="${number }"/>
 		<input type="hidden" name="i_placename" value="${placename }"/>
		<input type="hidden" name="i_id" value="${sessionScope.memId }" />
 		<input type ="file" name="i_img">
 		<textarea name="i_content" rows="2" cols="50" >${number }</textarea>
 		
 		<input type="submit" value="작성하기"/><br/>
 	</form>

</body>
</html>