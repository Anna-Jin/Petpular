<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div class="w-100">
	<c:choose>
		<%-- 비로그인 시 --%>
		<c:when test="${empty userLoginId}">
			<div class="h-100 d-flex justify-content-center align-items-center">
				<div class="d-flex flex-column align-items-center">
					<div class="text1">자신의 고양이에 대해 얼마나 알고 계신가요?</div>
					<br>
					<div>
						<span class="main-logo">Petpular</span>
						<span class="text2">로 반려냥이의 정보를 한눈에 관리하세요!</span>
					</div>
					<br>
					<br>
					<div>
						<a type="button" class="btn main-signup-btn" href="/user/signup">회원가입</a>
					</div>
				</div>
			</div>
		</c:when>
		<%-- 로그인 시 --%>
		<c:otherwise>
		<div class="main-box">
			<div class="d-flex justify-content-center align-items-center">
				<div class="d-flex flex-column align-items-center">
					<div class="text1">자신의 고양이에 대해 얼마나 알고 계신가요?</div>
					<br>
					<div>
						<span class="main-logo">Petpular</span>
						<span class="text2">로 반려냥이의 정보를 한눈에 관리하세요!</span>
					</div>
				</div>
			</div>
			<div class="d-flex flex-wrap justify-content-around main-profile">
				<c:forEach items="${petList}" var="pet">
					<div class="main-profile-box">
						<div class="main-profile-image-box">
							<c:choose>
								<c:when test="${not empty pet.petImageUrl}">
									<img src="${pet.petImageUrl}" alt="반려동물 프로필 사진" class="mypet-profile-image">					
								</c:when>
								<c:otherwise>
									<img src="/image/paws.png" alt="사진 없을 때" class="mypet-profile-image">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="main-profile-hover">
							<a href="/mypet/${pet.id}" class="text-white">
								${pet.name}
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>	
		</c:otherwise>
	</c:choose>
</div>	