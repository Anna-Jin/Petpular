package com.petpular.foryou;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class foryouController {

	@RequestMapping("/foryou")
	public String foryou(Model model) {
		
		model.addAttribute("viewPath", "/for_you/for_you");
		return "template/layout";
	}
}
