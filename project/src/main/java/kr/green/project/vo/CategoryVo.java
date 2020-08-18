package kr.green.project.vo;

public class CategoryVo {

	private int categoryNum;
	private String mainCategory;
	private String middleCategory;
	private String subCategory;
	public int getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
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
	@Override
	public String toString() {
		return "category [categoryNum=" + categoryNum + ", mainCategory=" + mainCategory + ", middleCategory="
				+ middleCategory + ", subCategory=" + subCategory + "]";
	}
}
