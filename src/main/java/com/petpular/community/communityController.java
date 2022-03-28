package com.petpular.community;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.petpular.community.bo.CommunityBO;
import com.petpular.community.model.ContentView;

@Controller
public class communityController {

	@Autowired
	private CommunityBO communityBO;
	
	@RequestMapping("/community")
	public String community(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (int)session.getAttribute("userId");
		
		List<ContentView> contentList = communityBO.generateContentViewList(userId);
		
		
		model.addAttribute("contentList", contentList);
		model.addAttribute("viewPath", "community/community");
		return "template/layout";
	}
}
