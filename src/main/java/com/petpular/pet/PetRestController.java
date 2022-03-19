package com.petpular.pet;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.petpular.pet.model.Pet;
import com.petpular.pet.model.PetMoreInfo;

@RestController
@RequestMapping("/pet")
public class PetRestController {
	
	
	@PostMapping("/registration")
	public Map<String, Object> addPet(
			@ModelAttribute Pet pet,
			@ModelAttribute PetMoreInfo petMoreInfo
			) {
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		return result;
	}

}
