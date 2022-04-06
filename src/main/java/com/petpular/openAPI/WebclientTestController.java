package com.petpular.openAPI;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.util.DefaultUriBuilderFactory;

import com.petpular.common.JsonParserUtils;

@Controller
public class WebclientTestController {
	
	@RequestMapping("/api-test")
	@ResponseBody
	public String apiTest() throws IOException {
		
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=Y8ysgjcfITdLKYzk9pQp6pzphI2yY95czKzFUggqOQCdYuYLm9oAOBh%2Fhn1meZKp1UPtONWLAAIbu7McjP9R9Q%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("upkind","UTF-8") + "=" + URLEncoder.encode("422400", "UTF-8")); /*축종코드 (개 : 417000, 고양이 : 422400, 기타 : 429900)*/
        urlBuilder.append("&" + URLEncoder.encode("upr_cd","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*시도코드 (시도 조회 OPEN API 참조)*/
        urlBuilder.append("&" + URLEncoder.encode("org_cd","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*시군구코드 (시군구 조회 OPEN API 참조)*/
        urlBuilder.append("&" + URLEncoder.encode("state","UTF-8") + "=" + URLEncoder.encode("notice", "UTF-8")); /*상태(전체 : null(빈값), 공고중 : notice, 보호중 : protect)*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호 (기본값 : 1)*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("20", "UTF-8")); /*페이지당 보여줄 개수 (1,000 이하), 기본값 : 10*/
        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*xml(기본값) 또는 json*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
        return sb.toString();
	}
	
	private final static String BASE_URL = "http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic";
	private final String API_KEY = "Y8ysgjcfITdLKYzk9pQp6pzphI2yY95czKzFUggqOQCdYuYLm9oAOBh%2Fhn1meZKp1UPtONWLAAIbu7McjP9R9Q%3D%3D";
	
	
	@RequestMapping("/webclient-test")
	public String getAbandonedAnimal(Model model) throws Exception {
		String serviceKey = API_KEY;
		String upkind = "422400";
		String upr_cd = "6110000";
//		String org_cd = "3220000";
		String state = "notice";
		String pageNo = "1";
		String NumOfRows = "8";
		String _type = "json";
		
		DefaultUriBuilderFactory factory = new DefaultUriBuilderFactory(BASE_URL);
		factory.setEncodingMode(DefaultUriBuilderFactory.EncodingMode.VALUES_ONLY);
		
		WebClient webClient = WebClient.builder()
								.uriBuilderFactory(factory)
								.baseUrl(BASE_URL)
								.build();
		
		String result = webClient.get()
								.uri(uriBuilder -> uriBuilder
													.queryParam("serviceKey", serviceKey)
													.queryParam("upkind", upkind)
													.queryParam("upr_cd", upr_cd)
													.queryParam("state", state)
													.queryParam("pageNo", pageNo)
													.queryParam("NumOfRows", NumOfRows)
													.queryParam("_type", _type)
													.build())
								.accept(MediaType.APPLICATION_JSON)
								.retrieve()
								.bodyToMono(String.class)
								.block();
		
		JSONArray response = JsonParserUtils.parseStringToJson(result);
		
		
		model.addAttribute("response", response);
		return "test/test";								
	}
}
