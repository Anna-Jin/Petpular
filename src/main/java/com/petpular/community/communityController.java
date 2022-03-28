package com.petpular.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class communityController {

	@RequestMapping("/community")
	public String community(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		
		if (userId != null) {
			
		}
		
		model.addAttribute("viewPath", "community/community");
		return "template/layout";
	}
}
