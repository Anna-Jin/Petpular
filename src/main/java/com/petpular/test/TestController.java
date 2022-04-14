package com.petpular.test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.petpular.test.bo.TestBO;
import com.petpular.test.model.Test;

@Controller
public class TestController {
	
	@Autowired
	private TestBO testBO;

	@ResponseBody
	@RequestMapping("/test")
	public String test() {
		return "hello world!";
	}
	
	@RequestMapping("/jsp_test")
	public String jspTest() {
		return "test/test";
	}
	
	@ResponseBody
	@RequestMapping("/db_test")
	public List<Test> dbTest() {
		
		return testBO.getUserList();
	}
	
	
}
