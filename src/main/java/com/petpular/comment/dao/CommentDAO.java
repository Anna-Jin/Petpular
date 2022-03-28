package com.petpular.comment.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentDAO {

	int insertComment(
			@Param("userId") int userId, 
			@Param("comment") String comment);
}
