package com.hanulso.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class SampleDTO {
	
	private String name;
	private int age;
	//@DateTimeFormat(pattern="yyyy/MM/dd")
	// 처리하고자 하는 데이터가 문자열로 yyyy/MM/dd 형식에 맞다면 자동으로 날짜 타입으로 변환되어 birth 변수에 저장된다
	private String birth;//java.util로 import
	
}
