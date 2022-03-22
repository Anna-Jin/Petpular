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
		<div class="main-login-box">
			<div class="text1">자신의 고양이에 대해 얼마나 알고 계신가요?</div>
			<div>
				<span class="main-logo">Petpular</span>
				<span class="text2">로 반려냥이의 정보를 한눈에 관리하세요!</span>
			</div>		
		</div>
	</c:otherwise>
	</c:choose>
</div>	