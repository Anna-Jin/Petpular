package com.petpular.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

	/**
	 * 회원가입 화면
	 * @return
	 */
	@RequestMapping("/user/signup")
	public String signup() {
		return "user/sign_up";
	}
	
	/**
	 * 로그인 화면
	 * @return
	 */
	@RequestMapping("/user/login")
	public String login() {
		return "user/login";
	}
	
	@RequestMapping("/user/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		session.removeAttribute("userLoginId");
		session.removeAttribute("userName");
		
		return "redirect:/user/login";
	}
	
}
