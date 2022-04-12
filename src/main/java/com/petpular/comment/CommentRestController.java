package com.petpular.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.petpular.comment.bo.CommentBO;

@RestController
@RequestMapping("/comment")
public class CommentRestController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CommentBO commentBO;

	/**
	 * 댓글 작성
	 * @param comment
	 * @param postId
	 * @param request
	 * @return
	 */
	@PostMapping("/write")
	public Map<String, Object> writeComment(
			@RequestParam("comment") String comment,
			@RequestParam("postId") int postId,
			HttpSession session
			) {
		
		int userId = (int)session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		
		int row = commentBO.writeComment(userId, postId, comment);
		if (row < 1) {
			result.put("result", "error");
			result.put("errorMessage", "댓글 등록에 실패했습니다. 관리자에게 문의해주세요.");
			logger.error("[write comment] 댓글 등록 userId: {}, postId: {}", userId, postId);
		}
		
		result.put("result", "success");
		
		return result;
	}
	
	/**
	 * 댓글 삭제
	 * @param postId
	 * @param commentId
	 * @param session
	 * @return
	 */
	@DeleteMapping("/delete")
	public Map<String, Object> deleteComment(
			@RequestParam("postId") int postId,
			@RequestParam("commentId") int commentId,
			HttpSession session
			) {
		int userId = (int)session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		
		int row = commentBO.deleteComment(userId, postId, commentId);
		
		if (row < 1) {
			result.put("result", "error");
			result.put("errorMessage", "댓글 삭제에 실패했습니다. 관리자에게 문의해주세요");
			logger.error("[delete comment] 댓글 삭제 userId: {}, postId: {}, commentId: {}", userId, postId, commentId);
		} else {
			result.put("result", "success");
		}
		
		return result;
	}
}
