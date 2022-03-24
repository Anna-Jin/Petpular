<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<aside class="d-flex flex-column">
	<div class="gnb-logo-box d-flex justify-content-center align-items-center">
		<div class="gnb-logo"><a href="/main" class="text-white">Petpular</a></div>
	</div>
	<div class="gnb-nav-box">
		<ul class="nav flex-column">
		  <li class="nav-item">
		    <a class="nav-link" href="/main">About</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link gnb-nav-mypet">My pet</a>
		    <ul class="nav flex-column">
		    	<c:choose>
		    		<c:when test="${empty petList}">
				    	<li class="mypet-nav">
				    		<a class="add-pet-nav" href="/mypet/add">+ 반려동물 등록하기</a>
				    	</li>	
		    		</c:when>
		    		<c:otherwise>
		    			<c:forEach items="${petList}" var="pet">
			    			<li class="mypet-nav">
					    		<a class="add-pet-nav" href="/mypet/${pet.id}">${pet.name}</a>
					    	</li>
				    	</c:forEach>
				    	<li class="mypet-nav">
				    		<a class="add-pet-nav" href="/mypet/add">+ 반려동물 등록하기</a>
				    	</li>
		    		</c:otherwise>
		    	</c:choose>
		    </ul>
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
		<c:when test="${not empty userId}">
			<div class="gnb-login-btn-box d-flex justify-content-center align-items-center">
				<%-- 프로필 이미지 있을 때 노출 --%>
				<%-- 프로필 이미지가 없을 때 --%>
				<div>
					<img src="/image/user.png" alt="로그인 프로필 이미지" class="gnb-profile-img">
				</div>
				<div class="ms-2">
					<div class="d-flex align-items-end">
						<div class="text-white font-size-14 font-weight-bold">${userName}</div>
						<div class="text-white font-size-12">님 안녕하세요!</div>
					</div>
					<div class="d-flex justify-content-center">
						<a href="/user/logout" class="gnb-logout-btn">로그아웃</a>
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
	$('.gnb-nav-mypet').on('click', function() {
		$('.mypet-nav').toggle('slow');
	})
});
</script>