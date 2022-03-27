package com.petpular.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.petpular.user.bo.UserBO;
import com.petpular.user.model.User;

@Controller
public class communityController {

	@Autowired
	private UserBO userBO;
	
	@RequestMapping("/community")
	public String community(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		
		if (userId != null) {
			User user = userBO.getUserByUserId(userId);
			model.addAttribute("user", user);
		}
		
		model.addAttribute("viewPath", "community/community");
		return "template/layout";
	}
}
