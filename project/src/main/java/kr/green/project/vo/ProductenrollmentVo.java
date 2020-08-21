package kr.green.project.vo;

public class ProductenrollmentVo {

	private int num;
	private String mainTitle;
	private String subTitle;
	private int adNum;
	private String productCode;
	private int discount;
	private int categoryNum;
	private int finalPrice;
	private int discountPercent;
//	등록글 번호 / 제목 / 내용 / 대분류 / 중분류 / 소분류 / 광고번호
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	public String getMainTitle() {
		return mainTitle;
	}
	public void setMainTitle(String mainTitle) {
		this.mainTitle = mainTitle;
	}
	public String getSubTitle() {
		return subTitle;
	}
	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}
	public int getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
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
	public int getFinalPrice() {
		return finalPrice;
	}
	public void setFinalPrice(int finalPrice) {
		this.finalPrice = finalPrice;
	}
	public int getDiscountPercent() {
		return discountPercent;
	}
	public void setDiscountPercent(int discountPercent) {
		this.discountPercent = discountPercent;
	}
	@Override
	public String toString() {
		return "ProductenrollmentVo [num=" + num + ", mainTitle=" + mainTitle + ", subTitle=" + subTitle + ", adNum="
				+ adNum + ", productCode=" + productCode + ", discount=" + discount + ", categoryNum=" + categoryNum
				+ ", finalPrice=" + finalPrice + ", discountPercent=" + discountPercent + "]";
	}
	
	public String getStringFinalPrice() {
		return String.format("%,d", finalPrice);
	}
}
