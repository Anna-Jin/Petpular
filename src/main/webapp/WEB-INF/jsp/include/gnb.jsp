<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
		    <a  class="nav-link gnb-nav-mypet stop-dragging">My pet</a>
		    <ul class="nav flex-column">
		    	<c:choose>
		    		<c:when test="${empty petIdArr}">
				    	<li class="mypet-nav">
				    		<a class="add-pet-nav d-block" href="/mypet/add">> 반려동물 등록하기</a>
				    	</li>	
		    		</c:when>
		    		<c:otherwise>
			    		<c:set var="petIdArr" value="${fn:split(petIdArr, ',')}" />
			    		<c:set var="petNameArr" value="${fn:split(petNameArr, ',')}" />
			    		<c:forEach items="${petIdArr}" var="petId" varStatus="status">
			    			<c:set var="petName" value="${petNameArr[status.index]}" />
				    		<li class="mypet-nav">
						    	<a class="pet-nav d-block" href="/mypet/${petId}">
									> ${petName}
								</a>
							</li>
						</c:forEach>	
				    	<li class="mypet-nav">
				    		<a class="add-pet-nav d-block" href="/mypet/add">> 반려동물 등록하기</a>
				    	</li>
		    		</c:otherwise>
		    	</c:choose>
		    </ul>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="/community">Community</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link gnb-nav-service stop-dragging">Service</a>
		    <ul class="nav flex-column">
		    	<li class="service-nav">
		    		<a href="/service/search-abandoned-animal" class="abandoned-animals-nav d-block">> 유기동물</a>
		    	</li>
		    	<li class="service-nav">
		    		<a href="https://wayopet.com/" target='_blank' class="wayo-nav d-block">> 반려동물 돌보미</a>
		    	</li>
		    </ul>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="/foryou">For you</a>
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
					<div class="d-flex align-items-center">
						<div class="gnb-user-name">${userName}</div>
						<div class="text-white font-size-12">님 반가워요!</div>
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
	});
	
	$('.gnb-nav-service').on('click', function() {
		$('.service-nav').toggle('slow');
	});
});
</script>