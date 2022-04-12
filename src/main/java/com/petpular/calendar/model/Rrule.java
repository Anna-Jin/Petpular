package com.petpular.calendar.model;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Rrule {
	private String freq;
	private String dtstart;
	private int interval;
}
