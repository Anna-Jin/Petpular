package com.petpular.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.petpular.pet.bo.PetBO;
import com.petpular.pet.model.Pet;

@Controller
public class MainController {
	
	@Autowired
	private PetBO petBO;
	

	@RequestMapping("/main")
	public String main(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		if(userId != null) {
			List<Pet> petList = petBO.getPetByUserId(userId);
			String petNameArr = petList.get(0).getName();
			String petIdArr = Integer.toString(petList.get(0).getId());
			if (petList.size() > 0) {
				for (int i = 1; i < petList.size(); i++) {
					
					petIdArr = petIdArr + "," + petList.get(i).getId();
					petNameArr = petNameArr + "," + petList.get(i).getName();
				}
			}
			session.setAttribute("petIdArr", petIdArr);
			session.setAttribute("petNameArr", petNameArr);
		}
		
		model.addAttribute("viewPath", "/main/main");
		return "template/layout";
	}
	
}
