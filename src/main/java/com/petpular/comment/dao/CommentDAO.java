package com.petpular.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.petpular.comment.model.Comment;

@Repository
public interface CommentDAO {

	List<Comment> selectCommentList(int postId);
	
	int insertComment(
			@Param("userId") int userId, 
			@Param("postId") int postId,
			@Param("comment") String comment);
	
	int deleteComment(
			@Param("userId") int userId ,
			@Param("postId") int postId, 
			@Param("commentId") int CommentId);
	
	void deleteCommentByPostId(int postId);
}
