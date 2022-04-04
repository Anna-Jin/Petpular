package com.petpular.openAPI;

import lombok.Data;

@Data
public class AbandonedAnimal {
	private String resultCode;
	private String resultMsg;
	private String desertionNo;
	private String filename;
	private String happenDt;
	private String happenPlace;
	private String kindCd;
	private String colorCd;
	private String age;
	private String weight;
	private String noticeNo;
	private String noticeSdt;
	private String noticeEdt;
	private String popfile;
	private String processState;
	private String sexCd;
	private String neuterYn;
	private String specialMark;
	private String careNm;
	private String careTel;
	private String careAddr;
	private String orgNm;
	private String chargeNm;
	private String officetel;
	private String numOfRows;
	private String pageNo;
	private String totalCount;
}
