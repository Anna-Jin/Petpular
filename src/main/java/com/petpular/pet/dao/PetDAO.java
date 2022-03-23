package com.petpular.pet.dao;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.petpular.pet.model.Pet;

@Repository
public interface PetDAO {

	Pet selectPetByUserIdPetId(
			@Param("userId") int userId,
			@Param("id") int id);
	
	List<Pet> selectPetByUserId(int userId);
	
	int insertPet(
			@Param("userId") int userId, 
			@Param("petImageUrl") String petImageUrl, 
			@Param("name") String name, 
			@Param("breed") String breed, 
			@Param("sex") String sex, 
			@Param("neuter") boolean neuter, 
			@Param("birthday") LocalDate birthday, 
			@Param("weight") BigDecimal weight, 
			@Param("disease") String disease);
	
	int insertPetMoreInfoBySand(
			@Param("userId") int userId,
			@Param("petId") int petId,
			@Param("sandType") String sandType, 
			@Param("sandDate") LocalDate sandDate, 
			@Param("sandAfterDate") LocalDate sandAfterDate);
	
	int insertPetMoreInfoByFeed(
			@Param("userId") int userId,
			@Param("petId") int petId,
			@Param("feedType") String feedType, 
			@Param("feedDate") LocalDate feedDate, 
			@Param("feedAfterDate") LocalDate feedAfterDate);
}
