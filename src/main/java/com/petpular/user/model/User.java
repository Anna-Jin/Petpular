package com.petpular.user.model;

import java.util.Date;

import lombok.Data;

@Data
public class User {
	private int id;
	private String login_id;
	private String name;
	private String email;
	private String password;
	private String profile_image_url;
	private Date created_at;
	private Date updated_at;
}


