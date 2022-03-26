package com.petpular.calendar;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.petpular.calendar.bo.CalendarBO;
import com.petpular.calendar.model.Calendar;

@Controller
public class CalendarController {

	@Autowired
	private CalendarBO calendarBO;
	
	@ResponseBody
	@RequestMapping("/calendar/{petId}")
	public List<Calendar> calendar(
			@PathVariable("petId") int petId, 
			Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (int)session.getAttribute("userId");
		
		List<Calendar> calendar = calendarBO.getDate(userId, petId);
		
		return calendar;
	}
}
