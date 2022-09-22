<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<!-- 세션체크 해야함 -->
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="../../myPageCSS.css">
</head>
<body>
	<div class="container_middle">
		<!-- 프로필, 메뉴 -->
		<jsp:include page="myPageMain.jsp"></jsp:include>
		<!-- 내용 -->
		<div class="content">
			<ul class="content_main">
				<li>
					<h3> 별점 리스트 </h3>
					<c:if test="${starsList.size() == 0}">
						<p> 별점 기록이 없습니다 </p>
					</c:if>
					<c:if test="${starsList.size() != 0}">
						<a href="myStars.yo">+ 자세히</a>
						<!-- myPage에 영화평점매긴 리스트 -->
						<table>
							<tr>
								<th>영화이름</th>
								<th>별점</th>
							</tr>
							<c:forEach items="${starsList}" var="stars" varStatus="starsIndex">
								<tr>
									<td><!-- 대충 a링크로 영화번호 넣어서 영화상세페이지로 이동 -->${movieNameList[starsIndex.index]}</td>
									<td>${stars.score}</td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
				</li>
				<li>
					<h3> 리뷰 목록 </h3>
					<c:if test="${empty reviewList}">
						<p> 작성된 리뷰가 없습니다 </p>
					</c:if>
					<c:if test="${not empty reviewList}">
						<a href="myReview.yo">+ 자세히</a>
						<!-- myPage에 영화리뷰남긴 리스트 -->
						<table>
							<tr>
								<th>리뷰제목</th>
								<th>리뷰내용</th>
							</tr>
							<c:forEach items="${reviewList}" var="review">
								<tr>
									<td><!-- 위 아래 둘다 리뷰페이지로 이동 review.memberNo 갖고? -->${review.reviewSubject}</td>
									<td>${review.reviewContent}</td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
				</li>
				<li>
					<h3> 추천 영화 </h3>
					<c:if test="${recommendList.size() == 0}">
						<p> 추천 할 영화가 없습니다 </p>
					</c:if>
					<c:if test="${recommendList.size() != 0}">
						<a href="myRecommend.yo">+ 자세히</a>
						<table>
							<tr>
								<th>영화장르</th>
								<th>영화포스터 및 제목</th>
							</tr>
							<c:forEach items="${recommendList}" var="recommend">
								<tr>
									<td><!-- 해당영화장르 목록으로 이동 -->${recommend.movieGenre}</td>
									<td><!-- 해당 영화 상세페이지로 이동 -->${recommend.movieName}</td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>