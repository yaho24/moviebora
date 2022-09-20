<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
<div class="container">
	<h1 class="title">아이디 찾기 결과</h1>
		<c:if test="${member != null }">
			아이디는 ${member.id } 입니다.
		</c:if>

		<c:if test="${member == null }">
			존재하지 않는 회원정보 입니다.
		</c:if>
</div>
		
</body>
</html>