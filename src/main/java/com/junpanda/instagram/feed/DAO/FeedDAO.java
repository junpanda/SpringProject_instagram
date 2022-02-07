package com.junpanda.instagram.feed.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.junpanda.instagram.feed.model.Feed;

@Repository
public interface FeedDAO {
	public int insertFeed(
			@Param("userId") int userId,
			@Param("nameView") String nameView,
			@Param("content") String content);
	
	public List<Feed> selectFeedList();
	
	public int insertloveFeed(
			@Param("feedId") int feedId,
			@Param("userId") int userId,
			@Param("nameView") String nameView);
	
	public int deleteloveFeed(
			@Param("feedId") int feedId,
			@Param("userId") int userId);
}
