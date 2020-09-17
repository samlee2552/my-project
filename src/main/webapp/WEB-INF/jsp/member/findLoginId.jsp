<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="아이디 찾기" />
<%@ include file="../part/head.jspf"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<script>
	var FindLoginIdForm__submitDone = false;
	function FindLoginIdForm__submit(form) {
		if (FindLoginIdForm__submitDone) {
			alert('처리중입니다.');
			return;
		}

		form.name.value = form.name.value.trim();

		if (form.name.value.length == 0) {
			form.name.focus();
			alert('이름을 입력해주세요.');
			return;
		}

		form.email.value = form.email.value.trim();

		if (form.email.value.length == 0) {
			form.email.focus();
			alert('이메일을 입력해주세요.');
			return;
		}
		
		form.submit();
		FindLoginIdForm__submitDone = true;
	}
</script>

<style>

.form-findLoginId {
	width: 100%;
	max-width: 330px;
	padding: 30px;
	margin: 0 auto;
	border-radius: 1rem;
}
.form-findLoginId .checkbox {
	font-weight: 400;
}
.form-findLoginId .form-control {
	position: relative;
	box-sizing: border-box;
	height: auto;
	padding: 10px;
	font-size: 14px;
}
.form-findLoginId .form-control:focus {
	z-index: 2;
}
.form-findLoginId input {
	margin-bottom: 20px;
	border-radius: 1rem;
}
.btn {
	border-radius: 1rem;
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

<div class="container">
	<div class="row">
		<div class="col visible-on-md-up">
			<img id="text" class="mb-5"
				src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fc1SgIK%2FbtqIOnGsacc%2FKNPfUEarGV1n8lwYhDQHsk%2Fimg.png"
				width="100%" alt="">
			<h3 class="font-weight-bold">WHAT!? 로그인 아이디를 잊으셨다고요?</h3>
			&nbsp
			<h3 class="font-weight-bold">우리 할머니도 그건 안 잊어버리겠다... ㅉ</h3>
		</div>
		<div class="col">
			<form class="form-findLoginId text-center shadow" method="POST"
				action="doFindLoginId"
				onsubmit="FindLoginIdForm__submit(this); return false;">
				<input type="hidden" name="redirectUri" value="/usr/home/login">
				<img class="mb-4 mt-2 shadow-sm rounded-circle"
					src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FkTvFl%2FbtqIVHwUIcT%2FI2ZkRU3ekXkUgSdwtbikZ0%2Fimg.png"
					alt="" width="200">
				<h1 class="h3 mb-4 font-weight-normal">아이디 찾기</h1>
				<label for="name" class="sr-only">이름</label> 
					<input type="text" id="inputName" class="form-control" placeholder="이름"
					name="name" maxlength="20" required autofocus> 
				<label for="email" class="sr-only">이메일</label> 
					<input type="email" id="inputEmail" class="form-control" name="email"
					maxlength="20" placeholder="이메일" required>
				<div class="checkbox">
					<label class="text-muted"> 
            <input type="checkbox" value="" required> 다시는 잊지 않겠습니다. 잘못했습니다
					</label>
				</div>
				<button class="btn btn-lg btn-primary btn-block mb-3" type="submit">아이디 찾기</button>

				<div id="extra">
					<span class="text-muted">아이디가 기억나셨나요?</span> <span><a
						href="/usr/member/login" class="">로그인</a></span> <br /> <span
						class="text-muted">비밀번호를 잊으셨나요?</span> <span><a
						href="/usr/member/findLoginPw" class="text-danger">비밀번호 찾기</a></span>
				</div>
			</form>
		</div>
	</div>
</div>


<!-- 
<h1>아이디 찾기</h1>
<form class="table-box con form1" method="POST" action="doFindLoginId"
	onsubmit="FindLoginIdForm__submit(this); return false;">
	<input type="hidden" name="redirectUri" value="/member/login">
	<input type="hidden" name="loginPwReal">
	<table>
		<tbody>
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
				<th>이메일</th>
				<td>
					<div class="form-control-box">
						<input type="email" placeholder="이메일을 입력해주세요" name="email"
							maxlength="20">
					</div>
				</td>
			</tr>
			<tr>
				<th>아이디 찾기</th>
				<td>
					<button class="btn btn-primary" type="submit">아이디 찾기</button>
					<button class="btn btn-info" type="button"
						onclick="history.back();">취소</button>
				</td>
			</tr>
		</tbody>
	</table>

</form>
 -->
<%@ include file="../part/foot.jspf"%>
