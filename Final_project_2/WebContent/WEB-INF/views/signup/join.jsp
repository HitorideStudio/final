<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<script language="JavaScript">
    
    function checkIt() {
        var userinput = eval("document.userinput");
        if(!userinput.id.value) {
            alert("ID를 입력하세요");
            return false;
        }
        
        if(!userinput.pw.value ) {
            alert("비밀번호를 입력하세요");
            return false;
        }
        if(userinput.pw.value != userinput.pw2.value)
        {
            alert("비밀번호를 동일하게 입력하세요");
            return false;
        }
       
        if(!userinput.username.value) {
            alert("사용자 이름을 입력하세요");
            return false;
        }
        
    }

    // 아이디 중복 여부를 판단
    function openConfirmid(userinput) {
        // 아이디를 입력했는지 검사
        if (userinput.id.value == "") {
            alert("이메일를입력하세요");
            return;
        }
        // url과 사용자 입력 id를 조합합니다.
        url = "confirmId.do?id="+userinput.id.value ;
        
        // 새로운 윈도우를 엽니다.
        open(url, "confirm",  "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
    }
</script>
<body>
	<form action ="joinPro.do" method="post" enctype="multipart/form-data" 
	name="userinput" onSubmit="return checkIt()">
 		이메일:<input type ="text" name="id"/>
 		<input type="button" name="confirm_id" value="ID중복확인" 
        							OnClick="openConfirmid(this.form)"><br/>
 		비밀번호:<input type ="password" name="pw"/><br/>
 		비밀번호확인:<input type ="password" name="pw2"/><br/>
 		닉네임:<input type ="text" name="name"/><br/>
 		프로필:<input type ="file" name="img"><br/>
 	<input type="submit" value="가입"/>
 	<input type="reset" name="reset" value="다시입력">
    <input type="button" value="가입안함" onclick="javascript:window.location='/Final_project_2/finder/main.do'">
 	<br/>
 </form>

</body>
</html>