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
						<a href="myStars.do">+ 자세히</a>
						<!-- myPage에 영화평점매긴 리스트 목록 링크 -->
						<table>
							<tr>
								<th>영화</th>
								<th>별점</th>
							</tr>
							<c:forEach items="${starsList}" var="stars">
								<tr>
									<td><!-- a태그로 영화상세페이지로 링크걸기 -->${stars.movieNo}</td>
									<td><!-- href="/semojeon/views/display/dpView.do?dno=${stars.movieNo} -->${stars.score}</td>
								</tr>
								<!-- 4개만 영화 및 별점 출력, 앞부분 링크는 눌렀을때 영화 상세페이지, 내용은 movieNo에 대한 이미지로 구성?, 밑은 점수 -->
							</c:forEach>
						</table>
					</c:if>
				</li>
				<li>
					<h3> 리뷰 목록 </h3>
					<c:if test="${reviewList.size() == 0}">
						<p> 리뷰 기록이 없습니다 </p>
					</c:if>
					<c:if test="${reviewList.size() != 0}">
						<a href="myReview.do">+ 내 리뷰 목록</a>
						<!-- myPage에 리뷰 전체 목록 링크(여기는 얘가 메인) -->
						<table>
							<tr>
								<th>영화</th>
								<th>리뷰제목</th>
							</tr>
							<c:forEach items="${reviewList}" var="review">
								<tr>
									<td>${review.subject}</td>
									<td>${review.content}</td>
									<!-- 리뷰한 영화 목록 4개만 출력, 앞부분 링크는 눌렀을때 영화 상세페이지로 이동 아래줄은 리뷰상세페이지로 이동, 내용은 영화 이미지 + 리뷰제목 -->
								</tr>
							</c:forEach>
						</table>
					</c:if>
				</li>
				<li>
					<h3> 추천 영화 </h3>
					<c:if test="${recommendList.size() == 0}">
					<!-- 추천 리스트 뭐로 할건지 생각 -->
						<p> 추천 할 영화가 없습니다 </p>
					</c:if>
					<c:if test="${recommnedList.size() != 0}">
						<a href="myRecommend.do">+ 자세히</a>
						<!-- 얘를 타고 넘어가면 장르별로 추천? 아니면 그냥 그대로 장르 하나만 선정해서 추천? -->
						<table>
							<tr>
								<th>장르</th>
								<th>추천영화</th>
							</tr>
							<c:forEach items="${recommendList}" var="recommend">
								<tr>
									<td>${recommend.genre}</td>
									<td><!-- 위는말고 아래만 링크걸기 -->${recommend.movieNo}</td>
									<!-- 얘도 앞에는 영화 상세페이지로 이동, 내용은 장르 + 영화이미지 -->
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