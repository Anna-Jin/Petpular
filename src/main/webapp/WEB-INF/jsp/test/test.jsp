<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hello world</title>

<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.1.3/dist/litera/bootstrap.css">
<link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css' rel='stylesheet'>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>

</style>

</head>
<body>
<h1>test</h1>
	<c:forEach items="[1, 2, 3, 4]" var="test" varStatus="status">
	<button type="button" class="test-btn" data-status="${status.index}">버튼</button>
	
	<div class="x">
		test2
	</div>
	</c:forEach>
	
<script>
	$(document).ready(function() {
		$('.x').hide();
		
		
		$('.test-btn').on('click', function() {
			$('.x').not($(this).next('.x').slideToggle("slow")).slideUp();
		});
	});	
</script>
</body>
</html>