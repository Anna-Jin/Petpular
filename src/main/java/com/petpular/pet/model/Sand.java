package com.petpular.pet.model;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Sand {
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate sand_date;
	private int sand_count;
	private int sand_volume;
}
