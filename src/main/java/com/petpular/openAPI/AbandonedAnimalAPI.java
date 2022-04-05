package com.petpular.openAPI;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.reactive.function.client.WebClient;

import com.petpular.common.WebClientUtils;
import reactor.core.publisher.Mono;

@Service
public class AbandonedAnimalAPI {
	
	@Autowired
	private WebClientUtils webClientUtils;

	private String serviceKey = "Y8ysgjcfITdLKYzk9pQp6pzphI2yY95czKzFUggqOQCdYuYLm9oAOBh%2Fhn1meZKp1UPtONWLAAIbu7McjP9R9Q%3D%3D"; // 서비스키
	private String pageNo = "1"; // 페이지 번호 (기본값 : 1)
	private String NumOfRows = "100"; // 페이지당 보여줄 개수 (1,000 이하), 기본값 : 10
	private String _type = "json"; // json 형태로 반환
	private String upkind = "422400"; // 축종 코드 (고양이)
	private String state = "notice"; // 공고 상태 (보호중)
	private String bgnde = LocalDate.now().minusMonths(1).format(DateTimeFormatter.ofPattern("yyyyMMdd")).toString(); // 유기날짜 (검색 시작일)
	private String endde = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd")).toString(); // 유기날짜 (검색 종료일)
	
	
	public Map<Object, Object> abandonedAniamlSido() {
		WebClient webClient = webClientUtils.webClient();
		
		Mono<Map<Object, Object>> response = webClient.get()
						.uri(uriBuilder -> uriBuilder.path("/sido")
											.queryParam("serviceKey", serviceKey)
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
	
	public Map<Object, Object> abandonedAniamlSigungu(String sidoCode) {
		WebClient webClient = webClientUtils.webClient();
		
		Mono<Map<Object, Object>> response = webClient.get()
						.uri(uriBuilder -> uriBuilder.path("/sigungu")
											.queryParam("serviceKey", serviceKey)
											.queryParam("upr_cd", sidoCode)
											.queryParam("_type", _type)
											.build())
						.accept(MediaType.APPLICATION_JSON)
						.retrieve()
						.bodyToMono(new ParameterizedTypeReference<>() {});
		
		
		Map<Object, Object> result = response.block();
		
		return result;
	}
	
	@GetMapping("/abandonedAnimal")
	public Map<Object, Object> abandonedAniaml(String upr_cd, String org_cd) {
		
		WebClient webClient = webClientUtils.webClient();
		
		Mono<Map<Object, Object>> response = webClient.get()
						.uri(uriBuilder -> uriBuilder.path("/abandonmentPublic")
											.queryParam("serviceKey", serviceKey)
											.queryParam("bgnde", bgnde)
											.queryParam("endde", endde)
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
