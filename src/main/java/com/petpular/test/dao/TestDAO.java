package com.petpular.test.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.petpular.test.model.Test;

@Repository
public interface TestDAO {

	public List<Test> selectUserList();
}
