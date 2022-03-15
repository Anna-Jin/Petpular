<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside class="d-flex flex-column">
	<div class="gnb-logo-box d-flex justify-content-center align-items-center">
		<div class="gnb-logo">Petpular</div>
	</div>
	<div class="gnb-nav-box">
		<ul class="nav flex-column">
		  <li class="nav-item">
		    <a class="nav-link"href="/main">About</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">My pet</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">Community</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">Service</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">For you</a>
		  </li>
		</ul>
	</div>
	<div class="gnb-login-btn-box d-flex justify-content-center align-items-center">
		<a type="button" class="gnb-login-btn" href="/user/login">Login</a>
	</div>
</aside>

<script>
$(document).ready(function() {
	$('.nav').on('click', function() {
		
	});
});
</script>