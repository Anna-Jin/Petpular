package com.petpular.pet.model;

import java.time.LocalDate;
import java.util.Date;

import lombok.Data;

@Data
public class PetMoreInfo {

	private int id;
	private int user_id;
	private int pet_id;
	private String type;
	private LocalDate date;
	private LocalDate after_date;
	private Date created_at;
	private Date updated_at;
}
