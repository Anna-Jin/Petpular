package com.petpular.pet;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PetController {

	@RequestMapping("/mypet")
	public String mypet(Model model) {
		
		model.addAttribute("viewPath", "/mypet/mypet");
		
		return "template/layout";
		
	}
	
}
