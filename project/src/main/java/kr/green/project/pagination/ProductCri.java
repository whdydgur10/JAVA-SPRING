package kr.green.project.pagination;

public class ProductCri {

	private int page;
	private int perPageNum;
	private String mainCategory;
	private String middleCategory;
	private String subCategory;
	private String search;
	public ProductCri() {
		this.page = 1;
		this.perPageNum = 20;
		this.mainCategory = "";
		this.middleCategory = "";
		this.subCategory = "";
		this.search = "";
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	public String getMainCategory() {
		return mainCategory;
	}
	public void setMainCategory(String mainCategory) {
		this.mainCategory = mainCategory;
	}
	public String getMiddleCategory() {
		return middleCategory;
	}
	public void setMiddleCategory(String middleCategory) {
		this.middleCategory = middleCategory;
	}
	public String getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	@Override
	public String toString() {
		return "ProductCri [page=" + page + ", perPageNum=" + perPageNum + ", mainCategory=" + mainCategory
				+ ", middleCategory=" + middleCategory + ", subCategory=" + subCategory + ", search=" + search + "]";
	}
	public int getPageStart() {
		return (this.page -1) * perPageNum;
	}
}
