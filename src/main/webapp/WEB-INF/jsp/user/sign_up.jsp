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
		<div class="d-flex justify-content-center mb-4">
			<div class="display-4 font-color font-weight-bold">Petpular</div>
		</div>
		<div class="signup-box d-flex flex-column justify-content-between">
			<div class="d-flex justify-content-center pt-5">
				<h4>회원가입</h4>
			</div>
			<div class="m-0 p-0 d-flex align-items-center">
				<div class="m-0 p-0 col-4 d-flex justify-content-end font-size-14 font-weight-bold">
					<label for="id">아이디</label>
				</div>
				<div class="ml-3 col-8">
					<div class="w-50">
						<input type="text" class="form-control" id="id" name="id">
					</div>
				</div>
			</div>
			<div class="m-0 p-0 d-flex align-items-center">
				<div class="m-0 p-0 col-4 d-flex justify-content-end font-size-14 font-weight-bold">
					<label for="name">이름</label>
				</div>
				<div class="ml-3 col-8">
					<div class="w-50">
						<input type="text" class="form-control" id="name" name="name">
					</div>
				</div>
			</div>
			<div class="m-0 p-0 d-flex align-items-center">
				<div class="m-0 p-0 col-4 d-flex justify-content-end font-size-14 font-weight-bold">
					<label for="email">이메일</label>
				</div>
				<div class="ml-3 col-8">
					<div class="w-50">
						<input type="text" class="form-control" id="email" name="email">
					</div>
				</div>
			</div>
			<div class="m-0 p-0 d-flex align-items-center">
				<div class="m-0 p-0 col-4 d-flex justify-content-end font-size-14 font-weight-bold">
					<label for="password">비밀번호</label>
				</div>
				<div class="ml-3 col-8">
					<div class="w-50">
						<input type="password" class="form-control" id="password" name="password">
					</div>
				</div>
			</div>
			<div class="m-0 p-0 d-flex align-items-center">
				<div class="m-0 p-0 col-4 d-flex justify-content-end font-size-14 font-weight-bold">
					<label for="password-chk">비밀번호 확인</label>
				</div>
				<div class="ml-3 col-8">
					<div class="w-50">
						<input type="password" class="form-control" id="password-chk">
					</div>
				</div>
			</div>
			<div class="d-flex justify-content-center">
				<button type="button" id="signup-btn" class="btn">회원가입</button>
			</div>
			<div class="d-flex flex-column align-items-center pb-5">
				<hr class="signup-hr">
				<div class="d-flex mt-4">
					<div class="font-color font-size-14 mr-3">이미 아이디가 있으신가요?</div>
					<a href="#" class="font-size-14">로그인</a>
				</div>
			</div>
		</div>
	</div>
	
	

</body>
</html>