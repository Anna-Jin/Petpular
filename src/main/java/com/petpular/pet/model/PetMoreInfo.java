package com.petpular.pet.model;

import java.time.LocalDate;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PetMoreInfo {

	private int id;
	private int user_id;
	private int pet_id;
	private String type;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate date;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate after_date;
	private Date created_at;
	private Date updated_at;
}
