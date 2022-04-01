package com.petpular.foryou;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.petpular.foryou.bo.ForyouBO;
import com.petpular.foryou.model.Foryou;

@Controller
public class ForyouController {
	
	@Autowired
	private ForyouBO foryouBO;

	@RequestMapping("/foryou")
	public String foryou(Model model, HttpSession session) {
		
		int userId = (int)session.getAttribute("userId");
		
		Foryou userInfo = foryouBO.generateForyouByUserId(userId);
		
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("viewPath", "/for_you/for_you");
		return "template/layout";
	}
}
