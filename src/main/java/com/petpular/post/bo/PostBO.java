package com.petpular.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.petpular.common.FileManagerService;
import com.petpular.post.dao.PostDAO;
import com.petpular.post.model.Post;

@Service
public class PostBO {
	
	@Autowired
	private FileManagerService fileManagerService;
	
	@Autowired
	private PostDAO postDAO;

	public int writePost(int userId, String userLoginId, MultipartFile postFile, String content) {
		
		// 이미지 등록 - 필수값
		String imagePath = fileManagerService.savaFile(userLoginId, postFile);
		
		return postDAO.insertPost(userId, imagePath, content);
	}
	
	public List<Post> getPostList(int userId) {
		return postDAO.selectPostList(userId);
	}
	
}
