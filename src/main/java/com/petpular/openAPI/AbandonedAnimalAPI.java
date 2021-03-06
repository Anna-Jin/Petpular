package com.petpular.openAPI;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.reactive.function.client.WebClient;

import com.petpular.common.JsonParserUtils;
import com.petpular.common.WebClientUtils;

@Service
public class AbandonedAnimalAPI {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private WebClientUtils webClientUtils;

	private String serviceKey = "Y8ysgjcfITdLKYzk9pQp6pzphI2yY95czKzFUggqOQCdYuYLm9oAOBh%2Fhn1meZKp1UPtONWLAAIbu7McjP9R9Q%3D%3D"; // 서비스키
	private String pageNo; // 페이지 번호 (기본값 : 1)
	private String NumOfRows; // 페이지당 보여줄 개수 (1,000 이하), 기본값 : 10
	private String _type = "json"; // json 형태로 반환
	private String state = "notice"; // 공고 상태 (보호중)
	private String bgnde = LocalDate.now().minusMonths(1).format(DateTimeFormatter.ofPattern("yyyyMMdd")).toString(); // 유기날짜 (검색 시작일)
	private String endde = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd")).toString(); // 유기날짜 (검색 종료일)
	
	/**
	 * 시/도 호출
	 * @return
	 */
	public JSONArray abandonedAniamlSido() {
		pageNo = "1";
		NumOfRows = "17";
		
		
		WebClient webClient = webClientUtils.webClient();
		
		String response = webClient.get()
						.uri(uriBuilder -> uriBuilder.path("/sido")
											.queryParam("serviceKey", serviceKey)
											.queryParam("pageNo", pageNo)
											.queryParam("NumOfRows", NumOfRows)
											.queryParam("_type", _type)
											.build())
						.accept(MediaType.APPLICATION_JSON)
						.retrieve()
						.bodyToMono(String.class)
						.retry(3)
						.block();
		
		if (response.startsWith("<")) {
			logger.error("[공공 API 호출] 공공 API 호출 에러");
		}
		
		
		JSONArray result = null;
		
		try {
			result = JsonParserUtils.parseStringToJson(response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * 시/군/구 호출
	 * @param sidoCode
	 * @return
	 */
	public JSONArray abandonedAniamlSigungu(String sidoCode) {
		WebClient webClient = webClientUtils.webClient();
		
		String response = webClient.get()
						.uri(uriBuilder -> uriBuilder.path("/sigungu")
											.queryParam("serviceKey", serviceKey)
											.queryParam("upr_cd", sidoCode)
											.queryParam("_type", _type)
											.build())
						.accept(MediaType.APPLICATION_JSON)
						.retrieve()
						.bodyToMono(String.class)
						.retry(3)
						.block();
		
		JSONArray result = null;
		
		try {
			result = JsonParserUtils.parseStringToJson(response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * 유기동물 리스트 호출
	 * @param upkind
	 * @param upr_cd
	 * @param org_cd
	 * @return
	 */
	@GetMapping("/abandonedAnimal")
	public JSONArray abandonedAniaml(String upkind, String upr_cd, String org_cd) {
		pageNo = "1";
		NumOfRows = "52";
		
		
		WebClient webClient = webClientUtils.webClient();
		
		String response = webClient.get()
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
						.bodyToMono(String.class)
						.retry(3)
						.block();
		
		JSONArray result = null;
		
		try {
			result = JsonParserUtils.parseStringToJson(response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
