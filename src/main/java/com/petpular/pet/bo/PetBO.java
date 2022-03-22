package com.petpular.pet.bo;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.petpular.common.FileManagerService;
import com.petpular.pet.Type;
import com.petpular.pet.dao.PetDAO;
import com.petpular.pet.model.Feed;
import com.petpular.pet.model.Pet;
import com.petpular.pet.model.PetView;
import com.petpular.pet.model.Sand;

@Service
public class PetBO {
	
	@Autowired
	private FileManagerService fileManagerService;
	
	@Autowired
	private PetDAO petDAO;
	
	public List<Pet> getPetByUserId(int userId) {
		return petDAO.selectPetByUserId(userId);
	}
	
	public PetView getPetByUserIdPetId(int userId, int id) {
		Pet pet = petDAO.selectPetByUserIdPetId(userId, id);
		PetView petView = new PetView();
		petView.setPet(pet);
		
		LocalDate now = LocalDate.now();
		LocalDate birthday = pet.getBirthday();
		
		int age = now.minusYears(birthday.getYear()).getYear(); // 생일 지난 후 만 나이
		
		// 생일이 지나지 않았으면 만 나이는 -1세
		if (birthday.plusYears(age).isAfter(now)) {
			age -= 1;
		}
		
		petView.setAge(age);
		return petView;
	}
	
	public int addPet(int userId, String userLoginId, MultipartFile file, String name, 
			String breed, String sex, boolean neuter, LocalDate birthday, double weight, String disease) {
		
		String imagePath = null;
		// file이 null이면 수정하지 않는다
		if (file != null) {
			imagePath = fileManagerService.savaFile(userLoginId, file);
		}
		
		return petDAO.insertPet(userId, imagePath, name, breed, sex, neuter, birthday, weight, disease);
	}
	
	public int addPetMoreInfoBySand(Sand sand) {
		String sandType = String.valueOf(Type.Sand);
		LocalDate sandDate = sand.getSand_date();
		int sandCount = sand.getSand_count(); // 반올림
		double sandVolume = sand.getSand_volume();
		int afterDate = (int)Math.round(sandCount * sandVolume * 4);
		
		// 다음 모래 구매일 구하기
		LocalDate sandAfterDate = sandDate.plusDays(afterDate);
		
		return petDAO.insertPetMoreInfoBySand(sandType, sandDate, sandAfterDate);
	}
	
	public int addPetMoreInfoByFeed(Feed feed, int weight) {
		String feedType = String.valueOf(Type.Feed);
		LocalDate feedDate = feed.getFeed_date();
		int feedCount = feed.getFeed_count();
		double feedVolume = feed.getFeed_volume();
		
		int afterDate;
			afterDate = (int)Math.round(((feedVolume * 1000) * feedCount) / (30 + ((weight - 1) * 20)));
			LocalDate feedAfterDate = feedDate.plusDays(afterDate);
			return petDAO.insertPetMoreInfoBySand(feedType, feedDate, feedAfterDate);
		
	}
	
}
