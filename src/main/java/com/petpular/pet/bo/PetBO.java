package com.petpular.pet.bo;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.petpular.common.FileManagerService;
import com.petpular.pet.dao.PetDAO;
import com.petpular.pet.model.Pet;

@Service
public class PetBO {
	
	@Autowired
	private FileManagerService fileManagerService;
	
	@Autowired
	private PetDAO petDAO;
	
	public Pet getPetByPetId(int id) {
		return petDAO.selectPetByPetId(id);
	}
	
	public int addPet(int userId, String userLoginId, MultipartFile file, String name, String species, 
			String breed, String sex, boolean neuter, LocalDate birthday, int weight, String disease) {
		
		String imagePath = null;
		// file이 null이면 수정하지 않는다
		if (file != null) {
			imagePath = fileManagerService.savaFile(userLoginId, file);
		}
		
		return petDAO.insertPet(userId, imagePath, name, species, breed, sex, neuter, birthday, weight, disease);
	}
	
}
