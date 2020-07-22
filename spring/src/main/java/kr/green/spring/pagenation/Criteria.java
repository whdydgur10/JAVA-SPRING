package kr.green.spring.pagenation;

public class Criteria {
	
	private int page;
	private int perPageNum;
	private int type;
	private String search;
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
		this.type = 0;
		this.search = "";
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
	public int getType() {
		return type;
	}
	public void setType(int type) {
		if(type < 0 || type > 3)
			this.type = 0;
		else
			this.type = type;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", type=" + type + ", search=" + search + "]";
	}
	public int getPageStart() {
		return (page - 1) * perPageNum;
	}
	
}
