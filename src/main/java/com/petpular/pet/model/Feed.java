package com.petpular.pet.model;

import java.math.BigDecimal;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Feed {
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate feedDate;
	
	private int feedCount;
	
	private BigDecimal feedVolume;
	
	private int feedKcal;
}
