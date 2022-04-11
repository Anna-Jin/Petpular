package com.petpular.abandonedAnimal;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.petpular.abandonedAnimal.bo.AbandonedAnimalBO;
import com.petpular.abandonedAnimal.model.AbandonedAnimal;
import com.petpular.openAPI.AbandonedAnimalAPI;

@RestController
public class AbandonedAnimalRestController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private AbandonedAnimalAPI abandonedAnimalAPI;
	
	@Autowired
	private AbandonedAnimalBO abandonedAnimalBO;
	
	@GetMapping("/sigungu")
	public JSONArray sigungu(
			@RequestParam("sidoCode") String sidoCode
			) {
		
		return abandonedAnimalAPI.abandonedAniamlSigungu(sidoCode);
	}
	
	@PostMapping("/abandoned/tag")
	public Map<String, Object> abandonedTag(
			@RequestBody AbandonedAnimal abandonedAnimal,
			HttpSession session) {
		
		int userId = (int)session.getAttribute("userId");
		
		int row = abandonedAnimalBO.abandonedTag(userId, abandonedAnimal);
		
		Map<String, Object> result = new HashMap<>();
		
		if (row < 1) {
			result.put("result", "error");
			result.put("errorMessage", "찜 등록에 실패했습니다. 관리자에게 문의해주세요");
			logger.error("[tag add] 찜 등록 userId:{}", userId);
		} else {
			result.put("result", "success");
		}
		
		return result;
	}
	
}
