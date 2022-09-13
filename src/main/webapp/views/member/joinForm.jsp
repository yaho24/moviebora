<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk() {
		if (frm.pass.value != frm.password2.value) {
			alert("비밀번호를 다시 입력하세요.");
			frm.password.focus();
			return false;
		}
	}
	function emailChk() {
		if (!frm.email.value) {
			alert("이메일을 입력하세요.");
			frm.email.focus();
			return;
		}
		window.open("emailChk.do?email=" + frm.email.value, "", "width=500 height=200");
	}
</script>
</head>
<body>	
<form action="join.do" method="post" name="frm" onsubmit="return chk()">
	<table border="1"><caption>회원가입</caption>
		<tr><th>이메일</th><td width="60%" align="left">
		<input type="email" name="email" required="required" placeholder="사용할 이메일을 입력하세요.">
		<input type="button" value="중복체크" onclick="emailChk()"></td></tr>
		<tr><th>이름</th><td colspan="2"><input type="text" name="memName" required="required" 
						placeholder="이름을 입력하세요."></td></tr>
		<tr><th>별명</th><td colspan="2"><input type="text" name="memName" required="required" 
						placeholder="별명을 입력하세요."></td></tr>
		<tr><th>비밀번호</th><td colspan="2"><input type="password" name="pass" required="required" 
						placeholder="비밀번호를 입력하세요."></td></tr>
		<tr><th>비밀번호 확인</th><td colspan="2"><input type="password" name="password2" required="required"
						 placeholder="비밀번호를 한번 더 입력하세요."></td></tr>		
		<tr><th>성별</th><td><label for="g1">남자</label><input type="radio" name="gender" id="g1" value="남자">
				<label for="g2">여자</label><input type="radio" name="gender" id="g2" value="여자"></td></tr>
		<tr><th>프로필</th><td><textarea rows="5" cols="50"></textarea>
		<tr><td colspan="3" align="center" id="check"> <input type="submit" value="가입하기"></td></tr>
	</table>
</form>
</body>
</html>