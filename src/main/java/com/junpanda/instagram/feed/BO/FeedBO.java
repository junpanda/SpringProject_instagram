package com.junpanda.instagram.feed.BO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.junpanda.instagram.feed.DAO.FeedDAO;
import com.junpanda.instagram.feed.model.Feed;

@Service
public class FeedBO {
	
	@Autowired
	private FeedDAO feedDAO;
	
	public int createFeed(int userId, String nameView, String content) {
		
		return feedDAO.insertFeed(userId, nameView, content);
	}
	
	public List<Feed> getFeedList(){
		return feedDAO.selectFeedList();
	}
	
	public int loveFeed(int feedId, int userId, String nameView) {
		return feedDAO.insertloveFeed(feedId, userId, nameView);
	}
	
	public int deleteloveFeed(int feedId, int userId) {
		return feedDAO.deleteloveFeed(feedId, userId);
	}
}
