package com.petpular.user.model;

import java.util.Date;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class User {
	private int id;
	private String loginId;
	private String name;
	private String email;
	private String password;
	private String profileImageUrl;
	private Date createdAt;
	private Date updatedAt;
}


