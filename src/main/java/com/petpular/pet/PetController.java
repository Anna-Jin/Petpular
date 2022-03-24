package com.petpular.pet;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.petpular.pet.bo.PetBO;
import com.petpular.pet.model.Pet;
import com.petpular.pet.model.PetMoreInfo;
import com.petpular.pet.model.PetView;

@Controller
@RequestMapping("/mypet")
public class PetController {
	
	@Autowired
	private PetBO petBO;
	
	public String mypet(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		
		List<Pet> petList = petBO.getPetByUserId(userId);
		
		model.addAttribute("petList", petList);
		model.addAttribute("viewPath", "/mypet/mypet");
		return "template/layout";
	}
	
	@RequestMapping("/{petId}")
	public String mypetProfile(
			@PathVariable("petId") int petId,
			Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		
		PetView pet = petBO.getPetByUserIdPetId(userId, petId);
		List<PetMoreInfo> petMoreInfoList = petBO.getPetMoreIfoByUserIdPetId(userId, petId);
		
		model.addAttribute("pet", pet);
		model.addAttribute("petMoreInfoList", petMoreInfoList);
		model.addAttribute("viewPath", "/mypet/mypet_profile");
		return "template/layout";
		
	}
	
	@RequestMapping("/add")
	public String addPet(Model model) {
		
		model.addAttribute("viewPath", "/mypet/add_pet");
		return "template/layout";
	}
	
	@RequestMapping("/add/more-info/{petId}")
	public String addPetMoreInfo(
			@PathVariable("petId") int petId,
			Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		
		PetView pet = petBO.getPetByUserIdPetId(userId, petId);
		
		model.addAttribute("pet", pet);
		
		model.addAttribute("viewPath", "/mypet/add_pet_more_info");
		return "template/layout";
	}
	
}
