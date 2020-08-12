package kr.green.project.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
	private int usePoint;
	private Date orderDate;
//	구매번호 / 회원아이디 / 입금여부 / 입금남은날 / 포인트사용여부 / 쿠폰사용여부 / 물품발송상황 / 확정여부 / 확정남은날 / 총금액 / 할인금 / 배송비 / 사용한 포인트 / 주문날짜
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
	public String getDepositDate() {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String to = transFormat.format(depositDate);
		return to;
	}
	public void setDepositDate(Date depositDate) {
		this.depositDate = depositDate;
	}
	public void setDepositDate(String date) {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			depositDate = transFormat.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
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
	public String getConfirmDate() {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String to = transFormat.format(confirmDate);
		return to;
	}
	public void setConfirmDate(Date confirmDate) {
		this.confirmDate = confirmDate;
	}
	public void setConfirmDate(String date) {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			confirmDate = transFormat.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
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
	public int getUsePoint() {
		return usePoint;
	}
	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}
	public String getOrderDate() {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String to = transFormat.format(orderDate);
		return to;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public void setOrderDate(String date) {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			orderDate = transFormat.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	@Override
	public String toString() {
		return "PurchaseVo [num=" + num + ", userId=" + userId + ", deposit=" + deposit + ", depositDate=" + depositDate
				+ ", isPoint=" + isPoint + ", isCoupon=" + isCoupon + ", situation=" + situation + ", isConfirm="
				+ isConfirm + ", confirmDate=" + confirmDate + ", price=" + price + ", discountPrice=" + discountPrice
				+ ", deliveryPrice=" + deliveryPrice + ", usePoint=" + usePoint + ", orderDate=" + orderDate + "]";
	}
	
	public int getPricePoint() {
		return (price - usePoint) / 100;
	}
	
	public String getStringPrice() {
		return String.format("%,d", price);
	}
}
