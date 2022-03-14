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
<link rel="stylesheet" type="text/css" href="/css/login_style.css">
<link rel="stylesheet" type="text/css" href="/css/global_style.css">
</head>
<body>
	<div class="wrap">
		<div class="d-flex justify-content-center mb-4">
			<div class="display-4 font-color font-weight-bold">Petpular</div>
		</div>
		<div class="login-box d-flex flex-column justify-content-between">
			<div class="d-flex justify-content-center pt-5">
				<h4>로그인</h4>
			</div>
			<div class="m-0 p-0">
				<div class="d-flex">
					<div
						class="mt-1 p-0 col-4 d-flex justify-content-end font-size-14 font-weight-bold">
						<label for="loginId">아이디</label>
					</div>
					<div class="ml-3 col-8">
						<div class="input-width">
							<input type="text" class="form-control form-control-sm loginId-area" id="loginId" name="loginId" placeholder="아이디를 입력해주세요"> 
							<span class="id-val-chk text-danger small d-none">아이디를 입력해주세요</span> 
						</div>
					</div>
				</div>
			</div>
			<div class="m-0 p-0">
				<div class="d-flex">
					<div
						class="mt-1 p-0 col-4 d-flex justify-content-end font-size-14 font-weight-bold">
						<label for="password">비밀번호</label>
					</div>
					<div class="ml-3 col-8">
						<div class="input-width">
							<input type="password" class="form-control form-control-sm password-area" id="password" name="password" placeholder="비밀번호를 입력해주세요"> 
							<span class="password-val-chk text-danger small d-none">비밀번호를 입력해주세요</span>
						</div>
					</div>
				</div>
			</div>
			<div class="d-flex justify-content-center">
				<button type="button" id="login-btn" class="btn">로그인</button>
			</div>


			<div class="d-flex flex-column align-items-center pb-5">
				<hr class="login-hr">
				<div class="d-flex mt-4 mb-0">
					<div class="font-color font-size-14 mr-3">회원이 아니신가요?</div>
					<a href="/user/signup" class="font-size-14">회원가입</a>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$(document).ready(function() {
			
			$('#loginId').keyup(function() {
				$('.id-val-chk').addClass('d-none');
			})
			
			$('#password').keyup(function() {
				$('.password-val-chk').addClass('d-none');
			})
			
			$('#login-btn').on('click', function() {
				$('.id-val-chk').addClass('d-none');
				$('.password-val-chk').addClass('d-none');
				
				
				// validation check
				let loginId = $('#loginId').val().trim();
				let password = $('#password').val().trim();
				if (loginId == '' && password == '') {
					$('.id-val-chk').removeClass('d-none');
					$('.password-val-chk').removeClass('d-none');
					return false;
				}
				
				if (loginId == '') {
					$('.id-val-chk').removeClass('d-none');
					return false;
				}
				
				if (password == '') {
					$('.password-val-chk').removeClass('d-none');
					return false;
				}
				
				
			});
			
		});
	</script>
</body>
</html>