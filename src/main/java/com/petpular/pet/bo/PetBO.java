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
	
	public int addPetMoreInfoBySand(Sand sand, int userId, int petId) {
		String sandType = String.valueOf(Type.Sand);
		LocalDate sandDate = sand.getSandDate();
		int sandCount = sand.getSandCount(); // 반올림
		double sandVolume = sand.getSandVolume();
		int afterDate = (int)Math.round(sandCount * sandVolume * 4);
		
		// 다음 모래 구매일 구하기
		LocalDate sandAfterDate = sandDate.plusDays(afterDate);
		
		return petDAO.insertPetMoreInfoBySand(userId, petId, sandType, sandDate, sandAfterDate);
	}
	
	public int addPetMoreInfoByFeed(Feed feed, int userId, int petId) {
		String feedType = String.valueOf(Type.Feed);
		LocalDate feedDate = feed.getFeedDate();
		int feedCount = feed.getFeedCount();
		double feedVolume = feed.getFeedVolume();
		int feedKcal = feed.getFeedKcal();
		
		PetView pet = getPetByUserIdPetId(userId, petId);
		

		
		double weight = pet.getPet().getWeight();
		
		// 휴식기 에너지 요구량
//		2kg 미만 냥이 = 70 ×체중(kg)^0.75
//		2kg 이상 냥이 = 30 × 체중(kg) + 70
		double rer;
		
		if (weight >= 2.0) {
			rer = (30 * weight) + 70;
		} else {
			rer = Math.pow((70 * weight), 0.75);
		}
		
		// 하루 필요 칼로리
//		중성화 함 = 1.2 × RER
//		중성화 안 함 = 1.4 × RER
		double needKcal;
		boolean neuter = pet.getPet().isNeuter();
		if (neuter) {
			needKcal = 1.2 * rer;
		} else {
			needKcal = 1.4 * rer;
		}
		
		// 하루 사료 급여량
		double feedPerDay = (needKcal / feedKcal) * 1000; 
		
		int consumDate = (int)Math.round((feedCount * feedVolume * 1000) / feedPerDay);
		
		LocalDate feedAfterDate = feedDate.plusDays(consumDate);
		return petDAO.insertPetMoreInfoBySand(userId, petId, feedType, feedDate, feedAfterDate);
		
	}
	
}
