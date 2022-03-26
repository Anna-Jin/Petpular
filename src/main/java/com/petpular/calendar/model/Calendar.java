package com.petpular.calendar.model;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Calendar {

	private String title;
	private String start;
	
}
