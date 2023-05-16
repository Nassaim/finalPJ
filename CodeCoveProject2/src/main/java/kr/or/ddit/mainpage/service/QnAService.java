package kr.or.ddit.mainpage.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.mainpage.vo.QnAVO;

public interface QnAService {

	public int registerQnABoard(QnAVO qnaVO);

	public List<QnAVO> selectQnABoardList(PaginationInfoVO<QnAVO> pagingVO);

	public QnAVO readQnA(String qnaNum);

	public int countQnAList(PaginationInfoVO<QnAVO> pagingVO);

	public int registerAnswer(HttpServletRequest req, QnAVO qnaVO);

	public int registerAnswer(String answerId, String answerContent, String qnaNum);

}
