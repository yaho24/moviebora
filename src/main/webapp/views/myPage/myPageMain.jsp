<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 세션체크 자리 -->
<link rel="stylesheet" type="text/css" href="../../myPageMainCSS.css">
<script type="text/javascript">
	function showCon(id) 
	{
		location.href = id + ".yo";
	}
</script>
<!-- 프로필, 메뉴 -->
<div class="menu">
	<ul>
		<!-- 프로필 영역 -->
		<li>
			<img alt="프로필사진" src="0.png"><!-- 멤버번호로 링크걸것 -->
		</li>
		<li class="profile_txt">
			<h2>${member.memberNickname}</h2>
			<a href="../member/updateForm.na?memberNo=${member.memberNo}">
				<img alt="연필" src="../../images/icons/write-gray.png">
				<span>내 정보 수정</span>
			</a>
		</li>
		<!-- 메뉴 영역 -->
		<li class="category">
			<ul>
				<li id="myStars" onclick="showCon(this.id)">
					<span class="dot"></span><!-- 별이미지 -->별점목록<span class="point-color">${starsTotal}</span>
				</li>
				<li id="myReview" onclick="showCon(this.id)">
					<span class="dot"></span><!-- 리뷰이미지 -->리뷰목록<span class="point-color">${reviewTotal}</span>
				</li>
				<li id="myRecommend" onclick="showCon(this.id)">
					<span class="dot"></span><!-- 취향분석이미지 -->취향분석
				</li>
			</ul>
		</li>
	</ul>
</div>