<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<div id="foryou-wrap">
	<div class="foryou-top">
		<div class="foryou-user-info">
			<div class="foryou-user-info-title">내 정보</div>
			<div class="foryou-user-info-box">
				<div class="foryou-user-info-profile-img-box">
					<c:choose>
						<c:when test="${empty userInfo.user.profileImageUrl}">
							<img alt="프로필 이미지" src="/image/user.png" class="foryou-user-info-profile-img">
						</c:when>
						<c:otherwise>
							<img alt="프로필 이미지" src="${userInfo.user.profileImageUrl}" class="foryou-user-info-profile-img">
						</c:otherwise>
					</c:choose>
					<a href="#" class="foryou-user-info-profile-img-btn">사진 등록</a>
				</div>
				<div class="foryou-user-info-profile-box">
					<div class="foryou-user-info-profile-input-box">
						<div class="col-4 d-flex justify-content-around">
							<label for="id">아이디</label>
						</div>
						<div class="col-7">
							<input type="text" class="form-control profile-input" id="id" name="id" value="${userInfo.user.loginId}">
						</div>
					</div>
					<div class="foryou-user-info-profile-input-box">
						<div class="col-4 d-flex justify-content-around">
							<label for="name">이름</label>
						</div>
						<div class="col-7">
							<input type="text" class="form-control profile-input" id="name" name="name" value="${userInfo.user.name}">
						</div>
					</div>
					<div class="foryou-user-info-profile-input-box">
						<div class="col-4 d-flex justify-content-around">
							<label for="email">이메일</label>
						</div>
						<div class="col-7">
							<input type="text" class="form-control profile-input" id="email" name="email" value="${userInfo.user.email}">
						</div>
					</div>
					<div class="d-flex justify-content-center">
						<button type="button" class="btn btn-primary">내 정보 수정</button>					
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="foryou-bottom">
		<div class="foryou-post">
			<div class="foryou-bottom-title">내가 쓴 글</div>
			<c:forEach items="${userInfo.postList}" var="post">
				<div class="foryou-post-box">
					<div class="d-flex justify-content-center align-items-center mb-2">
					<div class="foryou-each-post">
						<div class="foryou-post-content px-3">${post.post.content}</div>
						<div class="d-flex align-items-center px-3">
							<div class="foryou-post-like-count">${post.countLike}</div>
							<img src="/image/like(on).png" class="foryou-post-like">
						</div>
					</div>
						<button type="button" class="foryou-each-post-del-box mx-2">
							<img src="/image/close.png" class="foryou-each-post-del-btn">
						</button>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="foryou-pet">
			<div class="foryou-bottom-title">내 반려냥이</div>
			<c:choose>
				<c:when test="${empty userInfo.petList}">
					<div>등록된 반려냥이가 없습니다</div>
				</c:when>
				<c:otherwise>
					<div class="d-flex justify-content-around w-100">
						<c:forEach items="${userInfo.petList}" var="pet">
							<div class="foryou-pet-box">
								<div class="foryou-pet-profile-box">
									<c:choose>
										<c:when test="${empty pet.petImageUrl}">
											<img src="/image/paws.png" alt="사진 없을 때" class="foryou-pet-profile-image">
										</c:when>
										<c:otherwise>
											<img src="${pet.petImageUrl}" alt="사진 있을 때" class="foryou-pet-profile-image">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="foryou-pet-profile-hover">
									<a href="/mypet/${pet.id}" class="text-white">${pet.name}</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>


<script>
$(document).ready(function() {
	var postContent = $('.foryou-post-content');
	var postContentText = postContent.text().trim();
	
	if (postContentText.length > 17) {
		var postContentShort = postContentText.substring(0, 17) + '...';
		postContent.html(postContentShort);
	}
});
</script>