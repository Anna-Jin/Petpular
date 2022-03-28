package com.petpular.community.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	public List<ContentView> generateContentViewList(int userId) {
		List<ContentView> contentList = new ArrayList<>();
		
		List<Post> postList = postBO.getPostList(userId);
		
		for (Post post : postList) {
			User user = userBO.getUserByUserId(post.getUserId());
			
			ContentView content = ContentView.builder()
					// ContentView에 포스트 집어넣기
					.post(post)
					.user(user)
					.build();
			
			contentList.add(content);
		}
		
		return contentList;
	}
}
