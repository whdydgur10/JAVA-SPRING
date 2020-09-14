package kr.green.project.dto;

public class PurchaselistEnrollDto {

	private int listNum;
	private int enrollNum;
	private int shoppingNum;
	private String mainTitle;
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public int getEnrollNum() {
		return enrollNum;
	}
	public void setEnrollNum(int enrollNum) {
		this.enrollNum = enrollNum;
	}
	public int getShoppingNum() {
		return shoppingNum;
	}
	public void setShoppingNum(int shoppingNum) {
		this.shoppingNum = shoppingNum;
	}
	@Override
	public String toString() {
		return "PurchaselistEnrollDto [listNum=" + listNum + ", enrollNum=" + enrollNum + ", shoppingNum=" + shoppingNum
				+ ", mainTitle=" + mainTitle + "]";
	}
	public String getMainTitle() {
		return mainTitle;
	}
	public void setMainTitle(String mainTitle) {
		this.mainTitle = mainTitle;
	}
}
