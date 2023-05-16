package kr.or.ddit.common;

import java.util.List;

public class PaginationInfoVO<T> {
	private int totalRecord; // 총 게시글 수
	private int totalPage; // 총 페이지 수
	private int currentPage = 1; // 현재 페이지
	private int screenSize = 5; // 페이지 당 게시글 수
	private int blockSize = 5; // 페이지 블록 수
	private int startRow; // 시작 row
	private int endRow; // 끝 row
	private int startPage; // 시작 페이지
	private int endPage; // 끝 페이지
	private List<T> dataList; // 결과를 넣을 데이터 리스트
	
	// 검색조건
	private String searchType; // 검색 타입
	private String searchWord; // 검색 단어
	private String startPeriod;	// 검색 시작일
	private String endPeriod;	// 검색 종료일
	private String searchCode;	// 검색 코드

	private T detailCondition; // 상세 검색
	
	
	//솔루션리스트 페이징용 VO 추가
	private String eprodTag;
	private String eprodLangCode;

	public String getEprodTag() {
		return eprodTag;
	}

	public void setEprodTag(String eprodTag) {
		this.eprodTag = eprodTag;
	}

	public String getEprodLangCode() {
		return eprodLangCode;
	}

	public void setEprodLangCode(String eprodLangCode) {
		this.eprodLangCode = eprodLangCode;
	}

	public static String getBsptrn() {
		return BSPTRN;
	}

	public PaginationInfoVO() {
	}

	// PaginationInfoVO 객체를 만들 때, 한 페이지당 게시글 수와 페이지 블록 수를 원하는 값으로 초기화 할 수 있다.
	public PaginationInfoVO(int screenSize, int blockSize) {
		super();
		this.screenSize = screenSize;
		this.blockSize = blockSize;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		// ceil은 올림
		totalPage = (int) Math.ceil(totalRecord / (double) screenSize);
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage; // 현재 페이지
		this.endRow = currentPage * screenSize; // 끝 row = 현재 페이지 * 한 페이지당 게시글 수
		this.startRow = endRow - (screenSize - 1); // 시작 row = 끝 row - (한 페이지당 게시글 수 - 1)
		// 마지막 페이지 = (현재 페이지 + (페이지 블록 사이즈 - 1)) / 페이지 블록 사이즈 * 페이지 블록 사이즈
		this.endPage = (currentPage + (blockSize - 1)) / blockSize * blockSize;
		this.startPage = endPage - (blockSize - 1);
	}

	public int getScreenSize() {
		return screenSize;
	}

	public void setScreenSize(int screenSize) {
		this.screenSize = screenSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public List<T> getDataList() {
		return dataList;
	}

	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public String getPagingHTML() {
		StringBuffer html = new StringBuffer();
		html.append("<nav aria-label='Page navigation'>");
		html.append("<ul class='pagination justify-content-center'>");

		if (startPage > 1) {
			html.append("<li class='page-item'><a href='' class='page-link' data-page='" + (startPage - blockSize) + "'>&laquo;</a></li>");
		}

		for (int i = startPage; i <= (endPage < totalPage ? endPage : totalPage); i++) {
			if (i == currentPage) {
				html.append("<li class='page-item active'><span class='page-link'>" + i + "</span></li>");
			} else {
				html.append("<li class='page-item'><a href='' class='page-link' data-page='" + i + "'>" + i + "</a></li>");
			}
		}

		if (endPage < totalPage) {
			html.append("<li class='page-item'><a href='' class='page-link' data-page='" + (endPage + 1) + "'>&raquo;</a></li>");
		}

		html.append("</ul>");
		html.append("</nav>");
		return html.toString();
	}

	private static final String BSPTRN = "<li class='page-item %s' %s><a class='page-link' href='#' data-page='%d'>%s</a></li>";

	private String makePreviousLink() {
		boolean disabled = startPage <= blockSize;
		return String.format(BSPTRN, disabled ? "disabled" : "", "", startPage - blockSize, "&laquo;");
	}

	private String makePageLink() {
		StringBuffer pageLink = new StringBuffer();
		endPage = endPage > totalPage ? totalPage : endPage;
		for (int page = startPage; page <= endPage; page++) {
			boolean active = page == currentPage;
			pageLink.append(
					String.format(BSPTRN, active ? "active" : "", "aria-current='page'", page, Integer.toString(page)));
		}
		return pageLink.toString();
	}

	public String getPagingHTMLBS() {
		StringBuffer html = new StringBuffer();
		html.append(" <nav aria-label='...'>    ");
		html.append("   <ul class='pagination'> ");
		html.append(makePreviousLink());
		html.append(makePageLink());
		html.append(makeNextLink());
		html.append("   </ul>                   ");
		html.append(" </nav>                    ");
		return html.toString();
	}

	private String makeNextLink() {
		boolean disabled = totalPage <= endPage;
		return String.format(BSPTRN, disabled ? "disabled" : "", "", endPage + 1, "&raquo;");
	}

	public T getDetailCondition() {
		return detailCondition;
	}

	public void setDetailCondition(T detailCondition) {
		this.detailCondition = detailCondition;
	}

	public String getStartPeriod() {
		return startPeriod;
	}

	public void setStartPeriod(String startPeriod) {
		this.startPeriod = startPeriod;
	}

	public String getEndPeriod() {
		return endPeriod;
	}

	public void setEndPeriod(String endPeriod) {
		this.endPeriod = endPeriod;
	}

	public String getSearchCode() {
		return searchCode;
	}

	public void setSearchCode(String searchCode) {
		this.searchCode = searchCode;
	}

	
	
	
	
}
