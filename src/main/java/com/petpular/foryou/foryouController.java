package com.petpular.foryou;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.petpular.abandonedAnimal.bo.AbandonedAnimalBO;
import com.petpular.abandonedAnimal.model.AbandonedAnimal;
import com.petpular.foryou.bo.ForyouBO;
import com.petpular.foryou.model.Foryou;

@Controller
public class ForyouController {
	
	@Autowired
	private ForyouBO foryouBO;
	
	@Autowired
	private AbandonedAnimalBO abandonedAnimalBO;

	/**
	 * for you 페이지
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/foryou")
	public String foryou(Model model, HttpSession session) {
		
		int userId = (int)session.getAttribute("userId");
		
		Foryou userInfo = foryouBO.generateForyouByUserId(userId);
		List<AbandonedAnimal> abandonedAnimalTagList = abandonedAnimalBO.getAbandonedTag(userId);
		
		model.addAttribute("abandonedAnimalTagList", abandonedAnimalTagList);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("viewPath", "/for_you/for_you");
		return "template/layout";
	}
}
