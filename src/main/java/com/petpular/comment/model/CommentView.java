package com.petpular.comment.model;

import com.petpular.user.model.User;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CommentView {
	private Comment comment;
	private User user;
}
