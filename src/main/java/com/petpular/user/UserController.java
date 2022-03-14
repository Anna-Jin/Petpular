package com.petpular.user;

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
	
	@RequestMapping("/user/login")
	public String login() {
		return "user/login";
	}
	
}
