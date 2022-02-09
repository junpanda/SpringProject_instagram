package com.junpanda.instagram.feed;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.junpanda.instagram.comment.BO.CommentBO;
import com.junpanda.instagram.feed.BO.FeedBO;

@RestController	
public class FeedRestController {
	
	@Autowired
	private FeedBO feedBO;
	
	@Autowired
	private CommentBO commentBO;
	
	@PostMapping("/feed/create")
	public Map<String, String> createFeed(
			@RequestParam("content") String content,
			@RequestParam(value="file", required = false) MultipartFile file, 
			HttpServletRequest request){
		
		 HttpSession session = request.getSession();
		 
		 //현재 로그인된 사용자의 user table
		 int userId = (Integer)session.getAttribute("userId");
		 String nameView = (String)session.getAttribute("userName");
		 
		 int count = feedBO.createFeed(userId, nameView, content, file);
		 
		 Map<String, String> result = new HashMap<>();
		 
		 if(count==1) {
				result.put("result","success");
			}
			else {
				result.put("result","fail");
			}
			return result;
	}
	
	@PostMapping("/feed/delete")
	public Map<String, String> feeddelete(
			@RequestParam("feedId") int feedId){
		
		Map<String, String> result = new HashMap<>();
		  
		int count = feedBO.deleteFeed(feedId);
		
		int count1 = commentBO.deleteFeedComment(feedId);
		
		int count2 = feedBO.deleteFeedHeart(feedId);
		  
		if(count==1) { 
			  result.put("result","success"); 
			  } 
		else {
			  result.put("result","fail"); 
		  } 
		return result;
	}
	
	
	  @PostMapping("/feedheart/love") 
	  public Map<String, String> heartlove(
			  @RequestParam("feedId") int feedId,
			  HttpServletRequest request){
		  
		  HttpSession session = request.getSession();
		  
		  //현재 로그인된 사용자의 user table 
		  int userId = (Integer)session.getAttribute("userId"); 
		  String nameView = (String)session.getAttribute("userName");
		  
		  Map<String, String> result = new HashMap<>();
		  
		  int count = feedBO.loveFeed(feedId, userId, nameView);
		  
		  if(count==1) { 
			  result.put("result","success"); 
			  } 
		  else {
			  result.put("result","fail"); 
		  } 
		  return result; 
	  }
	  
	  @PostMapping("/feedheart/delete")
	  public Map<String, String> heartdelete(
			  @RequestParam("feedId") int feedId,
			  HttpServletRequest request){
		  
		  HttpSession session = request.getSession();
		  
		  //현재 로그인된 사용자의 user table 
		  int userId = (Integer)session.getAttribute("userId"); 
		  
		  Map<String, String> result = new HashMap<>();
		  
		  int count = feedBO.deleteloveFeed(feedId, userId);
		  
		  if(count==1) { 
			  result.put("result","success"); 
			  } 
		  else {
			  result.put("result","fail"); 
		  } 
		  return result; 
		  
	  }
	 
}
