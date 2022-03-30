package com.petpular.foryou.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petpular.foryou.model.Foryou;
import com.petpular.like.bo.LikeBO;
import com.petpular.pet.bo.PetBO;
import com.petpular.pet.model.Pet;
import com.petpular.post.bo.PostBO;
import com.petpular.post.model.Post;
import com.petpular.post.model.PostView;
import com.petpular.user.bo.UserBO;
import com.petpular.user.model.User;

@Service
public class ForyouBO {
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private PetBO petBO;
	
	@Autowired
	private LikeBO likeBO;

	public Foryou generateForyouByUserId(int userId) {
		User user= userBO.getUserByUserId(userId);
		List<PostView> postViewList = new ArrayList<>();
		List<Pet> petList = petBO.getPetByUserId(userId);
		
		List<Post> postList = postBO.getPostListByUserId(userId);
		
		for (Post post : postList) {
			int countLike = likeBO.countLike(post.getId());
			
			PostView postView = PostView.builder()
										.post(post)	
										.countLike(countLike)
										.build();
			
			postViewList.add(postView);
		}
		
		Foryou foryou = Foryou.builder()
						.user(user)
						.postList(postViewList)
						.petList(petList)
						.build();
		
		return foryou;
	}
}
