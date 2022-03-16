package com.petpular.main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/main")
	public String main(Model model) {
		
		model.addAttribute("viewPath", "/main/main");
		return "template/layout";
	}
}
