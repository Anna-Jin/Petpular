package com.petpular.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/post")
public class PostRestController {
	
	@PostMapping("/write")
	public Map<String, Object> writePost(
			@RequestParam("postFile") MultipartFile postFile,
			@RequestParam(value = "content", required = false) String content,
			HttpServletRequest request
			) {
		Map<String, Object> result = new HashMap<>();
		
		result.put("result", "success");
		
		return result;
	}
}
