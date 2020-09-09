package kr.green.project.pagination;

public class Criteria {

	private int page;
	private int perPageNum;
	private String type;
	private String search;
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 30;
		this.type = "all";
		this.search = "";
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
		}
		else
			this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		if(perPageNum < 30) {
			this.perPageNum = 30;
		}
		else
			this.perPageNum = perPageNum;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
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
		return (this.page -1) * perPageNum;
	}
}
