package com.petpular.abandonedAnimal.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petpular.abandonedAnimal.dao.AbandonedAnimalDAO;
import com.petpular.abandonedAnimal.model.AbandonedAnimal;
import com.petpular.common.FileManagerService;

@Service
public class AbandonedAnimalBO {
	
	@Autowired
	private AbandonedAnimalDAO abandonedAnimalDAO;
	
	@Autowired
	private FileManagerService fileManagerService;
	
	public List<AbandonedAnimal> getAbandonedTag(int userId) {
		return abandonedAnimalDAO.selectAbandonedTag(userId);
	}
	
	public AbandonedAnimal getAbandonedTagByUserIdDesertionNo(int userId, String desertionNo) {
		return abandonedAnimalDAO.selectAbandonedTagByUserIdDesertionNo(userId, desertionNo);
	}
	
	public int abandonedTag(int userId, String userLoginId, AbandonedAnimal abandonedAnimal) {
		AbandonedAnimal abandonedAnimalTag = getAbandonedTagByUserIdDesertionNo(userId, abandonedAnimal.getDesertionNo());
		
		if (abandonedAnimalTag == null) {
			// 찜 목록에 추가
			int row = insertAbandonedTag(userId, userLoginId, abandonedAnimal);
			return row;
		} else {
			// 찜 목록에서 삭제
			int row = deleteAbandonedTag(userId, abandonedAnimal.getDesertionNo());
			return row;
		}
	}
	
	public int insertAbandonedTag(int userId, String userLoginId, AbandonedAnimal abandonedAnimal) {
		String imagePath = fileManagerService.saveApiFile(userLoginId, abandonedAnimal.getPopfile());
				
		abandonedAnimal.setPopfile(imagePath);
		
		return abandonedAnimalDAO.insertAbandonedTag(userId, abandonedAnimal);
	}
	
	public int deleteAbandonedTag(int userId, String desertionNo) {
		String abandonedTagImage = getAbandonedTagByUserIdDesertionNo(userId, desertionNo).getPopfile();
		
		fileManagerService.deleteFile(abandonedTagImage);
		
		return abandonedAnimalDAO.deleteAbandonedTag(userId, desertionNo);
	}
	
	public int existAbandonedTag(int userId, String desertionNo) {
		return abandonedAnimalDAO.existAbandonedTag(userId, desertionNo);
	}
}
