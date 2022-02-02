<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<div id = "main_wrap" class="bg-light ">
		<header  class = "d-flex align-items-center justify-content-around bg-white pt-2 " id="main_header">
			<div class = "ml-3">
				<a href="/main/view" id = "mainA"><h1>pandagram</h1></a>	
			</div>
			<div>
				${userName } <a href="/user/sign_out" id="logout" class="ml-1">로그아웃</a>
			</div>
		</header>
		<div class="d-flex justify-content-center">
			<section id="mainbody" class="pt-3">
				<div class="d-flex justify-content-center">
					<div id="textarea_div">
						<textarea cols="50" rows="6" placeholder="내용을 입력하시오" id="contentInput"></textarea>
						<label for="input_file">
							<img src="/static/photo/picicon.png" id="picicon">
						</label>
						<input type="file" id="input_file">
						<button type="button" class="btn btn-success" id="saveBtn">업로드</button>
					</div>
				</div>
				<c:forEach var="feed" items="${feedlist }">
					<div class="pt-4">
						<div class="d-flex justify-content-between bg-white" id="mainbody_nic">
							<div>${feed.nameView }</div>
							<div class="pr-2"><img src="/static/photo/delete.png" id="pic_delete"></div>
						</div>
						<div style="height:400px">사진</div>
						<div>
							<img src="/static/photo/heart-icon.png" class="pic_heart pr-2" id="heart1">
							<img src="/static/photo/heart-icon2.png" class="pic_heart pr-2 d-none" id="heart2">
							 개수
						</div>
						<div>${feed.content }</div>
						<div>댓글들</div>
						<div>댓글쓰는 란</div>
						<hr>
					</div>
				</c:forEach>
			</section>
		</div>
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
			
			$("#saveBtn").on("click",function(){
				let content = $("#contentInput").val().trim();
				
				if(content == "") {
					alert("내용을 입력하세요");
					return ;
				}
				
				var formData = new FormData();
				formData.append("content",content);
				/* formData.append("file",$("#fileInput")[0].files[0]); */
			
				
				$.ajax({
					type:"post",
					url:"/feed/create",
					data:{"content":content},
					/* enctype:"multipart/form-data",//파일 업로드 필수
					processData:false,//파일 업로드 필수
					contentType:false,//파일 업로드 필수 */
					success:function(data) {
						if(data.result == "success") {
							alert("피드 등록 완료");
							location.href="/main/view";
						} else {
							alert("피드 등록 실패");
						}
					},
					error:function() {
						alert("에러발생");
					}
				});
				
			});
			
			$("#heart1").on("click",function(){
				$("#heart1").addClass("d-none");
				$("#heart2").removeClass("d-none");
			});
			$("#heart2").on("click",function(){
				$("#heart2").addClass("d-none");
				$("#heart1").removeClass("d-none");
			});
		});
	</script>
		
</html>