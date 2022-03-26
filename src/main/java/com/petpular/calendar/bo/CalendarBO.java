package com.petpular.calendar.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petpular.calendar.model.Calendar;
import com.petpular.pet.bo.PetBO;
import com.petpular.pet.model.PetMoreInfo;

@Service
public class CalendarBO {

	@Autowired
	private PetBO petBO;
	
	public List<Calendar> getDate(int userId, int petId) {
		List<Calendar> calendars = new ArrayList<>();
		
		Calendar birthday = Calendar.builder()
		.title("생일")
		.start(petBO.getPetByUserIdPetId(userId, petId).getPet().getBirthday().toString())
		.build();
		
		calendars.add(birthday);
		
		List<PetMoreInfo> petMoreInfoList = petBO.getPetMoreIfoByUserIdPetId(userId, petId);
		
		for (PetMoreInfo petMoreInfo : petMoreInfoList) { 
			if (petMoreInfo.getType().toString() == "Sand") {
				
				Calendar sandPurchaseDate = Calendar.builder()
										.title("모래 구매일")
										.start(petMoreInfo.getDate().toString())
										.build();
				calendars.add(sandPurchaseDate);
				
				Calendar sandAfterDate = Calendar.builder()
										.title("모래 다음구매일")
										.start(petMoreInfo.getAfterDate().toString())
										.build();
				calendars.add(sandAfterDate);
			} else {
				
				Calendar sandPurchaseDate = Calendar.builder()
										.title("사료 구매일")
										.start(petMoreInfo.getDate().toString())
										.build();
				calendars.add(sandPurchaseDate);
				
				Calendar sandAfterDate = Calendar.builder()
										.title("사료 다음구매일")
										.start(petMoreInfo.getAfterDate().toString())
										.build();
				calendars.add(sandAfterDate);
			}
			
		}
		return calendars;
	}
}
