package kr.green.project.dto;

public class ShopEnrollProOptionThumbDto {

	private int finalPrice;
	private String mainTitle;
	private String thumbnailImage;
	private String size;
	private String color;
	private int purchase;
	private int num;
	private String productCode;
	private String mainCategory;
	private int shoppingNum;
	public int getFinalPrice() {
		return finalPrice;
	}
	public void setFinalPrice(int finalPrice) {
		this.finalPrice = finalPrice;
	}
	public String getMainTitle() {
		return mainTitle;
	}
	public void setMainTitle(String mainTitle) {
		this.mainTitle = mainTitle;
	}
	public String getThumbnailImage() {
		return thumbnailImage;
	}
	public void setThumbnailImage(String thumbnailImage) {
		this.thumbnailImage = thumbnailImage;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getPurchase() {
		return purchase;
	}
	public void setPurchase(int purchase) {
		this.purchase = purchase;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getMainCategory() {
		return mainCategory;
	}
	public void setMainCategory(String mainCategory) {
		this.mainCategory = mainCategory;
	}
	public int getShoppingNum() {
		return shoppingNum;
	}
	public void setShoppingNum(int shoppingNum) {
		this.shoppingNum = shoppingNum;
	}
	@Override
	public String toString() {
		return "ShopEnrollProOptionThumbDto [finalPrice=" + finalPrice + ", mainTitle=" + mainTitle
				+ ", thumbnailImage=" + thumbnailImage + ", size=" + size + ", color=" + color + ", purchase="
				+ purchase + ", num=" + num + ", productCode=" + productCode + ", mainCategory=" + mainCategory
				+ ", shoppingNum=" + shoppingNum + "]";
	}
	
	public String getStringFinalPrice() {
		return String.format("%,d", finalPrice * purchase);
	}
}
