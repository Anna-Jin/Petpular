package com.petpular.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.petpular.community.bo.CommunityBO;

@RestController
@RequestMapping("/comment")
public class CommentRestController {
	
	@Autowired
	private CommunityBO communityBO;

	@PostMapping("/write")
	public Map<String, Object> writeComment(
			@RequestParam("comment") String comment,
			@RequestParam("postId") int postId,
			HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();
		int userId = (int)session.getAttribute("userId");
		
		
		Map<String, Object> result = new HashMap<>();
		
		result.put("result", "success");
		
		return result;
	}
}
