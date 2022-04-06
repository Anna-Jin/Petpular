package com.petpular.abandonedAnimal;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.petpular.openAPI.AbandonedAnimalAPI;

@RestController
public class AbandonedAnimalRestController {

	@Autowired
	private AbandonedAnimalAPI abandonedAnimalAPI;
	
	@GetMapping("/sigungu")
	public JSONArray sigungu(
			@RequestParam("sidoCode") String sidoCode
			) {
		
		return abandonedAnimalAPI.abandonedAniamlSigungu(sidoCode);
	}
	
}
