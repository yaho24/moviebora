<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
	<form action="login.do">
		<table border="1"><caption>로그인</caption>
			<tr>
				<th>이메일</th>
				<td colspan="2" align="center"><input type="email" name="email" required="required"	placeholder="이메일"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td colspan="2" align="center"><input type="password" name="pass" required="required" placeholder="비밀번호"></td>
			</tr>
			<tr>
				<td align="center"><a href="joinForm.do">회원가입</a></td>
				<td align="center"><input type="submit" value="로그인"></td>
				<td align="center"><a href="findPassForm.do">비밀번호 찾기</a></td>
			</tr>
		</table>
	</form>
</body>
</html>