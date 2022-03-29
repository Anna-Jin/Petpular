package com.petpular.community.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petpular.comment.bo.CommentBO;
import com.petpular.comment.model.CommentView;
import com.petpular.community.model.ContentView;
import com.petpular.post.bo.PostBO;
import com.petpular.post.model.Post;
import com.petpular.user.bo.UserBO;
import com.petpular.user.model.User;

@Service
public class CommunityBO {
	
	@Autowired
	private PostBO postBO;

	@Autowired
	private UserBO userBO;
	
	@Autowired
	private CommentBO commentBO;
	
	public List<ContentView> generateContentViewList(int userId) {
		List<ContentView> contentList = new ArrayList<>();
		
		List<Post> postList = postBO.getPostList();
		
		for (Post post : postList) {
			User user = userBO.getUserByUserId(post.getUserId());
			List<CommentView> commentList = commentBO.generateCommentListByPostId(post.getId());
			int countPost = postBO.countPost(user.getId());
			
			ContentView content = ContentView.builder()
					.post(post) // 포스트
					.user(user) // 사용자 (프로필 사진, 아이디)
					.commentList(commentList) // 댓글 리스트
					.countPost(countPost)
					.build();
					
			
			contentList.add(content);
		}
		
		return contentList;
	}
}
