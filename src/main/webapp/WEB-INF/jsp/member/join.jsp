<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="회원가입" />
<%@ include file="../part/head.jspf"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
	var MemberJoinForm__submitDone = false;
	function MemberJoinForm__submit(form) {
		if (MemberJoinForm__submitDone) {
			alert('처리중입니다.');
			return;
		}

		form.loginId.value = form.loginId.value.trim();

		form.loginId.value = form.loginId.value.replaceAll(' ', '');

		if (form.loginId.value.length < 4) {
			form.loginId.focus();
			alert('로그인 아이디 4자 이상 입력해주세요.');
			return;
		}

		form.loginPw.value = form.loginPw.value.trim();

		if (form.loginPw.value.length < 5) {
			form.loginPw.focus();
			alert('로그인 비밀번호를 5자 이상 입력해주세요.');
			return;
		}

		if (form.loginPw.value != form.loginPwConfirm.value) {
			form.loginPwConfirm.focus();
			alert('로그인 비밀번호 확인이 일치하지 않습니다.');

			return;
		}

		form.name.value = form.name.value.trim();

		if (form.name.value.length == 0) {
			form.name.focus();
			alert('이름을 입력해주세요.');

			return;
		}

		form.nickname.value = form.nickname.value.trim();

		if (form.nickname.value.length == 0) {
			form.nickname.focus();
			alert('닉네임을 입력해주세요.');

			return;
		}

		form.email.value = form.email.value.trim();

		if (form.email.value.length == 0) {
			form.email.focus();
			alert('이메일을 입력해주세요.');

			return;
		}

		if (form.cellphoneNo.value.length == 0) {
			form.cellphoneNo.focus();
			alert('휴대전화번호를 입력해주세요.');
			return;
		}

		if (form.cellphoneNo.value.length < 10) {
			form.cellphoneNo.focus();
			alert('휴대폰번호를 10자 이상 입력해주세요.');
			return;
		}

		form.loginPwReal.value = sha256(form.loginPw.value);
		form.loginPw.value = '';
		form.loginPwConfirm.value = '';

		form.submit();
		MemberJoinForm__submitDone = true;
	}

</script>

<style>
.form-signup {
	width: 100%;
	max-width: 330px;
	padding: 30px;
	margin: 0 auto;
	
	border-radius: 1rem;
}

.form-signup .checkbox {
	font-weight: 400;
}

.form-signup .form-control {
	position: relative;
	box-sizing: border-box;
	height: auto;
	padding: 3 10px;
	font-size: 14px;
}

.form-signup .form-control:focus {
	z-index: 2;
}

.form-signup input {
	margin-bottom: 20px;
	border-radius: 1rem;
}

.btn {
	border-radius: 1rem;
}

.checkbox>label {
	margin-right: 40%;
}

span {
	font-size: 12px;
}

#text {
  margin-top:30%;
}

