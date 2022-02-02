<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
 <!-- bootstrap CDN link -->
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id = "user_wrap" class="bg-light pt-5">
			<section class="d-flex justify-content-center" id="body">
				<div>
					<img src="/static/photo/login.jpg" id = "login_photo">
				</div>
				<div class="bg-white" id="userbody1">
					<div class="text-center m-4">
						<form id = "loginForm">
							<div class="text-center mt-4 ">
								<a href="/user/signin_view" id = "mainA"><h1>pandagram</h1></a>	
							</div>
							<input type="text" class="form-control mt-4" placeholder="아이디" id="loginIdInput">
							<input type="password" class="form-control mt-3" placeholder="비밀번호" id="passwordInput">
							<button type="submit" class="btn btn-block mt-4 btn-primary" id="joinBtn">로그인</button>
						</form>
						<div class="mt-3">
							
							<a href="#" id = "faceA" class="text-info"><img src="/static/photo/facebook.png" id="facebook_photo" class="mr-1"> Facebook으로 로그인</a>
						</div>
					</div>
				</div>
			</section>
			<section class="d-flex justify-content-center mt-5 ">
				<div id="userbody2" class="bg-white d-flex justify-content-center align-items-center">
					<div>
						계정이 없으신가요? <a href="/user/signup_view">회원가입</a>
					</div>
				</div>
			</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
</body>
	<script>
		$(document).ready(function(){
			$("#loginForm").on("submit", function(e){
				e.preventDefault();
				
				var loginId = $("#loginIdInput").val();
				var password = $("#passwordInput").val();
				
				if(loginId ==""){
					alert("아이디를 입력하세요");
					return ;
				}
				if(password == ""){
					alert("비밀번호를 입력하세요");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/user/sign_in",
					data:{"loginId":loginId, "password":password},
					success:function(data){
						if(data.result == "success"){
							location.href="/main/view";
						}
						else{
							alert("아이디/비밀번호를 확인하세요");
						}
					},
					error:function(){
						alert("에러발생");
					}
				});
			});
		});
	</script>
</html>