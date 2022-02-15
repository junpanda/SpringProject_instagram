package com.junpanda.instagram.feed.model;

import java.sql.Date;
import java.util.List;

import com.junpanda.instagram.comment.model.Comment;

public class NewFeed {
	private List<Feed> feedNewList;
	private List<Comment> commentList;
	
	public List<Feed> getFeedNewList() {
		return feedNewList;
	}
	public void setFeedNewList(List<Feed> feedNewList) {
		this.feedNewList = feedNewList;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	
}
