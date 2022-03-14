package com.petpular.user;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.petpular.common.EncryptUtils;
import com.petpular.user.bo.UserBO;

@RestController
@RequestMapping("/user")
public class UserRestController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private UserBO userBO;
	
	/**
	 * 회원가입
	 * @param loginId
	 * @param name
	 * @param email
	 * @param password
	 * @return
	 */
	@PostMapping("/signup")
	public Map<String, Object> signup(
			@RequestParam("loginId") String loginId,
			@RequestParam("name") String name,
			@RequestParam("email") String email,
			@RequestParam("password") String password
			) {
		
		Map<String, Object> result = new HashMap<>();
		
		// 비밀번호 암호화
		String encryptedPassword = EncryptUtils.md5(password);
		
		// DB INSERT
		int row = userBO.addUser(loginId, name, email, encryptedPassword);
		if (row < 1) {
			result.put("result", "error");
			result.put("errorMessage", "회원가입에 실패했습니다. 관리자에게 문의해주세요.");
		} else {
			result.put("result", "success");
		}
		
		logger.error("[user signup] 회원가입 user:{}, {}, {}", loginId, name, email);
		
		return result;
	}
	
	/**
	 * 아이디 중복확인
	 * @param loginId
	 * @return
	 */
	@RequestMapping("/duplicate_loginId")
	public Map<String, Object> isDuplicatedLoginId(
			@RequestParam("loginId") String loginId
			) {
		Map<String, Object> result = new HashMap<>();
		
		// DB SELECT
		boolean existLoginId = userBO.existLgoinId(loginId);
		result.put("result", existLoginId);
		
		return result;
	}
	
	@RequestMapping("/duplicate_email")
	public Map<String, Object> isDuplicatedemail(
			@RequestParam("email") String email
			) {
		Map<String, Object> result = new HashMap<>();
		
		// DB SELECT
		boolean existEmail = userBO.existEmail(email);
		
		result.put("result", existEmail);
		
		return result;
	}
}
