package com.petpular.abandonedAnimal;

import java.util.Map;

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
		
		Map<Object, Object> sido = abandonedAnimalAPI.abandonedAniamlSido();
		
		
		model.addAttribute("sido", sido);
		model.addAttribute("viewPath", "/service/abandoned_animal");
		return "template/layout";
	}
	
}
