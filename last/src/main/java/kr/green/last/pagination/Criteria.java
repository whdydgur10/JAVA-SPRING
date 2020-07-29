package kr.green.last.pagination;

public class Criteria {

	private int page; 
	private int pageContent;
	private String searchType;
	private String searchWord;
	
	public Criteria() {
		this.page = 1;
		this.pageContent = 1;
		this.searchType = "all";
		this.searchWord = "";
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page < 0)
			page = 1;
		this.page = page;
	}
	public int getPageContent() {
		return pageContent;
	}
	public void setPageContent(int pageContent) {
		if(pageContent < 1)
			pageContent = 1;
		this.pageContent = pageContent;
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
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", pageContent=" + pageContent + ", searchType=" + searchType
				+ ", searchWord=" + searchWord + "]";
	}
	public int getStartPage() {
		return (this.page -1) * pageContent;
	}
	/* 쿼리문에서 limit에 사용되는 인덱스를 계산하는 getter */
}
