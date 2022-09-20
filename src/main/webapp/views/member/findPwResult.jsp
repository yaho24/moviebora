<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h1 class="title">비밀번호 찾기 결과</h1>
		<c:if test="${member != null }">
<!-- 이 경우 수정하기 / 아니면 비번은 8글자 이상으로 설정하기 -->
			<c:if test="${fn:length(member.password)<4}">
				비밀번호는 <strong> ${fn:substring(member.password,0,4) } 
					<c:forEach begin="1" end="${fn:length(member.password)-1 }">
					*
					</c:forEach>
				</strong> 입니다.
			</c:if>
			
			<!-- 앞에서 4글자만 보여주고 나머지는 * 처리 -->
			<c:if test="${fn:length(member.password)>=4}">
				비밀번호는 <strong> ${fn:substring(member.password,0,4) } 
					<c:forEach begin="1" end="${fn:length(member.password)-4 }">
					*
					</c:forEach>
				</strong> 입니다.
			</c:if>
		</c:if>

		<c:if test="${member == null }">
			존재하지 않는 회원정보 입니다.
		</c:if>

	</div>
</body>
</html>