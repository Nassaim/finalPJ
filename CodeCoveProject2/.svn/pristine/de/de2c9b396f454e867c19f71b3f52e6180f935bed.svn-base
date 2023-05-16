package kr.or.ddit.common.report;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.ReportVO;
import kr.or.ddit.mapper.report.ReportMapper;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Inject
	private ReportMapper repMapper;

	@Override
	public void reportInsert(ReportVO reportVO) {
		repMapper.reportInsert(reportVO);
	}

}
