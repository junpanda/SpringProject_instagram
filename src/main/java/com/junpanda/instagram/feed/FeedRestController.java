package com.junpanda.instagram.feed;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.junpanda.instagram.feed.BO.FeedBO;

@RestController	
@RequestMapping("/feed")
public class FeedRestController {
	
	@Autowired
	private FeedBO feedBO;
	
	@PostMapping("/create")
	public Map<String, String> createFeed(
			@RequestParam("content") String content,
			HttpServletRequest request){
		
		 HttpSession session = request.getSession();
		 
		 //현재 로그인된 사용자의 user table
		 int userId = (Integer)session.getAttribute("userId");
		 String nameView = (String)session.getAttribute("userName");
		 
		 int count = feedBO.createFeed(userId, nameView, content);
		 
		 Map<String, String> result = new HashMap<>();
		 
		 if(count==1) {
				result.put("result","success");
			}
			else {
				result.put("result","fail");
			}
			return result;
	}
	
	@PostMapping("heart/love")
	public Map<String, String> heartlove(
			HttpServletRequest request){
		
		 HttpSession session = request.getSession();
		 
		//현재 로그인된 사용자의 user table
		 int userId = (Integer)session.getAttribute("userId");
		 String nameView = (String)session.getAttribute("userName");
		
		 Map<String, String> result = new HashMap<>();
		
		 if(count==1) {
				result.put("result","success");
			}
			else {
				result.put("result","fail");
			}
			return result;
	}

}
