<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<c:set var="id" value='${sessionScope.id}'></c:set>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	// nav active control
	$(document).ready(function() { // window.onload보다 document.ready가 더 빠르고 안정적!
		var curUrl = window.location.href; // 현재 url가져오기
		var sliceUrl = curUrl.split("/")[6].split(".")[0]; // 필요한 부분만 슬라이스
		
		//$('.nav_main a').removeClass("active");
		$('#'+sliceUrl).addClass("active");
	}) 
</script>

</head>
<body>    
	<header>
		<div class='header_inner'>
			<div class='header_logo'>
				<a href="../admin/adminMain.na"><img src='../../images/logo.svg'></a>
			</div>
			<nav>
				<ul class='nav_sub'>
					<li><a href="../member/logout.na">로그아웃</a></li>
					<li><a href="/semojeon/views/display/dpMain.do?tab=1">세모전 홈페이지</a></li>
				</ul>
				<ul class='nav_main'>
					<li><a href="../admin/adminDisplay.na" id="adminDisplay">전시 관리</a></li>
					<li><a href="../admin/adminMember.na" id="adminMember">회원 관리</a></li>
					<li><a href="../admin/adminBoard.na" id="adminBoard">스토리 관리</a></li>
				</ul>
			</nav>
		</div>
	</header>
</body>

</html>