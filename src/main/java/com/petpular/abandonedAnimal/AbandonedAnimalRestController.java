package com.petpular.abandonedAnimal;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
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
	
	/**
	 * 시군구 조회
	 * @param sidoCode
	 * @return
	 */
	@GetMapping("/sigungu")
	public JSONArray sigungu(
			@RequestParam("sidoCode") String sidoCode
			) {
		
		return abandonedAnimalAPI.abandonedAniamlSigungu(sidoCode);
	}
	
	/**
	 * 찜 등록 / 삭제
	 * @param abandonedAnimal
	 * @param session
	 * @return
	 */
	@PostMapping("/abandoned/tag")
	public Map<String, Object> abandonedTag(
			@RequestBody AbandonedAnimal abandonedAnimal,
			HttpSession session) {
		
		int userId = (int)session.getAttribute("userId");
		String userLoginId = (String)session.getAttribute("userLoginId");
		
		int row = abandonedAnimalBO.abandonedTag(userId, userLoginId, abandonedAnimal);
		
		Map<String, Object> result = new HashMap<>();
		
		if (row < 1) {
			result.put("result", "error");
			result.put("errorMessage", "찜 등록에 실패했습니다. 관리자에게 문의해주세요");
			logger.error("[tag add] 찜 등록 userId:{}", userId);
		} else {
			result.put("result", "success");
			if (abandonedAnimalBO.getAbandonedTagByUserIdDesertionNo(userId, abandonedAnimal.getDesertionNo()) != null) {
				result.put("status", "찜삭제");
			} else {
				result.put("status", "찜하기");
			}
		}
		
		return result;
	}
	
	
	/**
	 * 찜 유무
	 * @param desertionNo
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping("/abandoned/exist-tag")
	public Map<String, Object> existTag(
			@RequestParam("desertionNo") String desertionNo,
			HttpSession session, Model model
			) {
		
		Map<String, Object> result = new HashMap<>();
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		if (userId != null) {
			int row = abandonedAnimalBO.existAbandonedTag(userId, desertionNo);
			if (row < 1) {
				result.put("status", "찜하기");
			} else {
				result.put("status", "찜삭제");
			}
		}
		
		return result;
	}
	
	@DeleteMapping("/abandoned/delete")
	public Map<String, Object> deleteTag(
			@RequestParam("desertionNo") String desertionNo,
			HttpSession session
			) {
		
		Map<String, Object> result = new HashMap<>();
		
		int userId = (int)session.getAttribute("userId");
		
		abandonedAnimalBO.deleteAbandonedTag(userId, desertionNo);
		
		result.put("result", "success");
		
		return result;
	}
	
}
