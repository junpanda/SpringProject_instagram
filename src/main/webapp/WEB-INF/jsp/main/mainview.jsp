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
				<span class="font-weight-bold">${userName }</span> <a href="/user/sign_out" id="logout" class="ml-1">로그아웃</a>
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
						<!--사용자 이름, 삭제기능  -->
						<div class="d-flex justify-content-between bg-white" id="mainbody_nic">
							<div class="font-weight-bold">
								${feed.nameView }
							</div>
							<div class="pr-2">
								<img src="/static/photo/delete.png" id="pic_delete" class="pic_delete" 
								data-feed-id="${feed.id }" data-user-id="${feed.userId }">
							</div>
						</div>
						<!--사진  -->
						<div style="height:300px" class="d-flex justify-content-center">
							<img src="${feed.imagePath }" class="main_image">
						</div>
						<!--좋아요 기능  -->
						<div class="pb-2">
							<c:forEach var="feedheart" items="${feedheartlist }">
								<c:if test= "${feedheart.userId == userId && feedheart.feedId == feed.id }">
									<img src="/static/photo/heart-icon2.png" class="pic_heart pr-2" data-feed-id="${feed.id }">
									<c:set var = "check" value = "${feed.id }"/>
								</c:if>
							</c:forEach>
							<c:if test= "${check != feed.id}">
								<img src="/static/photo/heart-icon.png" class="pic_heart pr-2" data-feed-id="${feed.id }">
							</c:if>
							<c:forEach var="count" items="${countlist }">
							 	<c:if test="${count.feedId ==  feed.id}">
								 	좋아요 <span class="count${count.feedId }">${count.count }</span>개
								 	<c:set var = "check2" value = "${count.feedId }"/>
							 	</c:if>
							 </c:forEach>
							 <c:if test= "${check2 != feed.id}">
							 좋아요 <span class="count${feed.id }">0</span>개
							 </c:if>
						</div>
						<!--피드 내용  -->
						<div class="pb-2 d-flex">
							<div class="font-weight-bold pr-2">
								${feed.nameView }
							</div>
							<div>
								${feed.content }
							</div>
						</div>
						<!--댓글 -->
						<div class=" mb-2 font-weight-bold bg-white align-self-center">
							댓글
						</div>
						<c:forEach var="comment" items="${commentlist }">
							 <c:if test="${feed.id == comment.feedId }">
								<div class="d-flex pb-1">
									<div class="pr-2 font-weight-bold">${comment.nameView }</div> 
									<div>${comment.comment }</div>
									<div class="pl-2">
										<img src="/static/photo/x-icon.png" class="x-icon" 
										data-comment-id="${comment.id }" data-user-id="${comment.userId }">
									</div>  
								</div>
							 </c:if> 
						</c:forEach>
						<div id="comment_div" class="pt-1">
								<input type="text" class="comment_input commentInput" placeholder="댓글 달기" id="commentInput${feed.id }">
								<button type="submit" class="btn btn-primary commentBtn" data-feed-id="${feed.id }">게시</button>
						</div>
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
			
			/*게시물 올리기  */
			$("#saveBtn").on("click",function(){
				let content = $("#contentInput").val().trim();
				
				if(content == "") {
					alert("내용을 입력하세요");
					return ;
				}
				
				var formData = new FormData();
				formData.append("content",content);
			 	formData.append("file",$("#input_file")[0].files[0]); 
			
				
				$.ajax({
					type:"post",
					url:"/feed/create",
					data:formData,
					enctype:"multipart/form-data",//파일 업로드 필수
					processData:false,//파일 업로드 필수
					contentType:false,//파일 업로드 필수 
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
			
			/*게시물 지우기  */
			$(".pic_delete").on("click",function(){
				let feedId = $(this).data("feed-id");
				let userId = $(this).data("user-id");
				
				if(userId == ${userId}){
					$.ajax({
						type:"post",
						url:"/feed/delete",
						data:{"feedId":feedId},
						success:function(data){
							if(data.result == "success"){
								alert("피드 삭제 완료");
								location.href="/main/view";
							}
							else{
								alert("피드 삭제 실패");
							}
						},
						error:function(){
							alert("에러발생");
						}
					});
					$.ajax({
						type:"post",
						url:"/comment/feed_delete",
						data:{"feedId":feedId},
						success:function(data){
							if(data.result == "success"){
								return ;
							}
							else{
								alert("댓글 삭제 실패");
							}
						},
						error:function(){
							alert("에러발생");
						}
					});
				}
				else{
					alert("삭제하실 수 없는 게시물입니다.");
				}
				
			});
			
			/*댓글 쓰기  */
			$(".commentBtn").on("click",function(){
				let feedId = $(this).data("feed-id");
				let come = 'commentInput' + feedId;
				let comment = $("#" + come).val();
				
				if(comment == "") {
					alert("내용을 입력하세요");
					return ;
				}
				
				$.ajax({
					type:"post",
					url:"/comment/create",
					data:{"feedId":feedId,"comment":comment},
					success:function(data){
						if(data.result == "success"){
							alert("댓글 등록 완료");
							location.href="/main/view";
						}
						else{
							alert("댓글 실패");
						}
					},
					error:function(){
						alert("에러발생");
					}
				});
			});
			
			/*댓글 지우기  */
			$(".x-icon").on("click",function(){
				let commentId = $(this).data("comment-id");
				let userId = $(this).data("user-id")
				
				if(userId == ${userId}){
					$.ajax({
						type:"post",
						url:"/comment/delete",
						data:{"commentId":commentId},
						success:function(data){
							if(data.result == "success"){
								alert("댓글 삭제 완료");
								location.href="/main/view";
							}
							else{
								alert("댓글 삭제 실패");
							}
						},
						error:function(){
							alert("에러발생");
						}
					});
				}
				else{
					alert("삭제하실 수 없는 댓글입니다.");
				}
			});
			
			/*좋아요 누르기  */
			$(".pic_heart").on("click",function(){
				let feedId = $(this).data("feed-id");
				let count = 'count' + feedId;
				
				
				
				if($(this).attr("src") == "/static/photo/heart-icon.png"){
					$(this).attr("src","/static/photo/heart-icon2.png");
					let num = $("."+count).text();
					num++;
					$("."+count).text(num);
					
					$.ajax({
						type:"post",
						url:"/feedheart/love",
						data:{"feedId":feedId},
						success:function(data){
							if(data.result == "success"){
								return;
							}
							else{
								alert("좋아요 누름 실패");
							}
						},
						error:function(){
							alert("에러발생");
						}
					});
				}
				else{
					$(this).attr("src","/static/photo/heart-icon.png");
					let num = $("."+count).text();
					num--;
					$("."+count).text(num);
					
					$.ajax({
						type:"post",
						url:"/feedheart/delete",
						data:{"feedId":feedId},
						success:function(data){
							if(data.result == "success"){
								return;
							}
							else{
								alert("좋아요 취소 실패");
							}
						},
						error:function(){
							alert("에러발생");
						}
					}); 
				}
			});
				
		});
			
	</script>
		
</html>