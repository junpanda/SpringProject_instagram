<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
 <!-- bootstrap CDN link -->
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap" >
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section class=" bg-light d-flex justify-content-center mt-3" id="body">
			<div class="" id="textbody">
				<form id="joinForm">
					<input type="text" class="form-control mt-3" placeholder="아이디" id="loginIdInput">
					<input type="password" class="form-control mt-3" placeholder="비밀번호" id="passwordInput">
					<input type="password" class="form-control mt-3" placeholder="비밀번호 확인" id="passwordCheckInput">
					<input type="text" class="form-control mt-3" placeholder="이름" id="nameInput">
					<input type="text" class="form-control mt-3" placeholder="이메일" id="emailInput">
					<button type="submit" class="btn btn-block mt-3 btn-primary" id="joinBtn">회원가입</button>
				</form>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
</body>

	<script>
		$(document).ready(function(){
			$("#joinForm").on("submit", function(e){
				e.preventDefault();
				
				var loginId = $("#loginIdInput").val();
				var password = $("#passwordInput").val();
				var passwordCheck = $("#passwordCheckInput").val();
				var name = $("#nameInput").val();
				var email = $("#emailInput").val();
				
				if(loginId == ""){
					alert("아이디를 입력하세요")
					return;
				}
				if(password == ""){
					alert("비밀번호를 입력하세요")
					return;
				}
				if(passwordCheck == ""){
					alert("비밀번호 확인을 입력하세요")
					return;
				}
				if(password !== passwordCheck){
					alert("비밀번호가 일치하지 않습니다.")
					return;
				}
				if(name == ""){
					alert("이름을 입력하세요")
					return;
				}
				if(email == ""){
					alert("이메일을 입력하세요")
					return;
				}
				
				$.ajax({
					type : "post",
					url : "/user/sign_up",
					data : {"loginId" : loginId, "password":password, "name":name, "email":email},
					success:function(data){
						if(data.result == "success"){
							//로그인 화면으로 이동
							locatioin.href="/post/signin_view";
						}
						else{
							alert("회원가입 실패");
						}
					},
					error:function(){
						alert("에러 발생");
					}
				});
			});
		});
	</script>
</html>