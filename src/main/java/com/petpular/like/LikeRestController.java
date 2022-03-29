package com.petpular.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

	@RequestMapping("/like/{postId}")
	public Map<String, Object> like(
			@PathVariable("postId") int postId, 
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (int)session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		
		boolean existLike = likeBO.existLike(userId, postId);
		
		if(existLike) {
			// 좋아요가 활성화 되어있을 때 -> 좋아요 삭제
			likeBO.deleteLike(userId, postId);
		} else {
			// 좋아요가 활성화 되어있지 않을 때 -> 좋아요 추가
			likeBO.addLike(userId, postId);
		}
		
		result.put("result", "success");
		
		return result;
	}

}
