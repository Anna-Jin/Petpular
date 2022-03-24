package com.petpular.main;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	

	@RequestMapping("/main")
	public String main(Model model, HttpServletRequest request) {
		
		
		model.addAttribute("viewPath", "/main/main");
		return "template/layout";
	}
	
}
