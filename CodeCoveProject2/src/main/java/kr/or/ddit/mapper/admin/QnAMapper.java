package kr.or.ddit.mapper.admin;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import kr.or.ddit.common.PaginationInfoVO;
import kr.or.ddit.mainpage.vo.QnAVO;

@Mapper
public interface QnAMapper {

	public int registerQnA(QnAVO qnaVO);
	
	public int countQnAList(PaginationInfoVO<QnAVO> pagingVO);

	public List<QnAVO> selectQnABoardList(PaginationInfoVO<QnAVO> pagingVO);

	public QnAVO readQnA(String qnaNum);

	public void incrementView(String qnaNum);

	public int registerAnswer(@Param("answerId") String answerId,@Param("answerContent") String answerContent,@Param("qnaNum") String qnaNum);


}
