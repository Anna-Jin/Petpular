package com.petpular.calendar.model;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Birthday {
	private String title;
	private Rrule rrule;
	private String color;
}
