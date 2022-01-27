<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판다그램</title>
<!-- bootstrap CDN link -->
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id = "wrap">
		<header  class = "d-flex align-items-center justify-content-between bg-info">
			<div class = "ml-3">
				<h1>pandagram</h1>
			</div>
			<div>
				${userName } <a href="/user/sign_out" id="logout" class="ml-1">로그아웃</a>
			</div>
		</header>
		<section id="mainbody">
			<div class="mt-3 d-flex justify-content-center">
				<div>
					<textarea cols="50" rows="7" placeholder="내용을 입력하시오"></textarea>
				</div>
			</div>
		</section>
		
		<hr class="footer_hr">
	
		<footer class="d-flex align-items-center justify-content-center mt-3">
			<span>Copyright © pandagram 2022</span>
		</footer>
	</div>

</body>

	<script>
		$(document).ready(function(){
			$("#logout").on("click",function(){
				alert("로그아웃 되었습니다.");
			});
		});
	</script>
		
</html>