<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<c:set var="id" value='${sessionScope.id}'></c:set>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../myPageCSS.css">
<script type="text/javascript">
	// nav active control
	$(document).ready(function() 
	{ 
		// window.onload보다 document.ready가 더 빠르고 안정적!
		var curUrl = window.location.href; // 현재 url가져오기
		var sliceUrl = curUrl.split("/"); // 필요한 부분만 슬라이스
		
		//$('.nav_main a').removeClass("active");
		$('#'+sliceUrl[5]).addClass("active");
		// alert(curUrl+" : "+sliceUrl[5]);
		// modal open
		$('#search').click(function () 
		{
			$('.modal_search').show();
			$('html body').css('overflow', 'hidden');
			$('input[name=srch]').val('');
		});
		
		// modal close
		$('.close, .dim_box').on('click', function() 
		{
			$('.modal_search').hide();
			$('html body').css('overflow', 'auto');
		});
	});
	
	function ssChk(name) 
	{
		if (${empty id}) 
		{
			var con = confirm("로그인 후 이용해 주시기 바랍니다.");
			
			if (con) 
			{
				if (name == 'main') 
				{
					location.href = "/moviebora/views/myPage/myPage.yo";
				} 
				else if (name == 'book') 
				{
					location.href = "/semojeon/views/myPage/myBookmarkList.wo";
				}
			} 
		} 
		else 
		{
			if (name == 'main') 
			{
				location.href = "/moviebora/views/myPage/myPage.yo";
			}
			else if (name == 'book') 
			{
				location.href = "/semojeon/views/myPage/myBookmarkList.wo";
			}
		}
	}
</script>
</head>
<body>   
	<header>
		<div class='header_inner'>
			<div class='header_logo'>
				<img alt="header로고" src='mvLOGO.jpg'>
			</div>
			<nav>
				<ul class='nav_sub'>
					<c:if test="${empty id }">
						<li><a href="/semojeon/views/member/loginForm.na">로그인</a></li>
						<li><a href="/semojeon/views/member/joinForm.na">회원가입</a></li>
					</c:if>
					<c:if test="${not empty id }">
						<c:if test="${id != 'admin'}">
							<li><a href="/semojeon/views/member/logout.na">로그아웃</a></li>
						</c:if>
						<c:if test="${id == 'admin'}">
							<li><a href="/semojeon/views/member/logout.na">로그아웃</a></li>
							<li><a href="/semojeon/views/admin/adminMain.na">관리자페이지</a></li>
						</c:if>
					</c:if>
				</ul>
				<ul class='nav_main'>
					<li><a href="/moviebora/views/myPage/myRecommend.yo" id="display">영화목록</a></li>
					<li><a id="myPage" onclick="return ssChk('main')">마이페이지</a></li>
					<li><a id="search"><img alt="검색" src="/semojeon/images/icons/search.png"></a></li>
				</ul>
			</nav>
		</div>
	</header>
	
	<!-- 검색 모달 -->
	<div class="modal_search">
		<img class="close" src="/semojeon/images/icons/close.png"></img>
		<div class=modal_content>
			<div class="input_area">
				<form action="/semojeon/views/searchResult.wo" method="post">
					<input type="text" name="srch" placeholder="검색어를 입력해주세요">
					<button type="submit">검색</button>
				</form>
			</div>
		</div>
	</div>
</body>

</html>