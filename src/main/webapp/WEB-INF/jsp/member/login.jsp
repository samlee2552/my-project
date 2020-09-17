<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="로그인" />
<%@ include file="../part/head.jspf"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<script>
	var MemberLoginForm__submitDone = false;
	function MemberLoginForm__submit(form) {
		if (MemberLoginForm__submitDone) {
			alert('처리중입니다.');
			return;
		}

		form.loginId.value = form.loginId.value.trim();

		form.loginId.value = form.loginId.value.replaceAll(' ', '');

		form.loginPw.value = form.loginPw.value.trim();

		form.loginPwReal.value = sha256(form.loginPw.value);
		form.loginPw.value = '';

		form.submit();
		MemberLoginForm__submitDone = true;
	}
</script>

<style>
.form-signin {
	width: 100%;
	max-width: 330px;
	padding: 30px;
	margin: 0 auto;
	border-radius: 1rem;
}

.form-signin .checkbox {
	font-weight: 400;
}

.form-signin .form-control {
	position: relative;
	box-sizing: border-box;
	height: auto;
	padding: 10px;
	font-size: 14px;
}

.form-signin .form-control:focus {
	z-index: 2;
}

.form-signin input {
	margin-bottom: 20px;
	border-radius: 1rem;
}

.btn {
	border-radius: 1rem;
}

.checkbox>label {
	margin-right: 45%;
}

span {
	font-size: 12px;
}

#text {
	margin-top: 30%;
}

h3 {
	background: linear-gradient(to right, #5f2c82, #49a09d);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

.checkbox {
	font-size: 14px;
}
</style>

<!--  -->
<div class="container">
	<div class="row">
		<div class="col visible-on-md-up">
			<img id="text" class="mb-5"
				src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fc1SgIK%2FbtqIOnGsacc%2FKNPfUEarGV1n8lwYhDQHsk%2Fimg.png"
				width="100%" alt="">
			<h3 class="font-weight-bold">당신의 반려동물이 그렇게 귀엽다면서요?</h3>
			&nbsp
			<h3 class="font-weight-bold">전세계에 있는 사람들에게 자랑해보세요!</h3>
		</div>
		<div class="col">
			<form class="form-signin text-center shadow" method="POST"
				action="doLogin"
				onsubmit="MemberLoginForm__submit(this); return false;">
				<input type="hidden" name="redirectUri" value="/usr/home/main">
				<input type="hidden" name="loginPwReal"> 
				<img class="mb-4 mt-2 shadow-sm rounded-circle"
					src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FkTvFl%2FbtqIVHwUIcT%2FI2ZkRU3ekXkUgSdwtbikZ0%2Fimg.png"
					alt="" width="200">
				<h1 class="h3 mb-4 font-weight-normal">로그인</h1>
				<label for="loginId" class="sr-only">아이디</label> 
					<input type="text" id="inputLoginId" class="form-control" placeholder="아이디"
					name="loginId" maxlength="20" required autofocus> 
				<label for="loginPw" class="sr-only">비밀번호</label> 
					<input type="password" id="inputPassword" class="form-control" name="loginPw"
					maxlength="20" placeholder="비밀번호" required>
				<div class="checkbox">
					<label class="text-muted"> <input type="checkbox" value="">
						로그인 상태 유지
					</label>
				</div>
				<button class="btn btn-lg btn-primary btn-block mb-3" type="submit">로그인</button>

				<div id="extra">
					<span class="text-muted">아직 회원이 아니신가요?</span> <span><a
						href="/usr/member/join" class="">회원가입하러 가기</a></span> <br /> <span
						class="text-muted">정보를 잊어버리셨나요?</span> <span><a
						href="/usr/member/findLoginId" class="text-danger">아이디 </a> / <a
						href="/usr/member/findLoginPw" class="text-danger">비번 찾기</a></span>
				</div>
			</form>
		</div>
	</div>
</div>


<!-- 
<form class="table-box con form1" method="POST" action="doLogin"
	onsubmit="MemberLoginForm__submit(this); return false;">
	<input type="hidden" name="redirectUri" value="/usr/home/main">
	<input type="hidden" name="loginPwReal">
	<table>
		<tbody>
			<tr>
				<th>아이디</th>
				<td>
					<div class="form-control-box">
						<input type="text" placeholder="아이디를 입력해주세요" name="loginId"
							maxlength="20">
					</div>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<div class="form-control-box">
						<input type="password" placeholder="비밀번호를 입력해주세요" name="loginPw"
							maxlength="20">
					</div>
				</td>
			</tr>
			<tr>
				<th>로그인</th>
				<td>
					<button class="btn btn-primary" type="submit">로그인</button>
					<button class="btn btn-info" type="button"
						onclick="history.back();">취소</button>
				</td>
			</tr>
		</tbody>
	</table>

</form>
 -->
<%@ include file="../part/foot.jspf"%>
