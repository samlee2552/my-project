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

		if (form.loginId.value.length == 0) {
			form.loginId.focus();
			alert('아이디를 입력해주세요');
			return;
		}

		form.email.value = form.email.value.trim();

		if (form.email.value.length == 0) {
			form.email.focus();
			alert('비밀번호를 입력해주세요.');
			return;
		}

		form.submit();
		FindLoginPwForm__submitDone = true;
	}
</script>

<h1>로그인</h1>
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

<%@ include file="../part/foot.jspf"%>
