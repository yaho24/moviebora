<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
/* 아이디 중복체크 및 인증메일 전송 */
function chkEmail(){
	/* 이메일 유효성 검사 */
	var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	if(!frm.email.value) {
		alert("이메일을 입력하세요")
		frm.email.focus();
		return false;
	}else{
		if(!reg_email.test(frm.email.value)){
			alert("올바른 이메일 형식이 아닙니다.");
			frm.email.focus();
			return false;
		}else{
			$.post("confirmEmail.do", "email="+frm.email.value, function(data){
				$('#err_Email').html(data);
			});
		} 
	}
}
function chkId(){
	if(!frm.id.value) {
		alert("아이디를 입력하세요");
		frm.id.focus();
		return false;
		}else{
			$.post("confirmId.do", "id="+frm.id.value, function(data){
				$('#err_Id').html(data);
			});
		} 
	}

function chkPass(){
	var pw = $("#password").val();
	if(pw.length<8) {
		$('#err_pass').html("8자리 이상 입력해주세요");
		frm.password.focus();
		frm.password.value="";
		return false;
	}else {
		$('#err_pass').html("사용가능한 비밀번호입니다");
	}
}

/* 비밀번호 확인 일치여부 체크 */
function chkPassword() {
	if(frm.password.value!=frm.confirmPassword.value){
		alert("비밀번호가 일치하지 않습니다")
		frm.password.focus();
		frm.password.value="";
		frm.confirmPassword.value="";
		return false;
	}
}

/* 별명 중복체크 */
function chkNick_nm(){
	if(!frm.nick_nm.value) {
		alert("별명을 입력하세요")
		frm.nick_nm.focus();
		return false;
		}	else {
	$.post("confirmNick_nm.do", "nick_nm="+frm.nick_nm.value, function(data){
		$('#err').html(data);	
	});	
		}
}

</script>
</head>
<body>

	<form action="join.do" method="post" name="frm" onsubmit="return chkPassword()">
		<!-- 엔터키 전송 막기 -->
		<div style="display:none">
			<input type="submit" onclick="return false">
			<input type="text">
		</div>
		
		
		<div class="container">
			<h1 class="title">회원가입하기</h1>						
			<!-- 아이디 -->
			<div>
				<input type="text" name="id" class="inputBox-left" placeholder="아이디"  autofocus="autofocus" required="required" > 
				<a class="chk-btn" onclick="chkId()" ><button>아이디 확인</button></a>
				<div class="chk-msg" id="err_Id"></div>
			</div>		
				<!-- 이메일 -->
			<div class="check">
				<input type="email" name="email" class="inputBox-left"  placeholder="이메일" required="required"> 
				<a class="chk-btn" onclick="chkEmail()" ><button>이메일 확인</button></a>
				<div class="chk-msg" id="err_Email"></div>
			</div> 			
			<!-- 비밀번호 -->
			<div class="check">
				<input type="password" name="password" id="password" placeholder="비밀번호" required="required" onChange="chkPass()"> 
				<div class="chk-msg" id="err_pass"></div>
			</div>
				<input type="password" name="confirmPassword" id="confirmPassword" placeholder="비밀번호 확인" required="required" > 
			<!-- 이름 -->
			<div>
				<input type="text" name="name" placeholder="이름" required="required">
			</div>
			<!-- 별명 -->
			<div class="check">
				<input type="text" name="nick_nm" placeholder="별명">
				<a class="chk-btn" onclick="chkNick_nm()" ><button>별명 확인</button></a>
				<div class="chk-msg" id="err"></div>
			</div>
			<!-- 성별 -->
			<div class= "select-gender">
				<input class="magic-radio" type="radio" name="gender" id="mal" value="m" checked="checked">
				<label for="mal" class="radio-left">남자</label>
				<input class="magic-radio" type="radio" name="gender" id="fem" value="f">
				<label for="fem" >여자</label>
			</div>
			</div>
			<!-- 프로필 -->
			<div class="profile">
				<textarea rows="5" cols="40" name="content" placeholder="프로필 적기"></textarea>
			</div>
			<!-- 회원가입 버튼 -->
			<input type="submit" class="btn submit-btn" value="회원가입">
	</form>
</body>
</html>