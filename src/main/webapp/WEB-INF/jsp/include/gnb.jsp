<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<aside class="d-flex flex-column">
	<div class="gnb-logo-box d-flex justify-content-center align-items-center">
		<div class="gnb-logo">Petpular</div>
	</div>
	<div class="gnb-nav-box">
		<ul class="nav flex-column">
		  <li class="nav-item">
		    <a class="nav-link"href="/main">About</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="/mypet">My pet</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">Community</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">Service</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">For you</a>
		  </li>
		</ul>
	</div>
	<c:choose>
		<c:when test="${not empty userLoginId}">
			<div class="gnb-login-btn-box d-flex justify-content-center align-items-center">
				<%-- 프로필 이미지 있을 때 노출 --%>
				<%-- 프로필 이미지가 없을 때 --%>
				<div>
					<img src="/image/user.png" alt="로그인 프로필 이미지" class="gnb-profile-img">
				</div>
				<div class="ml-2">
					<div class="d-flex align-items-end">
						<div class="text-white font-size-14 font-weight-bold">${userName}</div>
						<div class="text-white font-size-12">님 안녕하세요!</div>
					</div>
					<div class="d-flex justify-content-center">
						<a href="#" class="gnb-logout-btn">로그아웃</a>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="gnb-login-btn-box d-flex justify-content-center align-items-center">
				<a type="button" class="gnb-login-btn" href="/user/login">Login</a>
			</div>
		</c:otherwise>
	</c:choose>
</aside>

<script>
$(document).ready(function() {
	$('.nav').on('click', function() {
		
	});
});
</script>