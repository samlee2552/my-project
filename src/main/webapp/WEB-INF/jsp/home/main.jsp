<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../part/head.jspf"%>

<style>
.carousel-item>img {
	height: 50rem;
	max-width: 100%;
	object-fit: cover;
}
</style>

<div class="container">
	<div id="carouselExampleInterval" class="carousel slide"
		data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active" data-interval="5000">
				<img
					src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FdYQFpu%2FbtqIXf1SUNl%2FDxAycXUs5vzWclc3xAMKK0%2Fimg.jpg"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item" data-interval="5000">
				<img
					src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2F6zzIv%2FbtqIWRG3F0X%2Frdg9JB0SVd33Vqaov4bYt0%2Fimg.jpg"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item" data-interval="5000">
				<img
					src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fb4OVv3%2FbtqIZk2RXs5%2FcBOw0X9Llte8KUUkmAtEsk%2Fimg.jpg"
					class="d-block w-100" alt="...">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleInterval"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleInterval"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
</div>

<%@ include file="../part/foot.jspf"%>

