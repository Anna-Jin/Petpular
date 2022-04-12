package com.petpular.pet.model;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PetMoreInfo {

	private int id;
	private int userId;
	private int petId;
	private Type type; // sand, feed
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate date; // sand-date, feed-date
	
	private int count;
	private BigDecimal volume;
	private int kcal;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate afterDate; // sand(feed)-date와 count/volume을 이용하여 계산
	private Date createdAt;
	private Date updatedAt;
}
