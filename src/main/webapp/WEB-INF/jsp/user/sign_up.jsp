<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Petpular</title>

<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<!--  css -->
<link rel="stylesheet" type="text/css" href="/css/sign_up_style.css">
<link rel="stylesheet" type="text/css" href="/css/global_style.css">

</head>
<body>
	<div class="wrap">
		<form id="signup-form" method="post" action="/user/signup">
			<div class="signup-box d-flex flex-column justify-content-around">
				<div class="d-flex justify-content-center">
					<div class="logo mt-3">Petpular</div>
				</div>
				<div class="d-flex justify-content-center">
					<div class="signup-text">회원가입</div>
				</div>
				<div class="m-0 p-0">
					<div class="d-flex">
						<div class="mt-1 p-0 col-4 d-flex justify-content-end font-size-14 font-weight-bold">
							<label for="loginId">아이디</label>
						</div>
						<div class="ml-3 col-8">
							<div class="input-width">
								<input type="text" class="form-control form-control-sm loginId-area" id="loginId" name="loginId" placeholder="아이디를 입력해주세요">
								<span class="id-val-chk text-danger small d-none">필수정보입니다</span>
								<span class="id-duplicate text-danger small d-none">중복된 아이디입니다</span>
								<span class="id-not-duplicate text-success small d-none">사용가능한 아이디입니다</span>
							</div>
						</div>
					</div>
				</div>
				<div class="m-0 p-0">
					<div class="d-flex">
						<div class="mt-1 p-0 col-4 d-flex justify-content-end font-size-14 font-weight-bold">
							<label for="name">이름</label>
						</div>
						<div class="ml-3 col-8">
							<div class="input-width">
								<input type="text" class="form-control form-control-sm name-area" id="name" name="name" placeholder="이름을 입력해주세요">
								<span class="name-val-chk text-danger small d-none">필수정보입니다</span>
							</div>
						</div>
					</div>
				</div>
				<div class="m-0 p-0">
					<div class="d-flex">
						<div class="mt-1 p-0 col-4 d-flex justify-content-end font-size-14 font-weight-bold">
							<label for="email">이메일</label>
						</div>
						<div class="ml-3 col-8">
							<div class="input-width">
								<input type="text" class="form-control form-control-sm email-area" id="email" name="email" placeholder="example@example.com">
								<span class="email-val-chk text-danger small d-none">필수정보입니다</span>
								<span class="email-form-chk text-danger small d-none">이메일 형식을 확인해주세요</span>
								<span class="email-duplicate text-danger small d-none">중복된 이메일입니다</span>
								<span class="email-not-duplicate text-success small d-none">사용가능한 이메일입니다</span>
							</div>
						</div>
					</div>	
				</div>
				<div class="m-0 p-0">
					<div class="d-flex">
						<div class="mt-1 p-0 col-4 d-flex justify-content-end font-size-14 font-weight-bold">
							<label for="password">비밀번호</label>
						</div>
						<div class="ml-3 col-8">
							<div class="input-width">
								<input type="password" class="form-control form-control-sm password-area" id="password" name="password" placeholder="비밀번호를 입력해주세요">
								<span class="password-val-chk text-danger small d-none">필수정보입니다</span>
							</div>
						</div>
					</div>
				</div>
				<div class="m-0 p-0">
					<div class="d-flex">
						<div class="mt-1 p-0 col-4 d-flex justify-content-end font-size-14 font-weight-bold">
							<label for="password-chk">비밀번호 확인</label>
						</div>
						<div class="ml-3 col-8">
							<div class="input-width">
								<input type="password" class="form-control form-control-sm" id="passwordChk" placeholder="비밀번호를 다시 입력해주세요">
								<span class="password-chk text-danger small d-none">비밀번호가 다릅니다</span>
							</div>
						</div>
					</div>	
				</div>
				<div class="d-flex justify-content-center">
					<button type="submit" id="signup-btn" class="btn mt-2">회원가입</button>
				</div>
				
				
				<div class="d-flex flex-column align-items-center pb-5">
					<hr class="signup-hr">
					<div class="d-flex mt-4 mb-0">
						<div class="font-color font-size-14 mr-3">이미 아이디가 있으신가요?</div>
						<a href="/user/login" class="font-size-14">로그인</a>
					</div>
				</div>
			</div>
		</form>	
	</div>
	
	<script>
		$(document).ready(function() {
			
			// 아이디 중복확인
			$('body').on('click', function(e) {
				$('.id-duplicate').addClass('d-none');
				$('.id-not-duplicate').addClass('d-none');
				
				// 아이디 input창 외부 클릭 시 유효성 체크
				if (!$(e.target).hasClass('loginId-area')) {
					var loginId = $('#loginId').val().trim();
					
					if (loginId == '') {
						$('.id-val-chk').removeClass('d-none');
						return;
					}
				
					$.ajax({
						url: "/user/duplicate_loginId"	
						, data: {"loginId":loginId}
						, success: function(data) {
							if (data.result) {
								// 중복인 경우
								$('.id-duplicate').removeClass('d-none');
							} else if (data.result == false) {
								// 중복이 아닌 경우
								$('.id-not-duplicate').removeClass('d-none');
							}
						}
						, error: function(e) {
							alert('중복 확인에 실패했습니다. 관리자에게 문의해주세요.');
						}
					});
				
				}
			});
			
			// 이메일 중복 확인
			$('body').on('click', function(e) {
				if (!$(e.target).hasClass('email-area')) {
					var email = $('#email').val().trim();
					
					if (email == '') {
						$('.email-val-chk').removeClass('d-none');
						return;
					} else {
						$('.email-val-chk').addClass('d-none');
						$('.email-form-chk').addClass('d-none');
					}
					
					if (!email.includes('@')) {
						$('.email-val-chk').addClass('d-none');
						$('.email-form-chk').removeClass('d-none');
					}
					
					$.ajax({
						url: "/user/duplicate_email"	
						, data: {"email":email}
						, success: function(data) {
							if (data.result) {
								// 중복인 경우
								$('.email-duplicate').removeClass('d-none');
							} else if (data.result == false) {
								// 중복이 아닌 경우
								$('.email-not-duplicate').removeClass('d-none');
							}
						}
						, error: function(e) {
							alert('중복 확인에 실패했습니다. 관리자에게 문의해주세요.');
						}
					});
				}
			});
			
			
			
			
			// validation check
			$('#loginId').keyup(function() {
				$('.id-duplicate').addClass('d-none');
				$('.id-not-duplicate').addClass('d-none');
				
				let loginId = $(this).val().trim();
				if (loginId == '') {
					$('.id-val-chk').removeClass('d-none');
				} else {
					$('.id-val-chk').addClass('d-none');
				}	
			});
			
			$('#name').keyup(function() {
				let name = $(this).val().trim();
				if (name == '') {
					$('.name-val-chk').removeClass('d-none');
				} else {
					$('.name-val-chk').addClass('d-none');
				}	
			});
			
			// 이름 input창 외부 클릭 시 유효성 체크
			$('body').on('click', function(e) {
				if (!$(e.target).hasClass('name-area')) {
					let name = $('#name').val().trim();
					if (name == '') {
						$('.name-val-chk').removeClass('d-none');
					} else {
						$('.name-val-chk').addClass('d-none');
					}
				}
			});
			
			$('#email').keyup(function() {
				let email = $(this).val().trim();
				if (email == '') {
					$('.email-val-chk').removeClass('d-none');
					$('.email-form-chk').addClass('d-none');
				} else {
					$('.email-val-chk').addClass('d-none');
					$('.email-form-chk').addClass('d-none');
				}	
			});
			
			$('#password').keyup(function() {
				let password = $(this).val().trim();
				if (password == '') {
					$('.password-val-chk').removeClass('d-none');
				} else {
					$('.password-val-chk').addClass('d-none');
				}			
			});
			
			// 비밀번호 input창 외부 클릭 시 유효성 체크
			$('body').on('click', function(e) {
				if (!$(e.target).hasClass('password-area')) {
					let password = $('#password').val().trim();
					
					if (password == '') {
						$('.password-val-chk').removeClass('d-none');
					} else {
						$('.password-val-chk').addClass('d-none');
					}
				}	
			});
			
			$('#passwordChk').keyup(function() {
				let password = $('#password').val().trim();
				let passwordChk = $(this).val().trim();
				if (passwordChk != password || passwordChk == '') {
					$('.password-chk').removeClass('d-none');
					return false;
				} else {
					$('.password-chk').addClass('d-none');
				}	
			});
			
			// 회원가입 버튼 클릭
			$('#signup-form').on('submit', function(e) {
				e.preventDefault();
				
				let loginId = $('#loginId').val().trim();
				if (loginId == '') {
					$('.id-val-chk').removeClass('d-none');
					return false;
				}
				
				let name = $('#name').val().trim();
				if (name == '') {
					$('.name-val-chk').removeClass('d-none');
					return false;
				}
				
				let email = $('#email').val().trim();
				if (email == '') {
					$('.email-val-chk').removeClass('d-none');
					return false;
				}
				
				if (!email.includes('@')) {
					$('.email-form-chk').removeClass('d-none');
					return false;
				}
				
				let password = $('#password').val().trim();
				if (password == '') {
					$('.password-val-chk').removeClass('d-none');
					return false;
				}
					
				let passwordChk = $('#passwordChk').val().trim();
				if (passwordChk != password || passwordChk == '') {
					$('.password-chk').removeClass('d-none');
					return false;
				}
				
				let url = $(this).attr('action');
				let params = $(this).serialize();
				
				$.post(url, params)
				.done(function(data) {
					if (data.result == 'success') {
						location.href="/user/login"
					} else if (data.result == 'error') {
						alert(data.errorMessage);
					}
				});
			});
			
		});
		
	</script>

</body>
</html>