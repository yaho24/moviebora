<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<!-- 세션체크 필요 -->
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS 필요 -->
	<script type="text/javascript">
		$(document).ready(function() 
		{
			$("#myReserveList .dot").css("display", "block");
			$('#page'+${currentPage}).css(
			{
				"color" : "var(--point-color)",
				"font-weight" : "600"
			});
		});
	</script>
</head>
<body>
	<div class="container_middle">
		<!-- 프로필, 메뉴 -->
		<jsp:include page="myPageMain.jsp"></jsp:include>
		<!-- 내용 -->
		<div class="content">
			<c:if test="${list.size() == 0}">
				<ul class="noItems">
					<li>
						<span class="txt_title"> 평가한 영화가 없습니다 </span>
					</li>
				</ul>
			</c:if>
			<c:if test="${list.size() != 0}">
				<h3>취향분석 ${total}</h3>
				<ul>
					<li>
						<div class="txt_area">
							취향 장르, 취향 분석 표 넣기
						</div>
					</li>
				</ul>
			</c:if>
		</div>
	</div>
</body>
</html>