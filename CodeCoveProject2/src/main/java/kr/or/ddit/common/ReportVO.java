package kr.or.ddit.common;

import java.util.Date;
import java.util.List;

import kr.or.ddit.admin.vo.ComCodeVO;
import lombok.Data;

@Data
public class ReportVO {
	private String repNum;      //신고번호
	private String memId;       //회원아이디
	private String targetId;    //신고타겟아이디
	private Date repDate;       //신고일
	private String repContent;  //신고사유 EXP_REPORT컬럼
	private int isReport;		//신고유무확인용
	
	

}
