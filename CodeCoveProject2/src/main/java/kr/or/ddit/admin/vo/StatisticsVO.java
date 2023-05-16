package kr.or.ddit.admin.vo;

import lombok.Data;

@Data
public class StatisticsVO {

	// 기간
	private String chYear;
	private String chMonth;
	
	// 합산매출
	private String chPrice;
	
	// 카테고리
	private String chCate;
	
	private int[] data;
	
	private String[] label;
	private String[] backgroundColor;
	
}
