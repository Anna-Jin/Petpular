package com.petpular.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petpular.comment.dao.CommentDAO;
import com.petpular.comment.model.Comment;
import com.petpular.comment.model.CommentView;
import com.petpular.user.bo.UserBO;
import com.petpular.user.model.User;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;
	
	@Autowired
	private UserBO userBO;

	public int writeComment(int userId, int postId, String comment) {
		return commentDAO.insertComment(userId, postId, comment);
	}
	
	public List<CommentView> generateCommentListByPostId(int postId) {
		List<CommentView> resultList = new ArrayList<>();
		List<Comment> commentList = commentDAO.selectCommentList(postId);
		
		for (Comment comment : commentList) {
			User user = userBO.getUserByUserId(comment.getUserId());
			
			CommentView commentView = CommentView.builder()
									.comment(comment)
									.user(user)
									.build();
			
			resultList.add(commentView);
		}
		
		return resultList;
	}
	
	public int deleteComment(int userId, int postId, int CommentId) {
		return commentDAO.deleteComment(userId, postId, CommentId);
	}
	
	public void deleteCommentByPostId(int postId) {
		commentDAO.deleteCommentByPostId(postId);
	}
}
