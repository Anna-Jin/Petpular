package com.petpular.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.petpular.common.EncryptUtils;
import com.petpular.user.bo.UserBO;
import com.petpular.user.model.User;

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
			logger.error("[user signup] 회원가입 user:{}, {}, {}", loginId, name, email);
		} else {
			result.put("result", "success");
		}
		
		
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
	
	/**
	 * 이메일 중복확인
	 * @param email
	 * @return
	 */
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
	
	/**
	 * 로그인
	 * @param loginId
	 * @param password
	 * @param request
	 * @return
	 */
	@PostMapping("/login")
	public Map<String, Object> login(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpSession session
			) {
		
		// 비밀번호 암호화
		String encryptedPassword = EncryptUtils.md5(password);
		
		// DB SELECT
		User user = userBO.getUserByLoginIdAndPassword(loginId, encryptedPassword);
		Map<String, Object> result = new HashMap<>();
		
		if (user != null) {
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userName", user.getName());
			session.setAttribute("userId", user.getId());
			
			result.put("result", "success");
		} else {
			result.put("errorMessage", "존재하지 않는 사용자입니다. 아이디와 비밀번호를 확인해주세요.");
			logger.error("[login] 유저 로그인 loginId:{}", loginId);
		}
		
		return result;
	}
	
	/**
	 * 프로필 수정
	 * @param loginId
	 * @param name
	 * @param email
	 * @param file
	 * @param request
	 * @return
	 */
	@PostMapping("/edit")
	public Map<String, Object> editUser(
			@RequestParam("loginId") String loginId,
			@RequestParam("name") String name,
			@RequestParam("email") String email,
			@RequestParam(value = "file", required = false) MultipartFile file,
			HttpSession session
			) {
		
		int userId = (int)session.getAttribute("userId");
		
		Map<String, Object> result = new HashMap<>();
		
		int row = userBO.updateUser(userId, loginId, name, email, file);
		if (row < 1) {
			result.put("result", "error");
			result.put("errorMessage", "프로필 수정에 실패했습니다. 관리자에게 문의해주세요.");
			logger.error("[edit user] 프로필 수정 userId:{}", userId);
		} else {
			result.put("result", "success");
			session.setAttribute("userName", name);
		}
		
		return result;
	}
	
	
}
