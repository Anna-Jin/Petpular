package com.petpular.common;

import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.util.DefaultUriBuilderFactory;

@Component
public class WebClientUtils {

	private final static String BASE_URL = "http://apis.data.go.kr/1543061/abandonmentPublicSrvc/";
	
	public WebClient webClient() {
		
		DefaultUriBuilderFactory factory = new DefaultUriBuilderFactory(BASE_URL);
		factory.setEncodingMode(DefaultUriBuilderFactory.EncodingMode.VALUES_ONLY);
		
		WebClient webClient = WebClient.builder()
								.uriBuilderFactory(factory)
								.baseUrl(BASE_URL)
								.build();
		
		return webClient;
	}
}
