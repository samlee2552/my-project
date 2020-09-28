<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="게시물 리스트" />
<%@ include file="../part/head.jspf"%>

<!-- PC용 -->
<div class="table-box con visible-on-md-up d-flex justify-content-center">
	<div>게시판</div>
	<table>
		<colgroup>
			<col width="100" />
			<col width="200" />
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>날짜</th>

				<th>내용</th>
				<th>작성자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${articles}" var="article">
				<tr>
					<td><a href="${article.getDetailLink(article.id)}">${article.id}</a></td>
					<td>${article.regDate}</td>
					<td>${article.body}</td>
					<td>${article.extra.writer}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div><a href="./write">글쓰기</a></div>


<%@ include file="../part/foot.jspf"%>