package com.petpular.pet.model;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class Feed {
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonProperty("feed_date")
	private LocalDate feedDate;
	
	@JsonProperty("feed_count")
	private int feedCount;
	
	@JsonProperty("feed_volume")
	private int feedVolume;
	
	@JsonProperty("feed_kcal")
	private int feedKcal;
}
