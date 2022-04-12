package com.petpular.abandonedAnimal.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.petpular.abandonedAnimal.model.AbandonedAnimal;

@Repository
public interface AbandonedAnimalDAO {
	
	List<AbandonedAnimal> selectAbandonedTag(int userId);

	AbandonedAnimal selectAbandonedTagByUserIdDesertionNo(
			@Param("userId") int userId, 
			@Param("desertionNo") String desertionNo);
	
	int existAbandonedTag(
			@Param("userId") int userId, 
			@Param("desertionNo") String desertionNo);
	
	int insertAbandonedTag(
			@Param("userId") int userId,
			@Param("abandonedAnimal") AbandonedAnimal abandonedAnimal);
	
	int deleteAbandonedTag(
			@Param("userId") int userId, 
			@Param("desertionNo") String desertionNo);
}
