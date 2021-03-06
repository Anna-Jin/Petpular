<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   

<div id="foryou-wrap">
	<div class="foryou-top">
		<div class="foryou-left">
			<div class="foryou-user-info">
				<div class="foryou-user-info-title">내 정보</div>
				<div class="foryou-user-info-box">
					<div class="foryou-user-info-profile-img-box">
						<c:choose>
							<c:when test="${empty userInfo.user.profileImageUrl}">
								<img alt="프로필 이미지" src="/image/user.png" id="user-img" class="foryou-user-info-profile-img">
							</c:when>
							<c:otherwise>
								<img alt="프로필 이미지" src="${userInfo.user.profileImageUrl}" id="user-img" class="foryou-user-info-profile-img">
							</c:otherwise>
						</c:choose>
						<a href="#" class="foryou-user-info-profile-img-btn">사진 등록</a>
						<input type="file" id="user-file" name="userImgUrl" class="d-none" accept=".gif, .jpg, .png, .jpeg">
					</div>
					<div class="foryou-user-info-profile-box">
						<div class="foryou-user-info-profile-input-box">
							<div class="col-4 d-flex justify-content-around">
								<label for="loginId">아이디</label>
							</div>
							<div class="col-7">
								<input type="text" class="form-control profile-input" id="loginId" name="loginId" value="${userInfo.user.loginId}">
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
						<div class="d-flex justify-content-center align-items-center">
							<button type="button" class="btn btn-primary edit-profile-btn">내 정보 수정</button>					
							<a href="/user/logout" class="gnb-logout-btn">로그아웃</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="foryou-right">
			<div class="foryou-post">
				<div class="foryou-right-title">내가 쓴 글</div>
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
							<button type="button" class="foryou-each-post-del-box mx-2" data-post-content="${post.post.content}" data-post-id="${post.post.id}">
								<img src="/image/close.png" class="foryou-each-post-del-btn">
							</button>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="foryou-pet">
				<div class="foryou-right-title">내 반려냥이</div>
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
	<div class="foryou-bottom">
		<div class="foryou-bottom-title">유기동물 찜 목록</div>
		<div class="foryou-abandoned-tag-body">
			<div class="foryou-abandoned-tag-body-box flex-wrap">
				<c:choose>
				<c:when test="${not empty abandonedAnimalTagList}">
				<c:forEach items="${abandonedAnimalTagList}" var="abandonedAnimalTag">
						<button type="button" class="abandoned-tag-card" data-desertion-no="${abandonedAnimalTag.desertionNo}">
							<div class="abandoned-tag-img-box">
								<img alt="유기동물 썸네일" src="${abandonedAnimalTag.popfile}" class="abandoned-tag-img">
							</div>
							<div class="abandoned-tag-info-box">
								<div class="font-size-12">
									<span class="fw-bold">상태 : </span>
									<span id="abandoned-animal-status">${abandonedAnimalTag.processState}</span>
								</div>
								<div class="font-size-12">
									<span class="fw-bold">성별 : </span>
									<c:choose>
										<c:when test="${abandonedAnimalTag.sexCd eq 'F'}">
											<span id="abandoned-animal-sex">여</span>
										</c:when>
										<c:otherwise>
											<span id="abandoned-animal-sex">남</span>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="font-size-12">
									<span class="fw-bold">보호 장소 : </span>
									<span id="abandoned-animal-center-addr">${abandonedAnimalTag.careAddr}</span>
								</div>						
							</div>
						</button>
						
						<%-- 디테일 팝업 --%>
						<div class="abandoned-tag-details">
							<div class="abandoned-animal-details-header">
								<button type="button" class="btn btn-primary abandoned-animal-tag-btn" data-desertion-no="${abandonedAnimalTag.desertionNo}">
									찜삭제
								</button>
							</div>
							<div class="abandoned-animal-details-body">
								<div class="details-img-box">
									<img src="${abandonedAnimalTag.popfile}" alt="유기동물 이미지" class="details-img">
								</div>
								<div class="details-animal-info-box">
									<div class="col-6 me-1">
										<div class="details-animal-info-box-title">동물 정보</div>
										<table class="table">
											<thead>
											</thead>
											<tbody>
												<tr>
													<th>공고번호</th>
													<td>${abandonedAnimalTag.noticeNo}</td>
												</tr>
												<tr>
													<th>공고기간</th>
														<fmt:parseDate value="${abandonedAnimalTag.noticeSdt}" pattern="yyyyMMdd" var="noticeSdt"/>
														<fmt:formatDate value="${noticeSdt}" pattern="yyyy-MM-dd" var="sdt"/>
														<fmt:parseDate value="${abandonedAnimalTag.noticeEdt}" pattern="yyyyMMdd" var="noticeEdt"/>
														<fmt:formatDate value="${noticeEdt}" pattern="yyyy-MM-dd" var="edt"/>
													<td>${sdt} ~ ${edt}</td>
												</tr>
												<tr>
													<th>품종</th>
													<td>${abandonedAnimalTag.kindCd}</td>
												</tr>
												<tr>
													<th>성별</th>
													<td>
														<c:choose>
															<c:when test="${abandonedAnimalTag.sexCd eq 'F'}">
																<span id="abandoned-animal-sex">여</span>
															</c:when>
															<c:when test="${abandonedAnimalTag.sexCd eq 'M'}">
																<span id="abandoned-animal-sex">남</span>
															</c:when>
															<c:otherwise>
																<span id="abandoned-animal-sex">미상</span>	
															</c:otherwise>
														</c:choose>
														<c:if test="${abandonedAnimalTag.neuterYn eq 'Y'}">
															<span> / 중성화</span>
														</c:if>
													</td>
												</tr>
												<tr>
													<th>나이</th>
													<td>${abandonedAnimalTag.age}</td>
												</tr>
												<tr>
													<th>체중</th>
													<td>${abandonedAnimalTag.weight}</td>
												</tr>
												<tr>
													<th>특징</th>
													<td>${abandonedAnimalTag.specialMark}</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="col-6 ms-1">
										<div class="details-animal-info-box-title">보호센터 정보</div>
										<table class="table">
											<thead>
											</thead>
											<tbody>
												<tr>
													<th>관할기관</th>
													<td>${abandonedAnimalTag.orgNm}</td>
												</tr>
												<tr>
													<th>보호센터</th>
													<td>${abandonedAnimalTag.careNm}</td>
												</tr>
												<tr>
													<th>보호센터주소</th>
													<td>${abandonedAnimalTag.careAddr}</td>
												</tr>
												<tr>
													<th>보호센터연락처</th>
													<td>${abandonedAnimalTag.careTel}</td>
												</tr>
												<tr>
													<th>발견장소</th>
													<td>${abandonedAnimalTag.happenPlace}</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
				</c:forEach>
				</c:when>
				<c:otherwise>
					<div>찜 목록이 비어있습니다</div>
				</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>

