package com.petpular.pet;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypet")
public class PetController {

	@RequestMapping("/{petId}")
	public String mypet(
			@PathVariable("petId") int petId,
			Model model) {
		
		model.addAttribute("viewPath", "/mypet/mypet");
		
		return "template/layout";
		
	}
	
	@RequestMapping("/add")
	public String addPet(Model model) {
		
		model.addAttribute("viewPath", "/mypet/add_pet");
		return "template/layout";
	}
	
}
