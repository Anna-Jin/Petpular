package com.petpular.test.model;

import java.time.LocalDate;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Test {
	
	private int id;
	private String name;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate birth_day;
	private Date created_at;
	private Date updated_at;
}
