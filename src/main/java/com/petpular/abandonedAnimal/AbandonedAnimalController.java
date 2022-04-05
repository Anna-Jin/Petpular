package com.petpular.abandonedAnimal;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.petpular.openAPI.AbandonedAnimalAPI;

@Controller
public class AbandonedAnimalController {
	
	@Autowired
	private AbandonedAnimalAPI abandonedAnimalAPI;
	
	@RequestMapping("/service/abandoned-animal")
	public String abandonedAnimal(Model model,
			@RequestParam(value = "upr_cd", required = false) Integer upr_cd,
			@RequestParam(value = "org_cd", required = false) Integer org_cd
	
			) {
		
		Map<Object, Object> abandonedAnimal = abandonedAnimalAPI.abandonedAniaml(upr_cd, org_cd);
		
		model.addAttribute("abandonedAnimal", abandonedAnimal);
		model.addAttribute("viewPath", "/service/abandoned_animal");
		return "template/layout";
	}
}
