package com.petpular.pet.model;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Feed {
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate feed_date;
	private int feed_count;
	private int feed_volume;
}
