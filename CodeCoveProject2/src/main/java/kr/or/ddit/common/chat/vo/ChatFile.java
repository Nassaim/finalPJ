package kr.or.ddit.common.chat.vo;


import java.util.Date;

import lombok.Data;

@Data
public class ChatFile {
	private int roomId;
	private String fullName;
	private String[] files;
	private Date regDate;
	
}
