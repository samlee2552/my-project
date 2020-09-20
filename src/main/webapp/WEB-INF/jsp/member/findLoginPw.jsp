<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="로그인" />
<%@ include file="../part/head.jspf"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<script>
	var FindLoginPwForm__submitDone = false;
	function FindLoginPwForm__submit(form) {
		if (FindLoginPwForm__submitDone) {
			alert('처리중입니다.');
			return;
		}

		form.loginId.value = form.name.value.trim();

		form.email.value = form.email.value.trim();

		form.submit();
		FindLoginPwForm__submitDone = true;
	}
</script>

<style>
	.form-findLoginPw {
	width: 100%;
	max-width: 330px;
	padding: 30px;
	margin: 0 auto;
	border-radius: 1rem;
}
.form-findLoginPw .checkbox {
	font-weight: 400;
}
.form-findLoginPw .form-control {
	position: relative;
	box-sizing: border-box;
	height: auto;
	padding: 10px;
	font-size: 14px;
}
.form-findLoginPw .form-control:focus {
	z-index: 2;
}
.form-findLoginPw input {
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

.input-group-text {
  border-radius:1rem;
  background:inherit;
}

i {
  color:#AEB6BF;
}


</style>

<div class="container">
	<div class="row">
		<div class="col d-none d-sm-block">
			<img id="text" class="mb-5"
				src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fc1SgIK%2FbtqIOnGsacc%2FKNPfUEarGV1n8lwYhDQHsk%2Fimg.png"
				width="100%" alt="">
			<h3 class="font-weight-bold">WHAT!? 비밀번호를 잊으셨다고요?</h3>
			&nbsp
			<h3 class="font-weight-bold">우리 할머니도 그건 안 잊어버리겠다..</h3>
		</div>
		<div class="col">
			<form class="form-findLoginPw text-center shadow" method="POST"
				action="doFindLoginPw"
				onsubmit="FindLoginPwForm__submit(this); return false;">
				<input type="hidden" name="redirectUri" value="./login">
				<img class="mb-4 mt-2 shadow-sm rounded-circle"
					src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FkTvFl%2FbtqIVHwUIcT%2FI2ZkRU3ekXkUgSdwtbikZ0%2Fimg.png"
					alt="" width="200">
				<h1 class="h3 mb-4 font-weight-normal">비밀번호 찾기</h1>
				<label for="name" class="sr-only">아이디</label>
          <div class="input-group mb-4">
            <div class="input-group-prepend ">
              <div class="input-group-text border-right-0">
                  <i class="fas fa-user"></i>          
              </div>
            </div>
					<input type="text" id="inputLoginId" class="form-control border-left-0" placeholder="아이디"
					name="loginId" maxlength="20" required autofocus>  
          </div>
					
				<label for="email" class="sr-only">이메일</label>
          <div class="input-group mb-4">
            <div class="input-group-prepend ">
              <div class="input-group-text border-right-0">
                 <i class="fas fa-envelope"></i>             
              </div>
            </div>
					<input type="email" id="inputEmail" class="form-control border-left-0" name="email"
					maxlength="20" placeholder="이메일" required>
          </div>
					
				<div class="checkbox">
					<label class="text-muted"> 
            <input type="checkbox" value="" required> 다시는 잊지 않겠습니다. 잘못했습니다
					</label>
				</div>
				<button class="btn btn-lg btn-primary btn-block mb-3" type="submit">비밀번호 찾기</button>

				<div id="extra">
					<span class="text-muted">비밀번호가 기억나셨나요?</span> <span><a
						href="/usr/member/login" class="">로그인</a></span> <br /> <span
						class="text-muted">아이디를 잊으셨나요?</span> <span><a
						href="/usr/member/findLoginId" class="text-danger">아이디 찾기</a></span>
				</div>
			</form>
		</div>
	</div>
</div>



<!--  
<h1>비번찾기</h1>
<form class="table-box con form1" method="POST" action="doFindLoginPw"
	onsubmit="FindLoginPwForm__submit(this); return false;">
	<input type="hidden" name="redirectUri" value="./login">
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
				<th>이메일</th>
				<td>
					<div class="form-control-box">
						<input type="email" placeholder="이메일을 입력해주세요" name="email"
							maxlength="20">
					</div>
				</td>
			</tr>
			<tr>
				<th>로그인</th>
				<td>
					<button class="btn btn-primary" type="submit">비밀번호 찾기</button>
					<button class="btn btn-info" type="button"
						onclick="history.back();">취소</button>
				</td>
			</tr>
		</tbody>
	</table>

</form>
-->

<%@ include file="../part/foot.jspf"%>
