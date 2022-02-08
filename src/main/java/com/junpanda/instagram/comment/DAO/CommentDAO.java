package com.junpanda.instagram.comment.DAO;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.junpanda.instagram.comment.model.Comment;

@Repository
public interface CommentDAO {
	public int insertComment(
			@Param("userId") int userId,
			@Param("feedId") int feedId,
			@Param("nameView") String nameView,
			@Param("comment") String comment);
	
	public List<Comment> selectCommentList();
	
	public int deleteFeedComment(@Param("feedId") int feedId);
}
