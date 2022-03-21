package com.petpular.pet.dao;

import java.time.LocalDate;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.petpular.pet.model.Pet;
import com.petpular.pet.model.PetMoreInfo;

@Repository
public interface PetDAO {

	Pet selectPetByPetId(int id);
	
	int insertPet(
			@Param("userId") int userId, 
			@Param("petImageUrl") String petImageUrl, 
			@Param("name") String name, 
			@Param("species") String species, 
			@Param("breed") String breed, 
			@Param("sex") String sex, 
			@Param("neuter") boolean neuter, 
			@Param("birthday") LocalDate birthday, 
			@Param("weight") int weight, 
			@Param("disease") String disease);
	
	int insertPetMoreInfoBySand(PetMoreInfo petMoreInfo);
	
	int insertPetMoreInfoByFeed(PetMoreInfo petMoreInfo);
}
