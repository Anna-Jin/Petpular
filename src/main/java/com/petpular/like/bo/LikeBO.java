package com.petpular.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petpular.like.dao.LikeDAO;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;

	public boolean existLike(int userId, int postId) {
		boolean existLike = likeDAO.existLike(userId, postId);
		
		if(existLike) {
			// 좋아요가 활성화 되어있을 때 -> 좋아요 삭제
			deleteLike(userId, postId);
		} else {
			// 좋아요가 활성화 되어있지 않을 때 -> 좋아요 추가
			addLike(userId, postId);
		}
		return existLike;
	}
	
	public int countLike(int postId) {
		return likeDAO.countLike(postId);
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
