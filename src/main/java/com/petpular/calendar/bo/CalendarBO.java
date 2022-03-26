package com.petpular.calendar.bo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petpular.calendar.model.Birthday;
import com.petpular.calendar.model.Calendar;
import com.petpular.calendar.model.Rrule;
import com.petpular.pet.bo.PetBO;
import com.petpular.pet.model.PetMoreInfo;

@Service
public class CalendarBO {

	@Autowired
	private PetBO petBO;
	
	public Map<String, Object> getDate(int userId, int petId) {
		Map<String, Object> calendars = new HashMap<>();
		Birthday birthday = Birthday.builder()
							.title("생일")
							.rrule(Rrule.builder()
									.freq("yearly")
									.dtstart(petBO.getPetByUserIdPetId(userId, petId).getPet().getBirthday().toString())
									.interval(1)
									.build())
							.color("#009854")
							.build();
		calendars.put("birthday", birthday);
		
		List<PetMoreInfo> petMoreInfoList = petBO.getPetMoreIfoByUserIdPetId(userId, petId);
		for (PetMoreInfo petMoreInfo : petMoreInfoList) { 
			if (petMoreInfo.getType().toString() == "Sand") {
				
				Calendar sandPurchaseDate = Calendar.builder()
										.title("모래 구매일")
										.start(petMoreInfo.getDate().toString())
										.color("#ffa44f")
										.build();
				calendars.put("sandPurchaseDate", sandPurchaseDate);
				
				Calendar sandAfterDate = Calendar.builder()
										.title("모래 다음구매일")
										.start(petMoreInfo.getAfterDate().toString())
										.color("#ffa44f")
										.build();
				calendars.put("sandAfterDate", sandAfterDate);
			} else {
				
				Calendar sandPurchaseDate = Calendar.builder()
										.title("사료 구매일")
										.start(petMoreInfo.getDate().toString())
										.color("#ffa44f")
										.build();
				calendars.put("sandPurchaseDate", sandPurchaseDate);
				
				Calendar sandAfterDate = Calendar.builder()
										.title("사료 다음구매일")
										.start(petMoreInfo.getAfterDate().toString())
										.color("#ffa44f")
										.build();
				calendars.put("sandPurchaseDate", sandAfterDate);
			}
			
		}
		return calendars;
	}
}
