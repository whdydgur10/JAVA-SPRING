package kr.green.project.pagination;

public class RootCri {

	private int page;
	private int perPageNum;
	private String type;
	private String search;
	public RootCri() {
		this.page = 1;
		this.perPageNum = 1;
		this.type = "code";
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
		if(perPageNum < 1) {
			this.perPageNum = 1;
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
		return "RootCri [page=" + page + ", perPageNum=" + perPageNum + ", type=" + type + ", search=" + search + "]";
	}
	public int getPageStart() {
		return (this.page -1) * perPageNum;
	}
}
