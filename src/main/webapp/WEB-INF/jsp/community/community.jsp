<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="community-wrap">
	<div>
		<%-- 글쓰기 버튼 --%>
	 	<div id="community-post-write-box">
			<button type="button" id="community-post-write-btn" data-bs-toggle="modal" data-bs-target="#postWriteModal">
				<div class="d-flex align-items-center">
					<img src="/image/post.png" alt="게시글 쓰기버튼" width="24px">
					<div class="font-size-14 ms-3">게시글 작성하기</div>
				</div>
			</button>
		</div>
		
		<c:forEach items="${contentList}" var="content">
		
		<%-- 유저 정보 팝업 --%>
		<div class="community-layout-box">
			<div class="community-post-user-info card-number-${content.post.id}">
				<div class="community-post-user-info-header">
					<c:choose>
						<c:when test="${empty content.user.profileImageUrl}">
							<img src="/image/user.png" alt="유저 프로필 이미지" class="community-post-user-info-img">
						</c:when>
						<c:otherwise>
							<img src="${content.user.profileImageUrl}" alt="유저 프로필 이미지" class="community-post-user-info-img">
						</c:otherwise>
					</c:choose>
					<div class="community-post-user-info-header-id">
						${content.user.loginId}
					</div>
				</div>
				<div class="community-post-user-info-body">
					<c:choose>
						<c:when test="${not empty content.petList}">
							<div class="community-post-user-info-body-pet">
								<div class="community-post-user-info-body-pet-title">반려냥이</div>
								<div class="d-flex">
									<c:forEach items="${content.petList}" var="pet">
										<div class="community-post-user-info-body-pet-card">
											<div class="community-post-user-info-body-pet-img-box">
												<c:choose>
													<c:when test="${empty pet.petImageUrl}">
														<img src="/image/paws.png" class="community-post-user-info-body-pet-img">
													</c:when>
													<c:otherwise>
														<img src="${pet.petImageUrl}" class="community-post-user-info-body-pet-img">
													</c:otherwise>
												</c:choose>
											</div>
											<div class="ms-2">
												<div class="community-post-user-info-body-pet-name">${pet.name}</div>
												<div class="community-post-user-info-body-pet-breed">${pet.breed}</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</c:when>
						<c:otherwise>
						<div class="community-post-user-info-body-pet">
							<div class="community-post-user-info-body-pet-title">반려냥이</div>
							<div class="community-post-user-info-body-no-pet">등록된 반려냥이가 없습니다.</div>
						</div>
						</c:otherwise>
					</c:choose>
					<div class="d-flex">
						<div class="community-post-user-info-body-post-title">게시물</div>
						<div class="font-size-14 ms-2">${content.countPost}</div>
					</div>
				</div>
			</div>
			
			<%-- 게시물 card --%>
			<div id="community-post-box">
				<%-- header --%>
				<div class="community-post-header">
					<div class="community-post-header-left">
						<c:choose>
							<c:when test="${empty content.user.profileImageUrl}">
								<img src="/image/user.png" alt="유저 프로필 이미지" class="community-post-user-profile-img">
							</c:when>
							<c:otherwise>
								<img src="${content.user.profileImageUrl}" alt="유저 프로필 이미지" class="community-post-user-profile-img">
							</c:otherwise>
						</c:choose>
						<div>
							<button type="button" class="community-post-id" data-post-id="${content.post.id}">
								${content.user.loginId}
							</button>
							
							<fmt:formatDate value="${content.post.createdAt}" var="createdDate" pattern="yyyy년 MM월 dd일 a hh:mm"/>
							<div class="community-post-time">${createdDate}</div>
						</div>
					</div>
					<div class="community-post-header-right">
						<c:if test="${content.post.userId eq userId}">
							<button type="button" class="community-post-more-btn" data-bs-toggle="modal" data-bs-target="#moreModal" data-post-id="${content.post.id}">
								<img src="/image/option.png" alt="옵션" class="community-post-more-img">
							</button>
						</c:if>
					</div>
				</div>
				
				<%-- body (게시물 내용) --%>
				<div class="community-post-body">
					
					<%-- 게시물 사진 --%>
					<div class="community-post-body-img-box">
						<img src="${content.post.imagePath}" alt="이미지" class="community-post-body-img">
					</div>
					
					<%-- 좋아요 버튼 --%>
					<div class="community-post-body-nav">
						<button type="button" class="community-post-like-btn" data-post-id="${content.post.id}" data-like="${content.existLike}">
							<c:choose>
								<c:when test="${content.existLike}">
									<img src="/image/like(on).png" alt="좋아요 아이콘" class="community-post-like-img">
								</c:when>
								<c:otherwise>
									<img src="/image/like(off).png" alt="좋아요 아이콘" class="community-post-like-img">
								</c:otherwise>	
							</c:choose>
						</button>
					</div>
					
					<%-- 게시물 내용 --%>
					<div class="community-post-body-content-box">
						<div class="community-post-body-content">
							${content.post.content}
						</div>
						<div>
							<button type="button" class="community-post-body-content-view-more-btn d-none">
								더보기
							</button>
						</div>
					</div>
				</div>
				
				<%-- footer (게시물 댓글) --%>	
				<div class="community-post-footer">
					
					<%-- 댓글 내용 --%>
					<c:forEach items="${content.commentList}" var="comment">
						<div class="community-post-footer-comment-box">
							<div class="community-post-footer-comment-left">
								<div class="community-post-footer-comment-id">
									${comment.user.loginId}
								</div>
								<div>
									${comment.comment.content}
								</div>
							</div>
							<div class="community-post-footer-comment-right">
								<c:if test="${comment.user.id eq userId}">
									<button type="button" class="community-post-footer-comment-delete-btn" data-post-id="${comment.comment.postId}" data-comment-id="${comment.comment.id}">
										<img src="/image/close.png" class="community-post-footer-comment-delete-img">
									</button>
								</c:if>
							</div>
						</div>
					</c:forEach>
					
					<%-- 댓글 쓰기 --%>
					<div class="community-post-footer-comment-write-box">
						<div class="col-1">
							<img src="/image/comment.png" alt="댓글 아이콘" class="community-post-footer-comment-write-img">
						</div>
						<div class="col-9">
							<input type="text" class="community-post-footer-comment-write-input" id="comment${content.post.id}" name="comment" placeholder="댓글달기">
						</div>
						<div class="col-2 d-flex justify-content-end">
							<button type="button" class="community-post-footer-comment-write-btn" disabled="disabled" data-post-id="${content.post.id}">게시</button>
						</div>
					</div>			
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
</div>

