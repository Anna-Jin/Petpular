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

<style>
	body {
	margin: 100px;;
	}
</style>
</head>
<body>

<div class="container py-2">
    <div class="row">
        <div class="col">
            <a class="popper btn btn-outline-warning" data-bs-trigger="hover" data-bs-toggle="popover">Hover me</a>
            <div class="popper-content d-none">My popover content goes here.</div>
        </div>
    </div>
</div>

<button type="button" class="btn btn-lg btn-danger example-popover" data-bs-toggle="popover" title="Popover title" data-bs-content="And here's some amazing content. It's very engaging. Right?">Click to toggle popover</button>
	
<script>
$(document).ready(function() {
	$('.example-popover').popover({
		container: 'body'
	});
	
	$('.popper').popover({
        placement: 'left',
        container: 'body',
        html: true,
        content: function () {
            return $(this).next('.popper-content').html();
        }
    })
});
</script>
</body>
</html>