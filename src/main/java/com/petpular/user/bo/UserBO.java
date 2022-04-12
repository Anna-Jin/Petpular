package com.petpular.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.petpular.common.FileManagerService;
import com.petpular.user.dao.UserDAO;
import com.petpular.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private FileManagerService fileManagerService;
	
	@Autowired
	private UserDAO userDAO;
	
	// 회원가입
	public int addUser(String loginId, String name, String email, String password) {
		return userDAO.insertUser(loginId, name, email, password);
	}
	
	// 프로필 수정
	public int updateUser(int userId, String loginId, String name, String email, MultipartFile file) {
		String userProfileImageUrl = getUserByUserId(userId).getProfileImageUrl();
		
		String imagePath = null;
		// file이 null이면 수정하지 않는다.
		if (file != null) {
			imagePath = fileManagerService.savaFile(loginId, file);
			
			// 새로운 이미지 업로드가 성공하면 기존 이미지 삭제
			if( userProfileImageUrl != null && imagePath != null) {
				fileManagerService.deleteFile(userProfileImageUrl);
			}
		}
		
		return userDAO.updateUser(userId, loginId, name, email, imagePath);
	}
	
	// 아이디 중복 확인
	public boolean existLgoinId(String loginId) {
		return userDAO.existLgoinId(loginId);
	}
	
	// 이메일 중복 확인
	public boolean existEmail(String email) {
		return userDAO.existEmail(email);
	}
	
	// 로그인
	public User getUserByLoginIdAndPassword(String loginId, String Password) {
		return userDAO.selectUserByLoginIdAndPassword(loginId, Password);
	}
	
	public User getUserByUserId(int userId) {
		return userDAO.selectUserByUserId(userId);
	}
	
}
