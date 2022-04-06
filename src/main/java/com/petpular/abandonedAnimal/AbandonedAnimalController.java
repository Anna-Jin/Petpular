package com.petpular.abandonedAnimal;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.petpular.openAPI.AbandonedAnimalAPI;

@Controller
public class AbandonedAnimalController {
	
	@Autowired
	private AbandonedAnimalAPI abandonedAnimalAPI;
	
	@RequestMapping("/service/abandoned-animal")
	public String abandonedAnimal(Model model) {
		
		JSONArray sido = abandonedAnimalAPI.abandonedAniamlSido();
		
		
		model.addAttribute("sido", sido);
		model.addAttribute("viewPath", "/service/abandoned_animal");
		return "template/layout";
	}
	
}
