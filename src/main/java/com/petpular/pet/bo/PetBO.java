package com.petpular.pet.bo;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.petpular.common.FileManagerService;
import com.petpular.pet.dao.PetDAO;
import com.petpular.pet.model.Feed;
import com.petpular.pet.model.Pet;
import com.petpular.pet.model.PetMoreInfo;
import com.petpular.pet.model.PetView;
import com.petpular.pet.model.Sand;
import com.petpular.pet.model.Type;

@Service
public class PetBO {
	
	@Autowired
	private FileManagerService fileManagerService;
	
	@Autowired
	private PetDAO petDAO;
	
	// 다음 사료 구매일 계산 함수
	private LocalDate calFeedAfterDate(int userId, int petId, LocalDate feedDate, int feedCount, BigDecimal feedVolume, int feedKcal) {
		PetView pet = getPetByUserIdPetId(userId, petId);
		double weight = pet.getPet().getWeight().doubleValue();
		
		// 휴식기 에너지 요구량
		// 2kg 미만 냥이 = 70 ×체중(kg)^0.75
		// 2kg 이상 냥이 = 30 × 체중(kg) + 70
		double rer;
		
		if (weight >= 2.0) {
			rer = (30 * weight) + 70;
		} else {
			rer = Math.pow((70 * weight), 0.75);
		}
		
		// 하루 필요 칼로리
		// 중성화 함 = 1.2 × RER
		// 중성화 안 함 = 1.4 × RER
		double needKcal;
		boolean neuter = pet.getPet().isNeuter();
		if (neuter) {
			needKcal = 1.2 * rer;
		} else {
			needKcal = 1.4 * rer;
		}
		
		// 하루 사료 급여량
		double feedPerDay = (needKcal / feedKcal) * 1000; 
		int consumDate = (int)Math.round((feedCount * feedVolume.doubleValue() * 1000) / feedPerDay);
		
		LocalDate feedAfterDate = feedDate.plusDays(consumDate);
		
		return feedAfterDate;
	}
	
	// 반려동물 프로필 리스트 가져오기
	public List<Pet> getPetByUserId(int userId) {
		return petDAO.selectPetByUserId(userId);
	}
	
	// 반려동물 프로필 하나 가져오기
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
	
	// 반려동물 추가정보 가져오기
	public List<PetMoreInfo> getPetMoreIfoByUserIdPetId(int userId, int petId) {
		return petDAO.selectPetMoreIfoByUserIdPetId(userId, petId);
		
	}
	
	// 반려동물 등록
	public int addPet(int userId, String userLoginId, MultipartFile file, String name, 
			String breed, String sex, boolean neuter, LocalDate birthday, BigDecimal weight, String disease) {
		
		String imagePath = null;
		// file이 null이면 수정하지 않는다
		if (file != null) {
			imagePath = fileManagerService.savaFile(userLoginId, file);
		}
		
		return petDAO.insertPet(userId, imagePath, name, breed, sex, neuter, birthday, weight, disease);
	}
	
	// 반려동물 추가정보 등록 - 모래
	public int addPetMoreInfoBySand(Sand sand, int userId, int petId) {
		String sandType = String.valueOf(Type.Sand);
		LocalDate sandDate = sand.getSandDate();
		int sandCount = sand.getSandCount(); // 반올림
		BigDecimal sandVolume = sand.getSandVolume();
		int afterDate = (int)Math.round(sandCount * sandVolume.doubleValue() * 4);
		
		// 다음 모래 구매일 구하기
		LocalDate sandAfterDate = sandDate.plusDays(afterDate);
		
		return petDAO.insertPetMoreInfoBySand(userId, petId, sandType, sandDate, sandCount, sandVolume, sandAfterDate);
	}
	
	// 반려동물 추가정보 등록 - 사료
	public int addPetMoreInfoByFeed(Feed feed, int userId, int petId) {
		String feedType = String.valueOf(Type.Feed);
		LocalDate feedDate = feed.getFeedDate();
		int feedCount = feed.getFeedCount();
		BigDecimal feedVolume = feed.getFeedVolume();
		int feedKcal = feed.getFeedKcal();
		
		LocalDate feedAfterDate = calFeedAfterDate(userId, petId, feedDate, feedCount, feedVolume, feedKcal);
		
		return petDAO.insertPetMoreInfoByFeed(userId, petId, feedType, feedDate, feedCount, feedVolume, feedKcal, feedAfterDate);
	}
	
	// 반려동물 프로필 업데이트
	public int updatePet(int userId, String userLoginId, int petId, MultipartFile file, String name, 
			String breed, String sex, boolean neuter, LocalDate birthday, BigDecimal weight, String disease) {
		String petProfileImageUrl = getPetByUserIdPetId(userId, petId).getPet().getPetImageUrl();
		
		String imagePath = null;
		if (file != null) {
			imagePath = fileManagerService.savaFile(userLoginId, file);
			
			// 새로운 이미지 업로드에 성공하면 기존 이미지 삭제
			if (petProfileImageUrl != null && imagePath != null) {
				fileManagerService.deleteFile(petProfileImageUrl);
			}
		}
		
		return petDAO.updatePet(userId, petId, imagePath, name, breed, sex, neuter, birthday, weight, disease);
	}
	
	// 반려동물 추가정보 업데이트 - 모래
	public int updatePetMoreInfoBySand(Sand sand, int userId, int petId) {
		String sandType = String.valueOf(Type.Sand);
		LocalDate sandDate = sand.getSandDate();
		int sandCount = sand.getSandCount(); // 반올림
		BigDecimal sandVolume = sand.getSandVolume();
		int afterDate = (int)Math.round(sandCount * sandVolume.doubleValue() * 4);
		
		// 다음 모래 구매일 구하기
		LocalDate sandAfterDate = sandDate.plusDays(afterDate);
		
		return petDAO.updatePetMoreInfoBySand(userId, petId, sandType, sandDate, sandCount, sandVolume, sandAfterDate);
	}
	
	// 반려동물 추가정보 업데이트 - 사료
	public int updatePetMoreInfoByFeed(Feed feed, int userId, int petId) {
		String feedType = String.valueOf(Type.Feed);
		LocalDate feedDate = feed.getFeedDate();
		int feedCount = feed.getFeedCount();
		BigDecimal feedVolume = feed.getFeedVolume();
		int feedKcal = feed.getFeedKcal();
		
		LocalDate feedAfterDate = calFeedAfterDate(userId, petId, feedDate, feedCount, feedVolume, feedKcal);
		
		return petDAO.updatePetMoreInfoByFeed(userId, petId, feedType, feedDate, feedCount, feedVolume, feedKcal, feedAfterDate);
	}
	
	// 반려동물 삭제
	public void deletePet(int userId, int petId) {
		// 이미지 파일 삭제
		String petProfileImageUrl = getPetByUserIdPetId(userId, petId).getPet().getPetImageUrl();
		if (petProfileImageUrl != null) {
			fileManagerService.deleteFile(petProfileImageUrl);
		}
		
		petDAO.deletePet(userId, petId);
	}
	
	public void deletePetMoreInfo(int userId, int petId) {
		petDAO.deletePetMoreInfo(userId, petId);
	}
}
