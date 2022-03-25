package com.petpular.pet.model;

import java.math.BigDecimal;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class Sand {
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonProperty("sand_date")
	private LocalDate sandDate;
	
	@JsonProperty("sand_count")
	private int sandCount;
	
	@JsonProperty("sand_volume")
	private BigDecimal sandVolume;
}