h3 {
background: linear-gradient(to right, #5f2c82, #49a09d);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

</style>

<!--  -->
<div class="container">
  <div class="row">
    <div class="col visible-on-md-up">
      <img id="text" class="mb-5" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fc1SgIK%2FbtqIOnGsacc%2FKNPfUEarGV1n8lwYhDQHsk%2Fimg.png" width="100%" alt="">
      <h3 class="font-weight-bold">당신의 반려동물이 그렇게 귀엽다면서요?</h3>
      &nbsp 
      <h3 class="font-weight-bold">전세계에 있는 사람들에게 자랑해보세요!</h3>
    </div>
    <div class="col">
      <form class="form-signup text-center shadow" method="POST"
		action="doJoin"
		onsubmit="MemberJoinForm__submit(this); return false;">
  
		<input type="hidden" name="redirectUri" value="/usr/home/login">
		<input type="hidden" name="loginPwReal"> <img
			class="mb-4 mt-2 shadow-sm rounded-circle"
			src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FkTvFl%2FbtqIVHwUIcT%2FI2ZkRU3ekXkUgSdwtbikZ0%2Fimg.png"
			alt="" width="100">
		<h1 class="h3 mb-3 font-weight-normal">회원가입</h1>
		<label for="loginId" class="sr-only">아이디</label> <input type="text"
			id="inputEmail" class="form-control" placeholder="아이디" name="loginId"
			maxlength="20" required autofocus> <label for="loginPw"
			class="sr-only">비밀번호</label> <input type="password" id="inputPassword"
			class="form-control" name="loginPw" maxlength="20" placeholder="비밀번호"
			required>
      <label for="loginPwConfirm"
			class="sr-only">비밀번호</label> <input type="password" id="inputPassword"
			class="form-control" name="loginPwConfirm" maxlength="20" placeholder="비밀번호 확인"
			required>
      <label for="name" class="sr-only">이름</label> <input type="text"
			id="inputName" class="form-control" placeholder="이름" name="name"
			maxlength="20" required>
      <label for="nickname" class="sr-only">닉네임</label> <input type="text"
			id="inpuNickname" class="form-control" placeholder="닉네임" name="nickname"
			maxlength="20" required>
      <label for="email" class="sr-only">이메일</label> <input type="email"
			id="inpuNickname" class="form-control" placeholder="이메일" name="email"
			maxlength="20" required>
      <label for="cellphoneNo" class="sr-only">전화번호</label> <input type="tel"
			id="inpuNickname" class="form-control" placeholder="전화번호 (선택사항)" name="cellphoneNo"
			maxlength="11">
		<div class="checkbox">
		</div>
		<button class="btn btn-lg btn-primary btn-block mb-3" type="submit">회원가입</button>
	
		<div id="extra">
			<span class="text-muted">PETFLICK 회원이신가요?</span> 
			<span><a href="/usr/member/join" class=""> 로그인하러 가기</a></span> 
		</div>
	</form>
    </div>
  </div>
</div>


<!-- 
<form class="table-box con form1" method="POST" action="doJoin"
	onsubmit="MemberJoinForm__submit(this); return false;">
	<input type="hidden" name="redirectUri" value="/usr/member/login">
	<input type="hidden" name="loginPwReal">
	<table>
		<tbody>
			<tr>
				<th>로그인 아이디</th>
				<td>
					<div class="form-control-box">
						<input type="text" placeholder="아이디를 입력해주세요" name="loginId"
							maxlength="20">
					</div>
				</td>
			</tr>
			<tr>
				<th>로그인 비밀번호</th>
				<td>
					<div class="form-control-box">
						<input type="password" placeholder="비밀번호를 입력해주세요" name="loginPw"
							maxlength="20">
					</div>
				</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<div class="form-control-box">
						<input type="password" placeholder="비밀번호를 재입력해주세요"
							name="loginPwConfirm" maxlength="20">
					</div>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<div class="form-control-box">
						<input type="text" placeholder="이름을 입력해주세요" name="name"
							maxlength="20">
					</div>
				</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>
					<div class="form-control-box">
						<input type="text" placeholder="닉네임을 입력해주세요" name="nickname"
							maxlength="20">
					</div>
				</td>
			</tr>
			<tr>
				<th>이메일 주소</th>
				<td>
					<div class="form-control-box">
						<input type="email" placeholder="이메일을 입력해주세요" name="email"
							maxlength="30">
					</div>
				</td>
			</tr>
			<tr>
				<th>휴대전화 번호</th>
				<td>
					<div class="form-control-box">
						<input type="tel"
							oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
							placeholder="'-' 를 제외하고 입력해주세요" name="cellphoneNo" maxlength="11">
					</div>
				</td>
			</tr>
			<tr>
				<th>가입</th>
				<td>
					<button class="btn btn-primary" type="submit">가입</button>
					<button class="btn btn-info" type="button"
						onclick="history.back();">취소</button>
				</td>
			</tr>
		</tbody>
	</table>

</form>
 -->

<%@ include file="../part/foot.jspf"%>
