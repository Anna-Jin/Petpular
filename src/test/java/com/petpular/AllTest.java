package com.petpular;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.petpular.common.EncryptUtils;
import com.petpular.user.bo.UserBO;
import com.petpular.user.model.User;

@SpringBootTest
public class AllTest {
	
	@Autowired
	private UserBO userBO;
	
	// @Test
	void test1() {
		assertEquals(3 * 5, 15);
		
		int a = 10;
		assertTrue(a < 100);
	}
	
	// @Test
	void test2() {
		String password = "1234";
		String encryptedPassword = EncryptUtils.md5(password);
		User user = userBO.getUserByLoginIdAndPassword("test", encryptedPassword);
		assertNotNull(user);
	}
	
	@Transactional // 테스트를 하고 해당 정보를 저장하고 싶지 않을 때
	@Test
	void test3() {
		String password = "1234";
		String encryptedPassword = EncryptUtils.md5(password);
		int rowCount = userBO.addUser("test", "테스트", "test@test.com", encryptedPassword);
		assertEquals(1, rowCount);
	}
	
}
