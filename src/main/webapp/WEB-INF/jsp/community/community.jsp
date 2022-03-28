<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
		
		
		<%-- 게시물 card --%>
		<div id="community-post-box">
		
			<%-- header --%>
			<div class="community-post-header">
				<div class="community-post-header-left">
					<img src="/image/user.png" alt="유저 프로필 이미지" class="community-post-user-profile-img">
					<div>	
						<a href="#" class="community-post-id" tabindex="0" data-toggle="popover" data-bs-trigger="focus" data-popover-content="#community-post-user-popover">유저 아이디</a>
						
						<%-- 팝오버 --%>
						<div id="community-post-user-popover" class="popover d-none" role="tooltip">
							<div class="popover-arrow"></div>
							<div class="popover-header">
								<img src="/image/user.png" alt="유저 프로필 이미지" class="community-post-user-profile-img">
								<div>유저 아이디</div>
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
								<div class="d-flex align-items-center">
									<div class="popover-body-title me-3">게시글</div>
									<div class="font-size-12">20</div>
								</div>
							</div>
						</div>
						<%-- 팝오버 --%>
						
						<div class="community-post-time">3월 27일 오후 6:19</div>
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
				<div class="community-post-body-img">
					
				</div>
				
				<%-- 좋아요 버튼 --%>
				<div class="community-post-body-nav">
					<button type="button" class="community-post-like-btn">
						<img src="/image/like(off).png" alt="좋아요 아이콘 off" class="community-post-like-img">
					</button>
				</div>
				
				<%-- 게시물 내용 --%>
				<div class="community-post-body-content-box">
					<div class="community-post-body-content">
						글 내용, 10글자만 노출, 더보기 클릭시 모든 글자 노출<br>
						안녕하세요
					</div>
					<div>
						<span>...</span>
						<button type="button" class="community-post-body-content-view-more-bnt">
							더보기
						</button>
					</div>
				</div>
			</div>
			
			<%-- footer (게시물 댓글) --%>	
			<div class="community-post-footer">
				
				<%-- 댓글 내용 --%>
				<div class="community-post-footer-comment-box">
					<div class="community-post-footer-comment-left">
						<div class="community-post-footer-comment-id">
							댓글 작성자 아이디
						</div>
						<div>
							댓글 내용
						</div>
					</div>
					<div class="community-post-footer-comment-right">
						<button type="button" class="community-post-footer-comment-delete-btn">
							<img src="/image/close.png" class="community-post-footer-comment-delete-img">
						</button>
					</div>
				</div>
				<div class="community-post-footer-comment-box">
					<div class="community-post-footer-comment-left">
						<div class="community-post-footer-comment-id">
							댓글 작성자 아이디
						</div>
						<div>
							댓글 내용
						</div>
					</div>
					<div class="community-post-footer-comment-right">
						<button type="button" class="community-post-footer-comment-delete-btn">
							<img src="/image/close.png" class="community-post-footer-comment-delete-img">
						</button>
					</div>
				</div>
				
				<%-- 댓글 쓰기 --%>
				<div class="community-post-footer-comment-write-box">
					<div class="col-1">
						<img src="/image/comment.png" alt="댓글 아이콘" class="community-post-footer-comment-write-img">
					</div>
					<div class="col-9">
						<input type="text" class="community-post-footer-comment-write-input" id="comment" name="comment" placeholder="댓글달기">
					</div>
					<div class="col-2 d-flex justify-content-end">
						<button type="button" class="community-post-footer-comment-write-btn">게시</button>
					</div>
				</div>			
			</div>
		</div>
	</div>
</div>

<%-- 글쓰기 모달 --%>
<div class="modal fade" id="postWriteModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="post-modal-header">
        <div class="post-modal-title">새 게시물</div>
      </div>
      <div class="post-modal-body">
        <div class="post-modal-body-img">
        	<button type="button" class="btn btn-primary">사진 업로드</button>
        </div>
      </div>
      <div class="post-modal-footer">
      	<div class="post-modal-footer-write-box">
      		<div class="post-modal-footer-write-id">
      			유저 아이디
      		</div>
      		<textarea class="post-modal-footer-write-textarea" placeholder="내용을 입력해주세요"></textarea>
      	</div>
      	<div class="post-modal-footer-write-btn-box">
        	<button type="button" class="post-modal-footer-write-btn">게시</button>
        </div>
      </div>
    </div>
  </div>
</div>


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
	
	});
</script>