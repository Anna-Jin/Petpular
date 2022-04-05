package com.petpular.openAPI;

import java.util.Map;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.util.DefaultUriBuilderFactory;

import reactor.core.publisher.Mono;

@Service
public class AbandonedAnimalAPI {

	private final static String BASE_URL = "http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic";
	
	public Map<Object, Object> abandonedAniaml(Integer upr_cd, Integer org_cd) {
		
		// 필수 값들
		String serviceKey = "Y8ysgjcfITdLKYzk9pQp6pzphI2yY95czKzFUggqOQCdYuYLm9oAOBh%2Fhn1meZKp1UPtONWLAAIbu7McjP9R9Q%3D%3D"; // 서비스키
		String upkind = "422400"; // 축종 코드 (고양이)
		String state = "notice"; // 공고 상태 (보호중)
		String pageNo = "1"; // 페이지 번호 (기본값 : 1)
		String NumOfRows = "100"; // 페이지당 보여줄 개수 (1,000 이하), 기본값 : 10
		String _type = "json"; // json 형태로 반환
		
		DefaultUriBuilderFactory factory = new DefaultUriBuilderFactory(BASE_URL);
		factory.setEncodingMode(DefaultUriBuilderFactory.EncodingMode.VALUES_ONLY);
		
		WebClient webClient = WebClient.builder()
								.uriBuilderFactory(factory)
								.baseUrl(BASE_URL)
								.build();
		
		Mono<Map<Object, Object>> response = webClient.get()
						.uri(uriBuilder -> uriBuilder
											.queryParam("serviceKey", serviceKey)
											.queryParam("upkind", upkind)
											.queryParam("upr_cd", upr_cd)
											.queryParam("org_cd", org_cd)
											.queryParam("state", state)
											.queryParam("pageNo", pageNo)
											.queryParam("NumOfRows", NumOfRows)
											.queryParam("_type", _type)
											.build())
						.accept(MediaType.APPLICATION_JSON)
						.retrieve()
						.bodyToMono(new ParameterizedTypeReference<>() {});
		
		
		Map<Object, Object> result = response.block();
		
		return result;
	}

}
