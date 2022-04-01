package com.petpular.user;

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
	
	/**
	 * 로그아웃
	 * @param request
	 * @return
	 */
	@RequestMapping("/user/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userId");
		session.removeAttribute("userLoginId");
		session.removeAttribute("userName");
		session.removeAttribute("petIdArr");
		session.removeAttribute("petNameArr");
		
		return "redirect:/main";
	}
	
}
