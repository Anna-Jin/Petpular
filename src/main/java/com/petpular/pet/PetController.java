package com.petpular.pet;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.petpular.pet.bo.PetBO;
import com.petpular.pet.model.PetMoreInfo;
import com.petpular.pet.model.PetView;

@Controller
@RequestMapping("/mypet")
public class PetController {
	
	@Autowired
	private PetBO petBO;
	
	/**
	 * 고양이 프로필 화면
	 * @param petId
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/{petId}")
	public String mypetProfile(
			@PathVariable("petId") int petId,
			Model model, HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		PetView pet = petBO.getPetByUserIdPetId(userId, petId);
		List<PetMoreInfo> petMoreInfoList = petBO.getPetMoreIfoByUserIdPetId(userId, petId);
		
		model.addAttribute("pet", pet);
		model.addAttribute("petMoreInfoList", petMoreInfoList);
		model.addAttribute("viewPath", "/mypet/mypet_profile");
		return "template/layout";
		
	}
	
	/** 
	 * 고양이 등록 화면
	 * @param model
	 * @return
	 */
	@RequestMapping("/add")
	public String addPet(Model model) {
		
		model.addAttribute("viewPath", "/mypet/add_pet");
		return "template/layout";
	}
	
	/**
	 * 고양이 추가정보 등록 화면
	 * @param petId
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/add/more-info/{petId}")
	public String addPetMoreInfo(
			@PathVariable("petId") int petId,
			Model model, HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		PetView pet = petBO.getPetByUserIdPetId(userId, petId);
		
		model.addAttribute("pet", pet);
		model.addAttribute("viewPath", "/mypet/add_pet_more_info");
		return "template/layout";
	}
	
	/**
	 * 고양이 정보 수정
	 * @param petId
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/edit/{petId}")
	public String editPet(
			@PathVariable("petId") int petId,
			Model model,
			HttpSession session
			) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		PetView pet = petBO.getPetByUserIdPetId(userId, petId);
		
		model.addAttribute("pet", pet);
		model.addAttribute("viewPath", "/mypet/edit_pet");
		
		return "template/layout";
	}
	
	/**
	 * 고양이 추가정보 수정 화면
	 * @param petId
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("edit/more-info/{petId}")
	public String editPetMoreInfo(
			@PathVariable("petId") int petId,
			Model model,
			HttpSession session
			) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		List<PetMoreInfo> petMoreInfoList = petBO.getPetMoreIfoByUserIdPetId(userId, petId);
		
		model.addAttribute("petMoreInfoList", petMoreInfoList);
		model.addAttribute("viewPath", "/mypet/edit_pet_more_info");
		
		return "template/layout";
	}
}
