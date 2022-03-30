<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="foryou-wrap">
	<div class="foryou-top">
		<div class="foryou-user-info">
			<div class="foryou-user-info-title">내 정보</div>
			<div class="foryou-user-info-box">
				<div class="foryou-user-info-profile-img-box">
					<img alt="프로필 이미지" src="/image/user.png" class="foryou-user-info-profile-img">
					<a href="#" class="foryou-user-info-profile-img-btn">사진 등록</a>
				</div>
				<div class="foryou-user-info-profile-box">
					<div class="foryou-user-info-profile-input-box">
						<div class="col-4 d-flex justify-content-around">
							<label for="id">아이디</label>
						</div>
						<div class="col-7">
							<input type="text" class="form-control profile-input" id="id" name="id">
						</div>
					</div>
					<div class="foryou-user-info-profile-input-box">
						<div class="col-4 d-flex justify-content-around">
							<label for="name">이름</label>
						</div>
						<div class="col-7">
							<input type="text" class="form-control profile-input" id="name" name="name">
						</div>
					</div>
					<div class="foryou-user-info-profile-input-box">
						<div class="col-4 d-flex justify-content-around">
							<label for="email">이메일</label>
						</div>
						<div class="col-7">
							<input type="text" class="form-control profile-input" id="email" name="email">
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
			<div class="foryou-post-box">
				<div class="d-flex justify-content-center align-items-center">
				<div class="foryou-each-post">
					<div class="foryou-post-content px-3">글 내용 (일정 글자수만 노출, 넘...</div>
					<div class="d-flex align-items-center px-3">
						<img src="/image/like(on).png" class="foryou-post-like">
					</div>
				</div>
					<div class="foryou-each-post-del-box px-3">
						<img src="/image/close.png" class="foryou-each-post-del-btn">
					</div>
				</div>
			</div>
		</div>
		<div class="foryou-pet">
			<div class="foryou-bottom-title">내 반려냥이</div>
			<div class="foryou-pet-box">
				<div class="foryou-pet-profile-box">
					<img src="/image/paws.png" alt="사진 없을 때" class="foryou-pet-profile-image">
				</div>
				<div class="foryou-pet-profile-hover">
					<a href="#" class="text-white">냥이 이름</a>
				</div>
			</div>
		</div>
	</div>
</div>