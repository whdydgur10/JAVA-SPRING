package kr.green.project.vo;

import java.util.Date;

public class PurchaseVo {

	private int num;
	private String userId;
	private String deposit;
	private Date depositDate;
	private char isPoint;
	private char isCoupon;
	private String situation;
	private char isConfirm;
	private Date confirmDate;
	private int price;
	private int discountPrice;
	private int deliveryPrice;
//	구매번호 / 회원아이디 / 입금여부 / 입금남은날 / 포인트사용여부 / 쿠폰사용여부 / 물품발송상황 / 확정여부 / 확정남은날 / 총금액 / 할인금 / 배송비
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getDeposit() {
		return deposit;
	}
	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}
	public Date getDepositDate() {
		return depositDate;
	}
	public void setDepositDate(Date depositDate) {
		this.depositDate = depositDate;
	}
	public char getIsPoint() {
		return isPoint;
	}
	public void setIsPoint(char isPoint) {
		this.isPoint = isPoint;
	}
	public char getIsCoupon() {
		return isCoupon;
	}
	public void setIsCoupon(char isCoupon) {
		this.isCoupon = isCoupon;
	}
	public String getSituation() {
		return situation;
	}
	public void setSituation(String situation) {
		this.situation = situation;
	}
	public char getIsConfirm() {
		return isConfirm;
	}
	public void setIsConfirm(char isConfirm) {
		this.isConfirm = isConfirm;
	}
	public Date getConfirmDate() {
		return confirmDate;
	}
	public void setConfirmDate(Date confirmDate) {
		this.confirmDate = confirmDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDiscountPrice() {
		return discountPrice;
	}
	public void setDiscountPrice(int discountPrice) {
		this.discountPrice = discountPrice;
	}
	public int getDeliveryPrice() {
		return deliveryPrice;
	}
	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}
	@Override
	public String toString() {
		return "Purchase [num=" + num + ", userId=" + userId + ", deposit=" + deposit + ", depositDate=" + depositDate
				+ ", isPoint=" + isPoint + ", isCoupon=" + isCoupon + ", situation=" + situation + ", isConfirm="
				+ isConfirm + ", confirmDate=" + confirmDate + ", price=" + price + ", discountPrice=" + discountPrice
				+ ", deliveryPrice=" + deliveryPrice + "]";
	}
	
}
