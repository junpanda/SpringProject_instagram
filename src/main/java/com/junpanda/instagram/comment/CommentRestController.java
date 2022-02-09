package com.junpanda.instagram.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.junpanda.instagram.comment.BO.CommentBO;


@RestController
@RequestMapping("/comment") 
public class CommentRestController {
  
	@Autowired
	private CommentBO commentBO;
	
	  @PostMapping("/create") 
	  public Map<String, String> createcomment(
	  HttpServletRequest request,
	  @RequestParam("feedId") int feedId,
	  @RequestParam("comment") String comment){
	  
	  HttpSession session = request.getSession();
	  
	  //현재 로그인된 사용자의 user table 
	  int userId = (Integer)session.getAttribute("userId"); 
	  String nameView = (String)session.getAttribute("userName");
	  
	  Map<String, String> result = new HashMap<>();
	  
	  int count = commentBO.createComment(userId, feedId, nameView, comment);
		 
		 if(count==1) {
				result.put("result","success");
			}
			else {
				result.put("result","fail");
			}
			return result;
	  }
	  
	  @PostMapping("/delete")
	  public Map<String, String> commentdelete(
			  @RequestParam("commentId") int commentId){
		  
		  Map<String, String> result = new HashMap<>();
				  
			int count = commentBO.deleteComment(commentId);
			
			if(count==1) { 	
				result.put("result","success"); 
			} 
			else {
				 result.put("result","fail"); 
			} 
			return result;
		  
	  }
	  
	  @PostMapping("/feed_delete")
	  public Map<String, String> feeddelete(
			@RequestParam("feedId") int feedId){
			
		Map<String, String> result = new HashMap<>();
		
		int count = commentBO.deleteFeedComment(feedId);
		
		if(count==1) { 	
			result.put("result","success"); 
		} 
		else {
			 result.put("result","fail"); 
		} 
		return result;
	}
  
  }
 
