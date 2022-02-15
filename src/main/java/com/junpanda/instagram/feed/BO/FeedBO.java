package com.junpanda.instagram.feed.BO;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.junpanda.instagram.common.FileManagerService;
import com.junpanda.instagram.feed.DAO.FeedDAO;
import com.junpanda.instagram.feed.model.Feed;
import com.junpanda.instagram.feed.model.FeedHeart;
import com.junpanda.instagram.feed.model.FeedHeartCount;
import com.junpanda.instagram.feed.model.NewFeed;

@Service
public class FeedBO {
	
	@Autowired
	private FeedDAO feedDAO;
	
	public int createFeed(int userId, String nameView, String content, MultipartFile file) {
		
		//파일을 컴퓨터(서버)에 저장하고, 클라이언트(브라우저)가 접근 가능한 주소를 만들어 낸다.
		String filePath = FileManagerService.saveFile(userId,file);
				
		return feedDAO.insertFeed(userId, nameView, content,filePath);
	}
	
	public int deleteFeed(int feedId) {
		
		Feed feed =feedDAO.selectFeed(feedId);
		FileManagerService.removeFile(feed.getImagePath());
		return feedDAO.deleteFeed(feedId);
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
	
	public int deleteFeedHeart(int feedId) {
		return feedDAO.deleteFeedHeart(feedId);
	}
	
	public List<FeedHeart> getFeedHeartList(){
		return feedDAO.selectFeedHeartList();
	}
	
	public List<FeedHeartCount> getcount(){
		return feedDAO.getcount();
	}
	
	/*
	 * public List<NewFeed> getNewFeedList(){ List<NewFeed> newfeed = new
	 * ArrayList<>();
	 * 
	 * 
	 * }
	 */
	
}
