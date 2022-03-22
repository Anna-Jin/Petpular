package com.petpular.pet;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.petpular.pet.bo.PetBO;
import com.petpular.pet.model.Feed;
import com.petpular.pet.model.Sand;

@RestController
@RequestMapping("/pet")
public class PetRestController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PetBO petBO;
	
	@PostMapping("/registration")
	public Map<String, Object> addPet(
			@RequestParam(value = "file", required = false) MultipartFile file,
			@RequestParam("name") String name,
			@RequestParam("breed") String breed,
			@RequestParam("sex") String sex,
			@RequestParam("neuter") boolean neuter,
			@RequestParam("birthday") @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate birthday,
			@RequestParam("weight") double weight,
			@RequestParam(value = "disease", required = false) String disease,
			@ModelAttribute Sand sand,
			@ModelAttribute Feed feed,
			HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		String userLoginId = (String)session.getAttribute("userLoginId");
		
		Map<String, Object> result = new HashMap<>();
		
		int row = petBO.addPet(userId, userLoginId, file, name, breed, sex, neuter, birthday, weight, disease);
		
		if (row < 1) {
			result.put("result", "error");
			result.put("errorMessage", "반려동물 등록에 실패했습니다.");
			logger.error("[add pet] 반려동물 등록 userId: {}", userId);
		}
		
		result.put("result", "success");
		
		return result;
	}

}
