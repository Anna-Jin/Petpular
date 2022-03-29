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
							<a href="#" class="community-post-id" tabindex="0"
								data-toggle="popover" data-bs-trigger="focus"
								data-popover-content="#community-post-user-popover">${content.user.loginId}</a>

							<%-- 팝오버 --%>
						<div id="community-post-user-popover" class="popover d-none" role="tooltip">
							<div class="popover-arrow"></div>
							<div class="popover-header">
								<c:choose>
									<c:when test="${empty content.user.profileImageUrl}">
										<img src="/image/user.png" alt="유저 프로필 이미지" class="community-post-user-profile-img">
									</c:when>
									<c:otherwise>
										<img src="${content.user.profileImageUrl}" alt="유저 프로필 이미지" class="community-post-user-profile-img">
									</c:otherwise>
								</c:choose>
								<div>${content.user.loginId}</div>
							</div>
							<div class="popover-body">
								<div class="popover-body-title">반려동물</div>
								<div class="popover-body-content">
									<div class="popover-body-content-pet">
										<div class="popover-body-content-pet-img-box">
											<img src="/image/paws.png" alt="사진 없을 때" class="popover-body-content-pet-img">
										</div>
										<div class="d-flex flex-column align-items-center">
											<div class="popover-body-content-pet-name">진빵</div>
											<div class="popover-body-content-pet-breed">믹스</div>
										</div>
									</div>
									<div class="popover-body-content-pet">
										<div class="popover-body-content-pet-img-box">
											<img src="/image/paws.png" alt="사진 없을 때" class="popover-body-content-pet-img">
										</div>
										<div class="d-flex flex-column align-items-center">
											<div class="popover-body-content-pet-name">진빵</div>
											<div class="popover-body-content-pet-breed">믹스</div>
										</div>
									</div>
								</div>
								<div class="d-flex align-items-center mt-3">
									<div class="popover-body-title me-3">게시글</div>
									<div class="font-size-12">${content.countPost}</div>
								</div>
							</div>
						</div>
						<%-- 팝오버 --%>
						
						<fmt:formatDate value="${content.post.createdAt}" var="createdDate" pattern="yyyy년 MM월 dd일 a hh:mm"/>
						<div class="community-post-time">${createdDate}</div>
					</div>
				</div>
				<div class="community-post-header-right">
					<button type="button" id="community-post-more-btn" data-bs-toggle="modal" data-bs-target="#moreModal">
						<img src="/image/option.png" alt="옵션" class="community-post-more-img">
					</button>
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
					<button type="button" class="community-post-like-btn">
						<img src="/image/like(off).png" alt="좋아요 아이콘 off" class="community-post-like-img" data-post-id="${content.post.id}">
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
								<button type="button" class="community-post-footer-comment-delete-btn">
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

	// 팝 오버
	$("[data-toggle=popover]").popover({
			html : true,
			content : function() {
				var content = $(this).attr("data-popover-content");
				return $(content).children(".popover-body").html();
			},
			title : function() {
				var title = $(this).attr("data-popover-content");
				return $(title).children(".popover-header").html();
			},
			placement: 'left',
			offset: [60, 120]
		});
	
	
	// 글내용 더보기 기능
	$('.community-post-body-content-box').each(function() {
		// 더보기 버튼
		var moreBtn = $(this).find('.community-post-body-content-view-more-btn');
		
		// 글 내용
		var content = $(this).find('.community-post-body-content');
		var content_text = content.text().trim();
		
		if (content_text.length > 9) {
			// 글 내용 요약
			var content_short = content_text.substring(0, 10) + "...";
			
			// 글 내용이 10글자 이상일 때 글자수를 10자로 줄이고, 더보기 버튼을 노출한다
			content.html(content_short);
			moreBtn.removeClass('d-none');
			
		} else {
			// 10글자 미만일 때 더보기 버튼 숨기기
			moreBtn.addClass('d-none');
		}
		
		// 더보기 버튼 클릭하면 글 내용 전체 보이기
		moreBtn.on('click', function() {
			content.html(content_text);
			moreBtn.addClass('d-none');
		});
	});
	
	
	// 좋아요 버튼 클릭
	$('.community-post-like-img').on('click', function() {
		var postId = $(this).data('post-id');
		
		
		$.ajax({
			url: "/like/" + postId
			, success: function(data) {
				if (data.result == 'success') {
					alert('좋아요 성공');
					locaion.reload(true);
				} else {
					alert(data.errorMessage);
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
	
	});
</script>