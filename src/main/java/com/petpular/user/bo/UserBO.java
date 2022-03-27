package com.petpular.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petpular.user.dao.UserDAO;
import com.petpular.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	// 회원가입
	public int addUser(String loginId, String name, String email, String password) {
		return userDAO.insertUser(loginId, name, email, password);
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
	
	public User getUserByUserId(Integer userId) {
		return userDAO.selectUserByUserId(userId);
	}
}
