package com.petpular.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.petpular.like.bo.LikeBO;

@RestController
public class LikeRestController {
	
	@Autowired
	private LikeBO likeBO;

	/**
	 * 좋아요 기능
	 * @param postId
	 * @param session
	 * @return
	 */
	@RequestMapping("/like/{postId}")
	public Map<String, Object> like(
			@PathVariable("postId") int postId, 
			HttpSession session) {
		
		int userId = (int)session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		
		boolean existLike = likeBO.existLike(userId, postId);
		
		result.put("like", existLike);
		result.put("result", "success");
		
		return result;
	}

}
