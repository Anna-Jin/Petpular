package com.petpular.community;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class communityController {

	@RequestMapping("/community")
	public String community(Model model) {
		
		model.addAttribute("viewPath", "community/community");
		return "template/layout";
	}
}
