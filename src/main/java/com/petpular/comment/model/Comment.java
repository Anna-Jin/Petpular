package com.petpular.comment.model;

import java.sql.Date;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class Comment {

	private int id;
	private int userId;
	private int postId;
	private String content;
	private Date createdAt;
	private Date updatedAt;
}
