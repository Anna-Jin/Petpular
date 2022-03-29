package com.petpular.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petpular.like.dao.LikeDAO;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;

	public boolean existLike(int userId, int postId) {
		return likeDAO.existLike(userId, postId);
	}
	
	public void addLike(int userId, int postId) {
		likeDAO.insertLike(userId, postId);
	}
	
	public void deleteLike(int userId, int postId) {
		likeDAO.deleteLike(userId, postId);
	}
	
	public void deleteLikeByPostId(int postId) {
		likeDAO.deleteLikeByPostId(postId);
	}
}
