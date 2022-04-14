package com.petpular;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class PetpularApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(PetpularApplication.class, args);
	}
}
