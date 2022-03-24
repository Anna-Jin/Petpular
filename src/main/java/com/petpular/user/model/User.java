package com.petpular.user.model;

import java.util.Date;

import lombok.Data;

@Data
public class User {
	private int id;
	private String loginId;
	private String name;
	private String email;
	private String password;
	private String profileImageUrl;
	private Date created_at;
	private Date updated_at;
}


