<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function IdChk() {
		if(!frm.memberId.value){
			alert("아이디를 입력하세요")
			frm.memberId.focus();
			return false;
		}
		/* jQuery Ajax이용하는 방법 data는 confirm2.jsp를 실행한 결과 */
		$.post("confirm2.do","id="+frm.memberId.value, function(data) {
			/* #은 id, .은 클래스 #err은 아이디가 err인 곳에 data를 html형식으로 넣어라 */
			$('#err').html(data);
		});
	}
	function emailChk(){
		if(!frm.email.value){
			alert("이메일을 입력하세요");
			frm.email.focus();
			return false;
		}
	}		
		function chk() {
			if (frm.password.value != frm.confirmPass.value) {
				alert("비밀번호를 다시 입력하세요.");
				frm.password.focus();
				return false;
				}
			}
</script>
</head>
<body>	
<form action="join.do" method="post" name="frm" onsubmit="return chk()">
	<table border="1"><caption>회원가입</caption>
		<tr><th>아이디</th><td colspan="2"><input type="text" name="memberId" required="required" 
						placeholder="아이디를 입력하세요.">
			<input type="button" value="아이디 중복체크" onclick="IdChk()"></td></tr>		
		<tr><th>이름</th><td colspan="2"><input type="text" name="memberName" required="required" 
						placeholder="이름을 입력하세요."></td></tr>
		<tr><th>이메일</th><td width="60%" align="left">
		<input type="email" name="email" required="required" placeholder="사용할 이메일을 입력하세요.">
		<input type="button" value="이메일 중복체크" onclick="emailChk()"></td></tr>
		<tr><th>별명</th><td colspan="2"><input type="text" name="memberNickname" required="required" 
						placeholder="별명을 입력하세요."></td></tr>
		<tr><th>비밀번호</th><td colspan="2"><input type="password" name="password" required="required" 
						placeholder="비밀번호를 입력하세요."></td></tr>
		<tr><th>비밀번호 확인</th><td colspan="2"><input type="password" name="confirmPass" required="required"
						 placeholder="비밀번호를 한번 더 입력하세요."></td></tr>		
		<tr><th>성별</th><td><label for="g1">남자</label><input type="radio" name="gender" id="g1" value="남자">
				<label for="g2">여자</label><input type="radio" name="gender" id="g2" value="여자"></td></tr>
		<tr><th>프로필</th><td><textarea rows="5" cols="50"></textarea>
		<tr><td colspan="3" align="center" id="check"> <input type="submit" value="가입하기"></td></tr>
	</table>
</form>
</body>
</html>