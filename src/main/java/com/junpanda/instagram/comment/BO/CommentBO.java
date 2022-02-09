package com.junpanda.instagram.comment.BO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.junpanda.instagram.comment.DAO.CommentDAO;
import com.junpanda.instagram.comment.model.Comment;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;
	
	public int createComment(int userId, int feedId, String nameView, String comment) {
		return commentDAO.insertComment(userId, feedId, nameView, comment);
	}
	
	public List<Comment> getCommentList(){
		return commentDAO.selectCommentList();
	}
	
	public int deleteFeedComment(int feedId) {
		return commentDAO.deleteFeedComment(feedId);
	}
	
	public int deleteComment(int commentId) {
		return commentDAO.deleteComment(commentId);
	}
}
