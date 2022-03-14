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
			<div class="d-flex justify-content-center mb-4">
				<div class="display-4 font-color font-weight-bold">Petpular</div>
			</div>
			<div class="signup-box d-flex flex-column justify-content-between">
				<div class="d-flex justify-content-center pt-5">
					<h4>회원가입</h4>
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
							</div>
						</div>
					</div>
				</div>
				<div class="m-0 p-0 d-flex align-items-center">
					<div class="mt-1 p-0 col-4 d-flex justify-content-end font-size-14 font-weight-bold">
						<label for="name">이름</label>
					</div>
					<div class="ml-3 col-8">
						<div class="input-width">
							<input type="text" class="form-control form-control-sm" id="name" name="name" placeholder="이름을 입력해주세요">
							<span class="name-val-chk text-danger small d-none">필수정보입니다</span>
						</div>
					</div>
				</div>
				<div class="m-0 p-0 d-flex align-items-center">
					<div class="mt-1 p-0 col-4 d-flex justify-content-end font-size-14 font-weight-bold">
						<label for="email">이메일</label>
					</div>
					<div class="ml-3 col-8">
						<div class="input-width">
							<input type="text" class="form-control form-control-sm" id="email" name="email" placeholder="example@example.com">
							<span class="email-val-chk text-danger small d-none">필수정보입니다</span>
							<span class="email-form-chk text-danger small d-none">이메일 형식을 확인해주세요</span>
						</div>
					</div>
				</div>
				<div class="m-0 p-0 d-flex align-items-center">
					<div class="mt-1 p-0 col-4 d-flex justify-content-end font-size-14 font-weight-bold">
						<label for="password">비밀번호</label>
					</div>
					<div class="ml-3 col-8">
						<div class="input-width">
							<input type="password" class="form-control form-control-sm" id="password" name="password" placeholder="비밀번호를 입력해주세요">
							<span class="password-val-chk text-danger small d-none">필수정보입니다</span>
						</div>
					</div>
				</div>
				<div class="m-0 p-0 d-flex align-items-center">
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
				<div class="d-flex justify-content-center">
					<button type="submit" id="signup-btn" class="btn">회원가입</button>
				</div>
				
				
				<div class="d-flex flex-column align-items-center pb-5">
					<hr class="signup-hr">
					<div class="d-flex mt-4 mb-0">
						<div class="font-color font-size-14 mr-3">이미 아이디가 있으신가요?</div>
						<a href="#" class="font-size-14">로그인</a>
					</div>
				</div>
			</div>
		</form>	
	</div>
	
	<script>
		$(document).ready(function() {
			
			// 중복확인
			/* $('body').on('click', function(e) {
				if (!$(e.target).hasClass('loginId-area')) {
					var loginId = $('#loginId').val().trim();
					
					if (loginId == '') {
						$('.id-val-chk').removeClass('d-none');
					}
				}
			}); */
			
			
			
			
			// validation check
			$('#loginId').keyup(function() {
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
			
			$('#email').keyup(function() {
				let email = $(this).val().trim();
				if (email == '') {
					$('.email-val-chk').removeClass('d-none');
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
			$('#signup-form').on('submit', function() {
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
				
				/* $.post(url, params)
				.done(function(data) {
					if (data.result == 'sucess') {
						alert('반갑습니다! 로그인해주세요.');
					} else {
						alert('회원가입에 실패했습니다. 다시 시도해주세요!');
					}
				}); */
			});
			
		});
		
	</script>

</body>
</html>