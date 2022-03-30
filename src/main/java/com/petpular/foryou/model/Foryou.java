package com.petpular.foryou.model;

import java.util.List;

import com.petpular.pet.model.Pet;
import com.petpular.post.model.PostView;
import com.petpular.user.model.User;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Foryou {

	private User user;
	private List<Pet> petList;
	private List<PostView> postList;
}
