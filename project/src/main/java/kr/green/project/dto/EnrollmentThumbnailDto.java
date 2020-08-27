package kr.green.project.dto;

public class EnrollmentThumbnailDto {

	private int num;
	private String mainTitle;
	private String subTitle;
	private int adNum;
	private String productCode;
	private int discount;
	private int categoryNum;
	private int finalPrice;
	private int discountPercent;
	private int thumbnailNum;
	private int enrollNum;
	private String thumbnailImage;
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
	public int getAdNum() {
		return adNum;
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
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
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
	public int getThumbnailNum() {
		return thumbnailNum;
	}
	public void setThumbnailNum(int thumbnailNum) {
		this.thumbnailNum = thumbnailNum;
	}
	public int getEnrollNum() {
		return enrollNum;
	}
	public void setEnrollNum(int enrollNum) {
		this.enrollNum = enrollNum;
	}
	public String getThumbnailImage() {
		return thumbnailImage;
	}
	public void setThumbnailImage(String thumbnailImage) {
		this.thumbnailImage = thumbnailImage;
	}
	@Override
	public String toString() {
		return "EnrollmentThunbnailDto [num=" + num + ", mainTitle=" + mainTitle + ", subTitle=" + subTitle + ", adNum="
				+ adNum + ", productCode=" + productCode + ", discount=" + discount + ", categoryNum=" + categoryNum
				+ ", finalPrice=" + finalPrice + ", discountPercent=" + discountPercent + ", thumbnailNum="
				+ thumbnailNum + ", enrollNum=" + enrollNum + ", thumbnailImage=" + thumbnailImage + "]";
	}
}
