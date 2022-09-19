<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 세션체크 필요 -->
	<link rel="stylesheet" type="text/css" href="../../myPageMainCSS.css">
	<script type="text/javascript">
		function showCon(id) 
		{
			location.href = id + ".do";
		}
	</script>
<!-- 프로필, 메뉴 -->
<div class="menu">
	<ul>
		<!-- 프로필 영역 -->
		<li>
			<img alt="프로필사진" src="0.png"> <!-- ${member.memberNo} -->
			<!-- 프로필 사진 -->
		</li>
		<li class="profile_txt">
			<h2>${member.memberNickname}</h2>
			<a href="../member/updateForm.na?mno=${member.memberNo}">
				<img alt="연필" src="../../images/icons/write-gray.png">
				<span>내 정보 수정</span>
			</a>
		</li>
		<!-- 메뉴 영역 -->
		<li class="category">
			<ul>
				<li id="myStars" onclick="showCon(this.id)">
					<span class="dot"></span><img alt="별점" src="../../images/icons/my_bookmark.png">별점<span class="point-color">${bmTotal}</span>
				</li>
				<li id="myReview" onclick="showCon(this.id)">
					<span class="dot"></span><img alt="리뷰" src="../../images/icons/buy_list.png">리뷰
				</li>
				<li id="myRecommend" onclick="showCon(this.id)">
					<span class="dot"></span><img alt="취향" src="../../images/icons/regist_display.png">취향분석
				</li>
			</ul>
		</li>
	</ul>
</div>