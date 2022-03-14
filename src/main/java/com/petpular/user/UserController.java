package com.petpular.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

	
	@RequestMapping("/user/signup")
	public String signup() {
		return "user/sign_up";
	}
}