<div class="target"></div>
<script>
$(document).ready(function() {
	
	// 유저 사진 등록 버튼 클릭
	$('.foryou-user-info-profile-img-btn').on('click', function() {
		$('#user-file').click();
	});
	
	// 유저 사진 유효성 검사
	$('#user-file').on('change', function(e) {
		var userFile = e.target.files[0].name;
		
		// 확장자 유효성 확인
		var extension = userFile.split('.');
		if (extension.length < 2 || 
		 	(extension[extension.length - 1] != 'gif' 
		 	&& extension[extension.length - 1] != 'png' 
		 	&& extension[extension.length - 1] != 'jpg'
		 	&& extension[extension.length - 1] != 'jpeg')) {
		 	
		 	alert("이미지 파일만 업로드 할 수 있습니다.");
		 	$(this).val(""); // 이미 올라간 것을 확인한 것이기 때문에 비워주어야 한다.
		 	return;
		 }
		
		// 파일 업로드 시 미리보기 이미지를 선택한 이미지로 변경
		setImageFromFile(this, '#user-img');
		
	});
	
	// 파일 업로드 시 미리보기 이미지를 선택한 이미지로 변경 --> 이거를 위한 함수
	function setImageFromFile(input, expression) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $(expression).attr('src', e.target.result);
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	// 유저 정보 수정
	$('.edit-profile-btn').on('click', function() {
		// 파일이 업로드 된 경우, 확장자 체크
		var file = $('#user-file').val();
		if (file != '') {
			let ext = file.split('.').pop().toLowerCase(); 			 
			if ($.inArray(ext, ['jpg', 'jpeg', 'png', 'gif']) == -1) {
				alert('jpg, jpeg, png, gif 파일만 업로드 할 수 있습니다.');
				return;
			}
		}
		
		var formData = new FormData();
		
		formData.append('loginId', $('#loginId').val().trim());
		formData.append('name', $('#name').val().trim());
		formData.append('email', $('#email').val().trim());
		formData.append('file', $('#user-file')[0].files[0]);
		
		$.ajax({
			type: "POST"
			, url: "/user/edit"
			, data: formData
			, enctype: "multipart/form-data" 	
			, processData: false			
			, contentType: false
			, success: function(data) {
				if (data.result == 'success') {
					alert('정보가 수정되었습니다.');
					location.reload();
				} else {
					alert(data.errorMessage);
				}
			}
			, error: function(e) {
				alert('프로필 수정에 실패했습니다. 관리자에게 문의해주세요.');
			}
		});
		
	});
	
	
	// 게시글 내용 요약
	$('.foryou-post-box').each(function() {
		var postContent = $(this).find('.foryou-post-content');
		var postContentText = postContent.text().trim();
		
		if (postContentText.length > 17) {
			var postContentShort = postContentText.substring(0, 17) + '...';
			postContent.html(postContentShort);
		}
	});
	
	// 게시글 삭제
	$('.foryou-each-post-del-box').on('click', function() {
		var postId = $(this).data('post-id');
		
		$.ajax({
			type: "DELETE"
			, url: "/post/delete"
			, data: {"postId": postId}
			, success: function(data) {
				if (data.result == 'success') {
					location.reload();
				} else {
					alert(data.errorMessage);
				}
			}
			, error: function(e) {
				alert('게시글 삭제에 실패했습니다. 관리자에게 문의해주세요.');
			}
		});
	});
	
	
	// 유기동물 목록
	// 유기동물 디테일창 노출
	$('.abandoned-tag-card').on('click', function(e) {
		e.stopPropagation();
		$('.abandoned-tag-details').not($(this).next('.abandoned-tag-details').slideToggle()).slideUp();
		$('.target').toggle();
		
	});
	
	// 유기동물 디테일창 닫기
	$(document).on('click', function(e) {
		if ($(e.target).hasClass('target')) {
			// 디테일창 외부 클릭시 창 닫기
			$(this).find('.abandoned-tag-details').slideUp();
			$('.target').hide();
		}
	});
	
	$('.abandoned-animal-tag-btn').on('click', function() {
		var desertionNo = $(this).data('desertion-no');
		
		$.ajax({
			type: "DELETE"
			, url: "/abandoned/delete"
			, data: {"desertionNo":desertionNo}
			, success: function(data) {
				if (data.result == 'success') {
					location.reload();
				}
			}
			, error: function(e) {
				alert('찜 삭제에 실패했습니다. 관리자에게 문의해주세요.');
			}
		});
	});
});
</script>