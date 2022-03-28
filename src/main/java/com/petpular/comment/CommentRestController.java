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

import com.petpular.comment.bo.CommentBO;

@RestController
@RequestMapping("/comment")
public class CommentRestController {
	
	@Autowired
	private CommentBO commentBO;

	@PostMapping("/write")
	public Map<String, Object> writeComment(
			@RequestParam("comment") String comment,
			@RequestParam("postId") int postId,
			HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();
		int userId = (int)session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		
		int row = commentBO.writeComment(userId, postId, comment);
		if (row < 1) {
			result.put("result", "error");
			result.put("errorMessage", "댓글 등록에 실패했습니다. 관리자에게 문의해주세요.");
			
		}
		
		result.put("result", "success");
		
		return result;
	}
}