<%-- 글쓰기 모달 --%>
<jsp:include page="../community/community_post_modal.jsp" />

<%-- ...버튼 모달 --%>
<div class="modal fade" id="moreModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    	<div class="more-modal">
    		<button type="button" class="more-modal-delete-btn">삭제하기</button>
    	</div>
    </div>
  </div>
</div>

<script>
$(document).ready(function() {
	
	$('.community-post-id').on('click', function() {
		var postId = $(this).data('post-id');
		$('.card-number-' + postId).slideToggle('slow');
	});
	
	// 글내용 더보기 기능
	$('.community-post-body-content-box').each(function() {
		// 더보기 버튼
		var moreBtn = $(this).find('.community-post-body-content-view-more-btn');
		
		// 글 내용
		var content = $(this).find('.community-post-body-content');
		var contentText = content.text().trim();
		
		if (contentText.length > 9) {
			// 글 내용 요약
			var contentShort = contentText.substring(0, 10) + "...";
			
			// 글 내용이 10글자 이상일 때 글자수를 10자로 줄이고, 더보기 버튼을 노출한다
			content.html(contentShort);
			moreBtn.removeClass('d-none');
			
		} else {
			// 10글자 미만일 때 더보기 버튼 숨기기
			moreBtn.addClass('d-none');
		}
		
		// 더보기 버튼 클릭하면 글 내용 전체 보이기
		moreBtn.on('click', function() {
			content.html(contentText);
			moreBtn.addClass('d-none');
		});
	});
	
	// more modal에 postId 주입
	$('.community-post-more-btn').on('click', function() {
		var postId = $(this).data('post-id');
		$('.more-modal-delete-btn').data('post-id', postId);
	});
	
	// 글 삭제
	$('.more-modal-delete-btn').on('click', function() {
		var postId = $(this).data('post-id');
		
		$.ajax({
			type: "DELETE"
			, url: "/post/delete"
			, data: {"postId":postId}
			, success: function(data) {
				if (data.result == 'success') {
					location.reload();
				} else {
					alert(data.errorMessage);
				}
			}
			, error: function(e) {
				alert('글 삭제에 실패했습니다. 관리자에게 문의해주세요.');
			}
		});
	});
	
	
	// 좋아요 버튼 클릭
	$('.community-post-like-btn').on('click', function() {
		var postId = $(this).data('post-id');
		var likeImg = $(this).find('img');
		
		
		$.ajax({
			url: "/like/" + postId
			, success: function(data) {
				if (data.result == 'success') {
					if (data.like) {
						likeImg.attr('src', '/image/like(on).png');
					} else {
						likeImg.attr('src', '/image/like(off).png')
					}
				}
			}
			, error: function(e) {
				alert('좋아요에 실패했습니다. 관리자에게 문의해주세요.');
			}
		});
	});
	
	// 댓글 입력 시에만 게시 버튼 활성화
	$('.community-post-footer-comment-write-input').on('keyup', function() {
		var comment = $(this).val().trim();
		if (comment != '') {
			$('.community-post-footer-comment-write-btn').attr('disabled', false);
		} else {
			$('.community-post-footer-comment-write-btn').attr('disabled', true);
		}
	});
	
	// 댓글 쓰기
	$('.community-post-footer-comment-write-btn').on('click', function() {
		var postId = $(this).data('post-id');
		var comment = $('#comment' + postId).val().trim();
		
		// validation
		if (comment == '') {
			alert('댓글을 입력해주세요');
			return;
		}
		
		$.ajax({
			type: "POST"
			, url: "/comment/write"
			, data: {"comment":comment, "postId":postId}
			, success: function(data) {
				if (data.result == 'success') {
					location.reload(true);
				} else {
					alert(data.errorMessage);
				}
			}
			, error: function(e) {
				alert('댓글 작성에 실패했습니다. 관리자에게 문의해주세요.');
			}
		});
	});
	
	// 댓글 삭제
	$('.community-post-footer-comment-delete-btn').on('click', function() {
		var postId = $(this).data('post-id');
		var commentId = $(this).data('comment-id');
		
		$.ajax({
			type: "DELETE"
			, url: "/comment/delete"
			, data: {"postId":postId, "commentId":commentId}
			, success: function(data) {
				if (data.result == 'success') {
					location.reload(true);
				} else {
					alert(data.errorMessage);
				}
			}
			, error: function(e) {
				alert('댓글 삭제에 실패했습니다. 관리자에게 문의해주세요.');
			}
		});
	});
	
	});
</script>