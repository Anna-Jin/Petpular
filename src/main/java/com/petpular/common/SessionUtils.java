package com.petpular.common;

import java.util.ArrayList;
import java.util.List;

import com.petpular.pet.model.Pet;

public class SessionUtils {
	public static List<String> petArr(Integer userId, List<Pet> petList) {
		List<String> arr = new ArrayList<>();
		
		String petNameArr = petList.get(0).getName();
		String petIdArr = Integer.toString(petList.get(0).getId());
	 
		if (petList.size() > 1) {
			for (int i = 1; i <= petList.size(); i++) {
				
				petIdArr = petIdArr + "," + petList.get(i).getId();
				arr.add(petIdArr);
				petNameArr = petNameArr + "," + petList.get(i).getName();
				arr.add(petNameArr);
			}
		}
		return arr;
	}
}
