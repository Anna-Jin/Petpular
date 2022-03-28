package com.petpular.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.petpular.post.bo.PostBO;

@RestController
@RequestMapping("/post")
public class PostRestController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PostBO postBO;
	
	@PostMapping("/write")
	public Map<String, Object> writePost(
			@RequestParam("postFile") MultipartFile postFile,
			@RequestParam(value = "content", required = false) String content,
			HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();
		int userId = (int)session.getAttribute("userId");
		String userLoginId = (String)session.getAttribute("userLoginId");
		
		Map<String, Object> result = new HashMap<>();
		
		int row = postBO.writePost(userId, userLoginId, postFile, content);
		
		if (row < 1) {
			result.put("result", "error");
			result.put("errorMessage", "게시물 등록에 실패했습니다. 관리자에게 문의해주세요.");
			logger.error("[post write] 게시물 등록 userId:{}", userId);
		} else {
			result.put("result", "success");
		}
		
		return result;
	}
}
