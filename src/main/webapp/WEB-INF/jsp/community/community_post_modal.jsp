<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 글쓰기 모달 --%>
<div class="modal fade" id="postWriteModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="post-modal-header">
        <div class="post-modal-title">새 게시물</div>
      </div>
      <form id="postForm">
      <div class="post-modal-body">
        <div class="post-modal-body-img">
        	<button type="button" id="post-modal-body-img-btn" class="btn btn-primary">사진 업로드</button>
        	<img class="d-none" id="post-modal-body-img-file">
        	<input type="file" id="post-file" name="postFile" class="d-none" accept=".gif, .jpg, .png, .jpeg">
        </div>
      </div>
      <div class="post-modal-footer">
      	<div class="post-modal-footer-write-box">
      		<div class="post-modal-footer-write-id">
      			${userLoginId}
      		</div>
      		<textarea class="post-modal-footer-write-textarea" name="content" placeholder="내용을 입력해주세요"></textarea>
      	</div>
      	<div class="post-modal-footer-write-btn-box">
        	<button type="button" class="post-modal-footer-write-btn">게시</button>
        </div>
      </div>
      </form>
    </div>
  </div>
</div>


<script>
$(document).ready(function() {
	// 사진 업로드 버튼 클릭
	$('#post-modal-body-img-btn').on('click', function() {
		$('#post-file').click();
	});
	
	$('#post-file').on('change', function(e) {
		var postFile = e.target.files[0].name;
		
		// 확장자 유효성 확인
		var extension = postFile.split('.');
		if (extension.length < 2 || 
		 	(extension[extension.length - 1] != 'gif' 
		 	&& extension[extension.length - 1] != 'png' 
		 	&& extension[extension.length - 1] != 'jpg'
		 	&& extension[extension.length - 1] != 'jpeg')) {
		 	
		 	alert("이미지 파일만 업로드 할 수 있습니다.");
		 	return;
		 }
		
		// 파일 업로드 시 사진 업로드 버튼 숨기고 선택한 이미지 노출
		$('#post-modal-body-img-btn').addClass('d-none');
		$('#post-modal-body-img-file').removeClass('d-none');
		setImageFromFile(this, '#post-modal-body-img-file');
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

	// 모달 창 닫히면 입력값 초기화
	$('.modal').on('hidden.bs.modal', function() {
		console.log('modal close');
		$(this).find('form')[0].reset();
		$('#post-modal-body-img-file').attr('src', '');
		$('#post-modal-body-img-btn').removeClass('d-none');
	});
	
	// 게시물 등록
	$('.post-modal-footer-write-btn').on('click', function() {
		// 파일이 업로드 된 경우, 확장자 체크
		let postFile = $('#post-file').val();
		if (postFile != '') {
			let ext = postFile.split('.').pop().toLowerCase(); 			 
			if ($.inArray(ext, ['jpg', 'jpeg', 'png', 'gif']) == -1) {
				alert('jpg, jpeg, png, gif 파일만 업로드 할 수 있습니다.');
				return;
			}
		}
		
		if (postFile == '') {
			alert('사진을 업로드해주세요');
			return;
		}
		
		var formData = new FormData();
		
		formData.append('postFile', $('#post-file')[0].files[0]);
		formData.append('content', $('.post-modal-footer-write-textarea').val().trim());
		
		$.ajax({
			type: "POST"
			, url: "/post/write"
			, data: formData
			, enctype: "multipart/form-data" 	
			, processData: false			
			, contentType: false
			, success: function(data) {
				if (data.result == 'success') {
					location.reload();
				} else {
					alert(data.errorMassage);
				}
			}
			, error: function(e) {
				alert('게시물 등록에 실패했습니다. 관리자에게 문의해주세요.');
			}
		});
	});
});

</script>