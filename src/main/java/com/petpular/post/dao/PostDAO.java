package com.petpular.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.petpular.post.model.Post;

@Repository
public interface PostDAO {

	int insertPost(
			@Param("userId") int userId, 
			@Param("imagePath") String imagePath, 
			@Param("content") String content);
	
	List<Post> selectPostList();
	
	int countPost(int userId);
}
