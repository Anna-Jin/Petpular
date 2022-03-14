package com.petpular.test.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petpular.test.dao.TestDAO;
import com.petpular.test.model.Test;

@Service
public class TestBO {
	
	@Autowired
	private TestDAO testDAO;
	
	public List<Test> getUserList() {
		return testDAO.selectUserList();
	}
}
