package com.petpular.community.model;

import com.petpular.post.model.Post;
import com.petpular.user.model.User;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ContentView {
	
	private User user;
	private Post post;
	// 게시글 개수
	// 댓글 리스트
	// 좋아요 여부
	
}
