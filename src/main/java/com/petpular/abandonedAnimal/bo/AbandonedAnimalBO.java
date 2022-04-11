package com.petpular.abandonedAnimal.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petpular.abandonedAnimal.dao.AbandonedAnimalDAO;
import com.petpular.abandonedAnimal.model.AbandonedAnimal;

@Service
public class AbandonedAnimalBO {
	
	@Autowired
	private AbandonedAnimalDAO abandonedAnimalDAO;

	public AbandonedAnimal getAbandonedTag(int userId, String desertionNo) {
		return abandonedAnimalDAO.selectAbandonedTag(userId, desertionNo);
	}
	
	public int abandonedTag(int userId, AbandonedAnimal abandonedAnimal) {
		AbandonedAnimal abandonedAnimalTag = getAbandonedTag(userId, abandonedAnimal.getDesertionNo());
		
		if (abandonedAnimalTag == null) {
			// 찜 목록에 추가
			int row = abandonedAnimalDAO.insertAbandonedTag(userId, abandonedAnimal);
			return row;
		} else {
			// 찜 목록에서 삭제
			int row = abandonedAnimalDAO.deleteAbandonedTag(userId, abandonedAnimal.getDesertionNo());
			return row;
		}
		
	}
}
