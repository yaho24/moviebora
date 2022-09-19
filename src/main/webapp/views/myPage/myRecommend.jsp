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
		<!-- 취향분석을 위나 아래에 두고, 나머지 페이징해서 리스트 출력? -->
			<c:if test="${starsPageList.size() == 0}">
				<ul class="noItems">
					<li>
						<span class="txt_title"> 평가한 영화가 없습니다 </span>
					</li>
				</ul>
			</c:if>
			<c:if test="${starsPageList.size() != 0}">
				<h3>취향분석 ${total}</h3>
				<ul>
					<li>
						<div class="txt_area">
							취향 장르 텍스트로 안내, 취향 분석 표 안내
						</div>
						<div>
							취향 분석 표? 별점 분포도 이런거
						</div>
					</li>
				</ul>
			</c:if>
		</div>
		
		<!-- paging -->
		<div class="paging">
			<div class="items">
				<div class="prev_btn">
					<c:if test="${startPage > PAGE_PER_BLOCK}">
						<button class="first" onclick="location.href='myRecommend.yo?pageNum=${startPage - 1}'">
							<img alt="이전" src="../../images/icons/arrow_left1.png">
							<img alt="이전" src="../../images/icons/arrow_left1.png">
						</button> 
					</c:if>
					<c:if test="${pageNum > 1}">
						<button class="prev" onclick="location.href='myRecommend.yo?pageNum=${currentPage - 1}'">
							<img alt="이전" src="../../images/icons/arrow_left1.png">
						</button>
					</c:if>
				</div>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<span id="page${i}" class="page_num" onclick="location.href='myRecommend.yo?pageNum=${i}'">${i}</span>
				</c:forEach>
				<div class="next_btn">
					<c:if test="${currentPage < totalPage}">
						<button class="next" onclick="location.href='myRecommend.yo?pageNum=${currentPage + 1}'">
							<img alt="다음" src="../../images/icons/arrow_right.png">
						</button>
					</c:if>
					<c:if test="${endPage < totalPage}">
						<button class=last onclick="location.href='myRecommend.yo?pageNum=${endPage + 1}'">
							<img alt="다음" src="../../images/icons/arrow_right.png">
							<img alt="다음" src="../../images/icons/arrow_right.png">
						</button> 
					</c:if>
				</div> <!-- next_btn -->
			</div> <!-- number -->
		</div> <!-- paging -->
	</div>
</body>
</html>