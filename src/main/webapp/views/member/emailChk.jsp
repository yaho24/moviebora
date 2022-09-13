<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result > 0}">
		<script type="text/javascript">
			alert("이미 사용중이거나 탈퇴한 이메일입니다.");
		</script>
		<h2>다른 이메일를 입력하세요 *^^*</h2>
		<form action="">
			이메일 : <input type="email" name="email" required="required"
				autofocus="autofocus">
			<p>
				<input type="submit">
		</form>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("사용가능한 이메일입니다.");
			opener.frm.email.value = "${email}";
			window.close();
		</script>
	</c:if>
</body>
</html>