<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<!-- 세션체크 해야함 -->
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css 지워둠, 적용시켜야함 -->
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
						<!-- myPage에 영화평점매긴 리스트 -->
						<table>
							<tr>
								<th>영화이름</th>
								<th>별점</th>
							</tr>
							<c:forEach items="${starsList}" var="stars">
								<tr>
									<td><a href="/semojeon/views/display/dpView.do?dno=${stars.movieName}">${stars.movieName}</a></td>
									<td><a href="/semojeon/views/display/dpView.do?dno=${bookmark.dno}">${bookmark.spot}</a></td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
				</li>
				<li>
					<h3> 리뷰 목록 </h3>
					<c:if test="${bmList.size() == 0}">
					<!-- bmList.size에 해당하는 list 생성 -->
						<p>북마크한 전시가 없습니다.</p>
					</c:if>
					<c:if test="${bmList.size() != 0}">
						<a href="myReview.do">+ 자세히</a>
						<!-- myPage에 영화평점매긴 리스트 -->
						<table>
							<tr>
								<th>전시명</th>
								<th>장소</th>
							</tr>
							<c:forEach items="${bmList}" var="bookmark">
								<tr>
									<td><a href="/semojeon/views/display/dpView.do?dno=${bookmark.dno}">${bookmark.dname}</a></td>
									<td><a href="/semojeon/views/display/dpView.do?dno=${bookmark.dno}">${bookmark.spot}</a></td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
				</li>
				<li>
					<h3> 추천 영화 </h3>
					<c:if test="${dpList.size() == 0}">
						<p> 추천 할 영화가 없습니다 </p>
					</c:if>
					<c:if test="${dpList.size() != 0}">
						<a href="myRecommend.do">+ 자세히</a>
						<table>
							<tr>
								<th>전시명</th>
								<th>장소</th>
							</tr>
							<c:forEach items="${dpList}" var="display">
								<tr>
									<td><a href="/semojeon/views/display/dpView.do?dno=${display.dno}">${display.dname}</a></td>
									<td><a href="/semojeon/views/display/dpView.do?dno=${display.dno}">${display.spot}</a></td>
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