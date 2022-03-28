package com.petpular.post.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PostDAO {

	int insertPost(
			@Param("userId") int userId, 
			@Param("imagePath") String imagePath, 
			@Param("content") String content);
}
