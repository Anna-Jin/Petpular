package com.petpular.post.bo;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.petpular.comment.bo.CommentBO;
import com.petpular.common.FileManagerService;
import com.petpular.like.bo.LikeBO;
import com.petpular.post.dao.PostDAO;
import com.petpular.post.model.Post;

@Service
public class PostBO {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private FileManagerService fileManagerService;
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private LikeBO likeBO;

	public int writePost(int userId, String userLoginId, MultipartFile postFile, String content) {
		
		// 이미지 등록 - 필수값
		String imagePath = fileManagerService.savaFile(userLoginId, postFile);
		
		return postDAO.insertPost(userId, imagePath, content);
	}
	
	public int deletePost(int userId, int postId) {
		// 포스트가 존재하는 지 확인
		Post post = getPostByUserIdPostId(userId, postId);
		
		if (post == null) {
			logger.warn("[delete post] 해당 포스트가 없습니다. userId:{}, postId:{}", userId, postId);
			return 0;
		}
		
		// 이미지가 존재하면 삭제
		String imagePath = post.getImagePath();
		if (imagePath != null ) {
			fileManagerService.deleteFile(imagePath);
		}
		
		// 댓글 삭제
		commentBO.deleteCommentByPostId(postId);
		
		// 좋아요 삭제
		likeBO.deleteLikeByPostId(postId);
		
		// 글 삭제
		return postDAO.deletePost(userId, postId);
	}
	
	public Post getPostByUserIdPostId(int userId, int postId) {
		return postDAO.selectPostByUserIdPostId(userId, postId);
	}
	
	public List<Post> getPostList() {
		return postDAO.selectPostList();
	}
	
	public int countPost(int userId) {
		return postDAO.countPost(userId);
	}
	
}
