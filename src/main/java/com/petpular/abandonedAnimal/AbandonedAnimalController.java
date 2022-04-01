package com.petpular.abandonedAnimal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/service")
public class AbandonedAnimalController {

	@RequestMapping("/abandoned-animal")
	public String abandonedAniaml(Model model) {
		
		model.addAttribute("viewPath", "/service/abandoned_animal");
		return "template/layout";
	}
}
