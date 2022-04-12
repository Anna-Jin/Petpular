package com.petpular.community.model;

import java.util.List;

import com.petpular.comment.model.CommentView;
import com.petpular.pet.model.Pet;
import com.petpular.post.model.Post;
import com.petpular.user.model.User;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ContentView {
	
	private User user;
	private Post post;
	private int countPost;
	private List<CommentView> commentList;
	private boolean existLike;
	private List<Pet> petList;
	
}
