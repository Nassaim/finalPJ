package kr.or.ddit.common;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of = { "attatchNum" })
@ToString(exclude = {})
@NoArgsConstructor
public class AttatchVO {

	public AttatchVO(MultipartFile attatchFile) {
		super();
		if (!attatchFile.isEmpty()) {
			this.attatchFile = attatchFile;
			originNm = attatchFile.getOriginalFilename();
			saveNm = UUID.randomUUID().toString();
			try {
				filePath = new File("D:/FinalProject/uploadFile", saveNm).getCanonicalPath();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			attatchType = attatchFile.getContentType();
			attatchSize = attatchFile.getSize();
		}
	}

	private String rNum;
	private String attatchNum;
	private int attatchOrder;
	private String attatchPlace;
	private String filePath;
	private String originNm;
	private String saveNm;
	private String attatchType;
	private long attatchSize;
	private MultipartFile attatchFile;
	private int downNumber;
	private String attatchDate;
	private String uploaderId;

	public void saveTo(File saveFolder) throws IOException {
		if (!saveFolder.exists()) {
			saveFolder.mkdirs();
		}
		if (attatchFile != null)
			attatchFile.transferTo(new File(saveFolder, saveNm));
	}

	public void saveGit(File git) throws IOException {
		if (attatchFile != null)
			attatchFile.transferTo(new File(git, originNm));
	}

	public void removeTo(File file) {
		File removefile = new File(file, saveNm);
		if (removefile.exists()) {
			removefile.delete();
		}
	}

	private List<T> attatchNums;
}
