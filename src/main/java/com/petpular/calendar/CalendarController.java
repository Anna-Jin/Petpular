package com.petpular.calendar;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.petpular.calendar.bo.CalendarBO;

@Controller
public class CalendarController {

	@Autowired
	private CalendarBO calendarBO;
	
	@ResponseBody
	@RequestMapping("/calendar/{petId}")
	public Map<String, Object> calendar(
			@PathVariable("petId") int petId, 
			Model model, HttpSession session) {
		
		int userId = (int)session.getAttribute("userId");
		
		return calendarBO.getDate(userId, petId);
	}
}
