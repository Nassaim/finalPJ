package kr.or.ddit.member.vo;

import lombok.Data;

@Data
public class MyChartVO {

	// mypage 차트용
	private String expertId;
	private String chYear; // 차트 삽입용 년도(2글자 ex)23))
	private String chMonth; // 월
	private String chMonthSum; // 월별 합계
	private String chProdCate; // 카테고리별
	private String chCateName; // 카테고리종류

}
