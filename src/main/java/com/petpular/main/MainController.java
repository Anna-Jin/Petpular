package com.petpular.main;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.petpular.common.SessionUtils;
import com.petpular.pet.bo.PetBO;
import com.petpular.pet.model.Pet;

@Controller
public class MainController {
	
	@Autowired
	private PetBO petBO;
	

	@RequestMapping("/main")
	public String main(Model model, HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		if(userId != null) {
			List<Pet> petList = petBO.getPetByUserId(userId);
			
			if (petList.size() != 0) {
			
				List<String> arr = SessionUtils.petArr(userId, petList);
				
				session.setAttribute("petIdArr", arr.get(0));
				session.setAttribute("petNameArr", arr.get(1));
				
				model.addAttribute("petList", petList);
			}
		} 
		
		model.addAttribute("viewPath", "/main/main");
		return "template/layout";
	}
	
}
