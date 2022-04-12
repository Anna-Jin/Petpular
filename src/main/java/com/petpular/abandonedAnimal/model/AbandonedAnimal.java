package com.petpular.abandonedAnimal.model;

import java.util.Date;

import lombok.Data;

@Data
public class AbandonedAnimal {
	private int id;
	private int userId;
	private String desertionNo;
	private String popfile;
	private String noticeNo;
	private String noticeSdt;
	private String noticeEdt;
	private String kindCd;
	private String processState;
	private String sexCd;
	private String neuterYn;
	private String age;
	private String weight; 
	private String specialMark;
	private String orgNm;
	private String careNm;
	private String careAddr;
	private String careTel;
	private String happenPlace; 
	private Date createdAt; 
	private Date updatedAt; 

}
