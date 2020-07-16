package kr.spring.test.controller.pagination;

public class PageMaker {
		
	private int totalContent;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 10;
	private Criteria criteria;
	public void calcData() {
		endPage = (int) (Math.ceil(criteria.getPage()/(double) displayPageNum)*displayPageNum);
		int tempEndPage = (int)(Math.ceil(totalContent/(double)criteria.getContentNum()));
		startPage = (endPage - displayPageNum)+1;
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage * criteria.getContentNum() >= totalContent ? false:true;
	}
	public int getTotalContent() {
		return totalContent;
	}
	public void setTotalContent(int totalContent) {
		this.totalContent = totalContent;
		calcData();
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
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	public Criteria getCriteria() {
		return criteria;
	}
	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
	}
	public int getLastContent() {
		return (int)(Math.ceil(totalContent/(double)criteria.getContentNum()));
	}
	@Override
	public String toString() {
		return "PageMaker [totalContent=" + totalContent + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", prev=" + prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", criteria=" + criteria
				+ "]";
	}
	
}
