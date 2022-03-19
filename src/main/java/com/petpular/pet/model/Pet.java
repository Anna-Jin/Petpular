package com.petpular.pet.model;

import java.time.LocalDate;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Pet {
	private int id;
	private int userId;
	private String petImageUrl;
	private String name;
	private String species;
	private String breed;
	private String sex;
	private boolean neuter;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate birthday;
	private int weight;
	private String disease;
	private Date createdAt;
	private Date updatedAt;
	
}
