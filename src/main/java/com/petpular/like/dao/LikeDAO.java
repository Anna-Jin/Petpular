package com.petpular.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {

	
	boolean existLike(
			@Param("userId") int userId, 
			@Param("postId") int postId);
	
	int countLike(int postId);
	
	void insertLike(
			@Param("userId") int userId, 
			@Param("postId") int postId);
	
	void deleteLike(
			@Param("userId") int userId, 
			@Param("postId") int postId);
	
	void deleteLikeByPostId(int postId);
}
