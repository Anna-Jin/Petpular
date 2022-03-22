package com.petpular.pet.model;

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
	private String species;
	private String breed;
	private String sex;
	private boolean neuter;
	private LocalDate birthday;
	private int weight;
	private String disease;
	private Date createdAt;
	private Date updatedAt;
	
}
