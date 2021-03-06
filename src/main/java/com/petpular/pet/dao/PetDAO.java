package com.petpular.pet.dao;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.petpular.pet.model.Pet;
import com.petpular.pet.model.PetMoreInfo;

@Repository
public interface PetDAO {

	Pet selectPetByUserIdPetId(
			@Param("userId") int userId,
			@Param("id") int id);
	
	List<Pet> selectPetByUserId(int userId);
	
	List<PetMoreInfo> selectPetMoreIfoByUserIdPetId(
			@Param("userId") int userId, 
			@Param("petId") int petId);
	
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
			@Param("sandCount") int sandCount,
			@Param("sandVolume") BigDecimal sandVolume,
			@Param("sandAfterDate") LocalDate sandAfterDate);
	
	int insertPetMoreInfoByFeed(
			@Param("userId") int userId,
			@Param("petId") int petId,
			@Param("feedType") String feedType, 
			@Param("feedDate") LocalDate feedDate, 
			@Param("feedCount") int feedCount,
			@Param("feedVolume") BigDecimal feedVolume,
			@Param("feedKcal") int feedKcal,
			@Param("feedAfterDate") LocalDate feedAfterDate);
	
	int updatePet(
			@Param("userId") int userId,
			@Param("petId") int petId,
			@Param("petImageUrl") String petImageUrl, 
			@Param("name") String name, 
			@Param("breed") String breed, 
			@Param("sex") String sex, 
			@Param("neuter") boolean neuter, 
			@Param("birthday") LocalDate birthday, 
			@Param("weight") BigDecimal weight, 
			@Param("disease") String disease);
	
	int updatePetMoreInfoBySand(
			@Param("userId") int userId,
			@Param("petId") int petId,
			@Param("sandType") String sandType, 
			@Param("sandDate") LocalDate sandDate,
			@Param("sandCount") int sandCount,
			@Param("sandVolume") BigDecimal sandVolume,
			@Param("sandAfterDate") LocalDate sandAfterDate
			);
	
	int updatePetMoreInfoByFeed(
			@Param("userId") int userId,
			@Param("petId") int petId,
			@Param("feedType") String feedType, 
			@Param("feedDate") LocalDate feedDate, 
			@Param("feedCount") int feedCount,
			@Param("feedVolume") BigDecimal feedVolume,
			@Param("feedKcal") int feedKcal,
			@Param("feedAfterDate") LocalDate feedAfterDate);
	
	void deletePet(
			@Param("userId") int userId,
			@Param("petId") int petId);
	
	void deletePetMoreInfo(
			@Param("userId") int userId,
			@Param("petId") int petId);
}
