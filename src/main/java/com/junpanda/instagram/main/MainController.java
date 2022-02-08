package com.junpanda.instagram.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.junpanda.instagram.comment.BO.CommentBO;
import com.junpanda.instagram.comment.model.Comment;
import com.junpanda.instagram.feed.BO.FeedBO;
import com.junpanda.instagram.feed.model.Feed;
import com.junpanda.instagram.feed.model.FeedHeart;

@Controller
public class MainController {
	
	@Autowired
	private FeedBO feedBO;
	
	@Autowired
	private CommentBO commentBO;
	
	@GetMapping("/main/view")
	public String mainview(Model model) {

		
		List<Feed> feedlist = feedBO.getFeedList();
		model.addAttribute("feedlist",feedlist);
		
		List<Comment> commentlist = commentBO.getCommentList();
		model.addAttribute("commentlist",commentlist);
		
		List<FeedHeart> feedheartlist = feedBO.getFeedHeartList();
		model.addAttribute("feedheartlist",feedheartlist);
		
		return "main/mainview";
	}

}
