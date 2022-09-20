<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container {
	width: 1192px;
	font-size: 0;
}

.find{
	width: 566px;
	display: inline-block;
}

.find-id{
	margin-right: 60px;
}

</style>
</head>
<body>
<div class="container">
	<div class="find find-id">
		<h1 class="title">아이디 찾기</h1>
		<form action="findIdResult.do" method="post">		
			<input type="text" name="name" placeholder="이름" required="required"> 
			<input type="email" name="email" placeholder="이메일" required="required"> 
			<input type="submit" class="btn" value="아이디 찾기">
		</form>
	</div>

	<div class="find find-password">
		<h1 class="title">비밀번호 찾기</h1>
		<form action="findPwResult.do" method="post">
			<input type="email" name="id" placeholder="아이디" required="required" > 
			<input type="text" name="name" placeholder="이름" required="required" > 
			<input type="submit" class="btn" value="비밀번호 찾기">
		</form>
	</div>
</div>
</body>
</html>