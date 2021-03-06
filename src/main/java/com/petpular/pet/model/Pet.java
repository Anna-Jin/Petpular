package com.petpular.pet.model;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class Pet {
	private int id;
	private int userId;
	
	@JsonProperty("pet_image_url")
	private String petImageUrl;
	private String name;
	private String breed;
	private String sex;
	private boolean neuter;
	private LocalDate birthday;
	private BigDecimal weight;
	private String disease;
	@JsonProperty("created_at")
	private Date createdAt;
	@JsonProperty("updated_at")
	private Date updatedAt;
	
}
