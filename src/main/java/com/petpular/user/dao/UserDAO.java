package com.petpular.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.petpular.user.model.User;

@Repository
public interface UserDAO {
	
	// 회원가입
	int insertUser(
			@Param("loginId") String loginId, 
			@Param("name") String name, 
			@Param("email") String email, 
			@Param("password") String password);
	
	// 아이디 중복 확인
	boolean existLgoinId(String loginId);
	
	// 이메일 중복 확인
	boolean existEmail(String email);
	
	// 로그인
	User selectUserByLoginIdAndPassword(
			@Param("loginId") String loginId, 
			@Param("password") String Password);
	
}
