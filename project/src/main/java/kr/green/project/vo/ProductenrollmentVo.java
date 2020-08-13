package kr.green.project.vo;

public class ProductenrollmentVo {

	private int num;
	private String title;
	private String content;
	private char mainCategory;
	private String middleCategory;
	private String subCategory;
	private int adNum;
	private String productCode;
	private int discount;
//	등록글 번호 / 제목 / 내용 / 대분류 / 중분류 / 소분류 / 광고번호
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public char getMainCategory() {
		return mainCategory;
	}
	public void setMainCategory(char mainCategory) {
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
	public int getAdNum() {
		return adNum;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public void setAdNum(int adNum) {
		this.adNum = adNum;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	@Override
	public String toString() {
		return "ProductenrollmentVo [num=" + num + ", title=" + title + ", content=" + content + ", mainCategory="
				+ mainCategory + ", middleCategory=" + middleCategory + ", subCategory=" + subCategory + ", adNum="
				+ adNum + ", productCode=" + productCode + ", discount=" + discount + "]";
	}
	
}
