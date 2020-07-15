package kr.green.spring.pagenation;

public class Criteria {
	
	private int page;
	private int perPageNum;
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page <= 0)
			this.page = 1;
		else
			this.page = page;
	}
	public int getperPageNum() {
		return perPageNum;
	}
	public void setperPageNum(int perPageNum) {
		if(perPageNum < 10)
			this.perPageNum = 10;
		this.perPageNum = perPageNum;
	}
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	public int getPageStart() {
		return (page - 1) * perPageNum;
	}
	
}
