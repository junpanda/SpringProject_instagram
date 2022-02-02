package com.junpanda.instagram.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.junpanda.instagram.feed.BO.FeedBO;
import com.junpanda.instagram.feed.model.Feed;

@Controller
public class MainController {
	
	@Autowired
	private FeedBO feedBO;
	
	@GetMapping("/main/view")
	public String mainview(Model model) {

		
		List<Feed> feedlist = feedBO.getFeedList();
		model.addAttribute("feedlist",feedlist);
		
		return "main/mainview";
	}

}
