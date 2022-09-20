<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="sessionChk.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	input { margin-bottom: 16px;
}
/* 프로필 */
#image_container {
	width: 200px;
	height: 200px;
}

#image_container img{
	width:100%; 
	height:100%;
	border-radius: 100px;
	object-fit: cover;
}

.profile{
	display: flex;
	align-items: center;
	flex-direction: column;
}

.file_profile {
	display: inline-block;
	border: none;
	outline: 0;
	font-size: 15px;
	text-align: center;
	color: var(--point-color);
	cursor: pointer;
	padding: 10px 12px;
}

input[type="file"] { /* input 사라지게 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip:rect(0,0,0,0);
}

/* 탈퇴버튼 */
#del-btn{
    text-align: center;
    color: #aaaaaa;
    text-decoration: underline;
    font-size: 13px;
    cursor: pointer;
}
</style>


<script type="text/javascript">

/* 별명 중복체크 */
function chkNick_nm(){
	if(!frm.nick_nm.value) {
		alert("별명을 입력하세요")
		frm.nick_nm.focus();
		return false;
	}else{
		$.post("confirmNick_nm.do", "nick_nm="+frm.nick_nm.value, function(data){
			$('#err').html(data);
			var substring = "사용중인";
			if(data.includes(substring)){
			frm.nick_nm.value="";
			return false;
			}
		});
	}
}

/* 비밀번호 일치여부 확인 */
function chkPassword() {
	if(frm.password.value!=frm.confirmPassword.value){
		alert("비밀번호가 일치하지 않습니다")
		frm.password.focus();
		frm.password.value="";
		frm.confirmPassword.value="";
		return false;
	}
}

/* 별명중복확인 */ 
function chk(){
	$.post("confirmNick_nm.do", "nick_nm="+frm.nick_nm.value, function(data){
		var substring = "사용중인";
		if(data.includes(substring)){
			frm.nick_nm.value="";
			frm.nick_nm.focus;
			return false;
		}
	});
} 

/* 프로필 미리보기 */
function setProfile(event) {
	var reader = new FileReader();
	
	reader.onload = function(event) {
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		img.setAttribute("width",200);
		img.setAttribute("height",200);
		
		$('#image_container img').remove();
		document.querySelector("div#image_container").appendChild(img);
	};
	reader.readAsDataURL(event.target.files[0]);
}

/* 회원탈퇴 */
function del() {
	var con = confirm("탈퇴 하시겠습니까?");
	if(con) location.href="delete.do";
	else alert("탈퇴가 취소 되었습니다.");
}
</script>
</head>
<body>
<div class="container">
	<h1 class="title">회원정보 수정</h1>

	<form action="updateResult.do?prevUrl=${prevUrl }" method="post" name="frm" onsubmit="chk()" enctype="multipart/form-data">
		<!-- 엔터키 전송 막기 -->
		<div style="display:none">
			<input type="submit" onclick="return false"/>
			<input type="text"/>
		</div>
			
			<!-- 프로필 -->
			<div class="profile">
				<div id="image_container">
					<img src="/movieboraSeo/upload/${member.profile }" alt="프로필사진">
				</div> 														<!-- 프로필 경로 설정 -->
				<label for="f1" class="file_profile">프로필 사진 업로드</label>
				<input type="file" id="f1" name="profile" onchange="setProfile(event)" value="${member.profile}">
			</div>
			<!-- 아이디 -->
			<input type="text" name="id" readonly="readonly" value="${member.id }" placeholder="${member.id }">
			
			<!-- 비밀번호 -->
			<input type="password" name="password" placeholder="비밀번호" required="required" > 
			<input type="password" name="confirmPassword" placeholder="비밀번호 확인" required="required" onChange="chkPassword()"> 
			
			<!-- 이름 -->
			<input type="text" name="name" value="${member.name }" placeholder="${member.name }">

			<!-- 별명 -->
			<div class="check">
				<input type="text" name="nick_nm" value="${member.nick_nm }" placeholder="${member.nick_nm }" onChange="chkNick_nm()" required="required">
				<input type="hidden" name="checked_nick" value="">
				<div class="chk-msg" id="err"></div>
			</div>
			
			<!-- 연락처 -->
			<input type="tel" name="phone" value="${member.phone }" placeholder="${member.phone }">
			
			<!-- 성별 -->
			<div class= "select-gender">
				<input class="magic-radio" type="radio" name="gender" id="mal" value="m" checked="<c:if test="${member.gender=='m'}">checked</c:if>">
				<label for="mal" class="radio-left">남자</label>
				<input class="magic-radio" type="radio" name="gender" id="fem" value="f" checked="<c:if test="${member.gender=='f'}">checked</c:if>">
				<label for="fem" >여자</label>
			</div>
			<!-- button -->
			<input type="submit" class="btn submit-btn" value="회원정보 수정">
			<a id="del-btn" onclick="del()">회원탈퇴</a>
	</form>
</div>
</body>
</html>