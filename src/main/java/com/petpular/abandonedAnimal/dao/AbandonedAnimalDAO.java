package com.petpular.abandonedAnimal.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.petpular.abandonedAnimal.model.AbandonedAnimal;

@Repository
public interface AbandonedAnimalDAO {

	AbandonedAnimal selectAbandonedTag(
			@Param("userId") int userId, 
			@Param("desertionNo") String desertionNo);
	
	int insertAbandonedTag(
			@Param("userId") int userId,
			@Param("abandonedAnimal") AbandonedAnimal abandonedAnimal);
	
	int deleteAbandonedTag(
			@Param("userId") int userId, 
			@Param("desertionNo") String desertionNo);
}
