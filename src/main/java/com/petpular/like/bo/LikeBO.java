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
	
	public int countLike(int postId) {
		return likeDAO.countLike(postId);
	}
	
	public boolean changeLike (int userId, int postId) {
		boolean existList = likeDAO.existLike(userId, postId);
		
		if (existList) {
			// 좋아요 되어있을 때 - 좋아요 삭제
			deleteLike(userId, postId);
			return false;
		} else {
			addLike(userId, postId);
			return true;
		}
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
