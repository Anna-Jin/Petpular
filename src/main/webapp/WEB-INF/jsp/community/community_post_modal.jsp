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
      <div class="post-modal-body">
        <div class="post-modal-body-img">
        	<button type="button" id="post-modal-body-img-btn" class="btn btn-primary">사진 업로드</button>
        	<img class="d-none" id="post-modal-body-img-file">
        	<input type="file" id="post-file" class="d-none" accept=".gif, .jpg, .png, .jpeg">
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
		 	$(this).val(""); // 이미 올라간 것을 확인한 것이기 때문에 비워주어야 한다.
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
});

</script>