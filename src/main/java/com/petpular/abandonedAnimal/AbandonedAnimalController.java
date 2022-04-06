package com.petpular.abandonedAnimal;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.petpular.openAPI.AbandonedAnimalAPI;

@Controller
@RequestMapping("/service")
public class AbandonedAnimalController {
	
	@Autowired
	private AbandonedAnimalAPI abandonedAnimalAPI;
	
	@RequestMapping("/search-abandoned-animal")
	public String searchAbandonedAnimal(Model model) {
		
		JSONArray sido = abandonedAnimalAPI.abandonedAniamlSido();
		
		
		model.addAttribute("sido", sido);
		model.addAttribute("viewPath", "/service/search_abandoned_animal");
		return "template/layout";
	}
	
	@RequestMapping({"/abandoned-animal" , "/abandoned-animal/{sidoCode}/{sigunguCode}"})
	public String abandonedAnimal(Model model,
			@PathVariable(required = false) String sidoCode,
			@PathVariable(required = false) String sigunguCode) {
		
		JSONArray abandonedAnimal = abandonedAnimalAPI.abandonedAniaml(sidoCode, sigunguCode);
		
		model.addAttribute("abandonedAnimal", abandonedAnimal);
		model.addAttribute("viewPath", "/service/abandoned_animal");
		return "template/layout";
	}
	
}
