package com.petpular.post.model;

import java.util.Date;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class Post {
	private int id;
	private int userId;
	private String imagePath;
	private String content;
	private Date createdAt;
	private Date updatedAt;
	
}
