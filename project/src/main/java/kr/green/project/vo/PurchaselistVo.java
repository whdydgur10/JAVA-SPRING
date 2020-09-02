package kr.green.project.vo;

public class PurchaselistVo {

	private int listNum;
	private int purchaseNum;
	private int enrollNum;
	private int purchase;
	private char isCancel;
	private int shoppingNum;
//	구매리스트번호 / 구매주문서번호 / 등록글번호 / 구매량 / 취소여부 / 장바구니번호
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	
	public int getPurchaseNum() {
		return purchaseNum;
	}
	public void setPurchaseNum(int purchaseNum) {
		this.purchaseNum = purchaseNum;
	}
	public int getEnrollNum() {
		return enrollNum;
	}
	public void setEnrollNum(int enrollNum) {
		this.enrollNum = enrollNum;
	}
	public int getPurchase() {
		return purchase;
	}
	public void setPurchase(int purchase) {
		this.purchase = purchase;
	}
	public char getIsCancel() {
		return isCancel;
	}
	public void setIsCancel(char isCancel) {
		this.isCancel = isCancel;
	}
	public int getShoppingNum() {
		return shoppingNum;
	}
	public void setShoppingNum(int shoppingNum) {
		this.shoppingNum = shoppingNum;
	}
	@Override
	public String toString() {
		return "purchaselistVo [listNum=" + listNum + ", purchaseNum=" + purchaseNum + ", enrollNum=" + enrollNum
				+ ", purchase=" + purchase + ", isCancel=" + isCancel + ", shoppingNum=" + shoppingNum + "]";
	}
	
}
