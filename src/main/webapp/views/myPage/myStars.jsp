<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<!-- 세션체크 필요 -->
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- CSS -->
	<script type="text/javascript">
		$(document).ready(function() 
		{
			$("#myBookmarkList .dot").css("display", "block");
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
			<c:if test="${starsPageList.size() == 0}">
				<ul class="noItems">
					<li>
						<span class="txt_title"> 별점이 없습니다 </span>
					</li>
				</ul>
			</c:if>
			<c:if test="${starsPageList.size() != 0}">
				<h3> 별점 평가한 영화 ${total} </h3>
				<ul>
					<c:forEach var="starsP" items="${starsPageList}">
						<li>
							<a href="../display/dpView.do?dno=${starsP.movieNo}">
								<img alt="포스터" src="/semojeon/upload/${starsP.movieNo}"> 
							</a>
							<div class="txt_area">
								<a href="../display/dpView.do?dno=${starsP.movieNo}" class="cursor">
								<!-- 영화번호에 맞는 영화 상세페이지이동? -->
									<span class="txt_title"><span>영화제목</span>${starsP.movieName}</span>
									<span class="txt"><span>장르</span>${starsP.movieGenre}</span>
									<span class="txt"><span>감독</span>${starsP.movieDirector}</span>
									<span class="txt"><span>점수</span>${starsP.score}</span>
								</a>
								<!-- pre 태그 안에 있는 css 요소 삭제 -->
								<script type="text/javascript">
									$(".txt_pre").find("*").css(
									{
										"font-family" : "inherit",
										"color" : "#000"
									});
								</script>
							</div>
						</li>
					</c:forEach>
				</ul>
			</c:if>
		</div>

		<!-- paging -->
		<div class="paging">
			<div class="items">
				<div class="prev_btn">
					<c:if test="${startPage > PAGE_PER_BLOCK}">
						<button class="first" onclick="location.href='myStars.yo?pageNum=${startPage - 1}'">
							<img alt="이전" src="../../images/icons/arrow_left1.png">
							<img alt="이전" src="../../images/icons/arrow_left1.png">
						</button> 
					</c:if>
					<c:if test="${pageNum > 1}">
						<button class="prev" onclick="location.href='myStars.yo?pageNum=${currentPage - 1}'">
							<img alt="이전" src="../../images/icons/arrow_left1.png">
						</button>
					</c:if>
				</div>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<span id="page${i}" class="page_num" onclick="location.href='myStars.yo?pageNum=${i}'">${i}</span>
				</c:forEach>
				<div class="next_btn">
					<c:if test="${currentPage < totalPage}">
						<button class="next" onclick="location.href='myStars.yo?pageNum=${currentPage + 1}'">
							<img alt="다음" src="../../images/icons/arrow_right.png">
						</button>
					</c:if>
					<c:if test="${endPage < totalPage}">
						<button class=last onclick="location.href='myStars.yo?pageNum=${endPage + 1}'">
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