<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
	var historyBack = '${historyBack}' == 'true';
	var alertMsg = '${alertMsg}'.trim();
	/*경고창 띄우기*/
	if (alertMsg) {
		alert(alertMsg);
	}
	/*이전으로 돌아가기 */
	//History.back() 메서드는 브라우저가 세션 기록의 바로 뒤 페이지로 이동하도록 지시합니다.
	if (historyBack) {
		history.back();
	}
	/*uri 로 이동*/
	var redirectUri = '${redirectUri}'.trim();
	if (redirectUri) {
		location.replace(redirectUri);
	}
</script>