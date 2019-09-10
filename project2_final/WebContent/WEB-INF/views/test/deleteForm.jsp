<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

	<form name=deleteForm action="deletePro.do" method="post">
		회원탈퇴<br/>
		비밀번호:<input type="password" name="pw">
		<input type="submit" value="회원탈퇴">
		<input type="button" value="취소" onclick="jacascript:window.location='main.do'">
		
	
	</form>
