<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result>0 }">
	<script type="text/javascript">
		var preUrl = document.referrer.split("/")[6];
		alert("탈퇴처리 되었습니다");
			
		if(preUrl == "adminMember.do") {
			history.back();
		}else if (preUrl == "updateForm.do") {
			location.href="/index.jsp";
		}
	</script>
</c:if>

<c:if test="${result==0 }">
	<script type="text/javascript">
		alert("탈퇴 실패\n다시 시도해주세요");
		history.go(-1);
	</script>
</c:if>
</body>
</html>