package kr.green.project.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ShoppingbasketVo {

	private int shoppingNum;
	private String userId;
	private int enrollNum;
	private char isPurchase;
	private int purchase;
	private Date basketDate;
	private String optionCode;
//	장바구니번호 / 회원아이디 / 등록글 번호 / 존재여부 / 구매량 / 담은 날짜 / 옵션코드
	public int getShoppingNum() {
		return shoppingNum;
	}
	public void setShoppingNum(int shoppingNum) {
		this.shoppingNum = shoppingNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getEnrollNum() {
		return enrollNum;
	}
	public void setEnrollNum(int enrollNum) {
		this.enrollNum = enrollNum;
	}
	public char getIsPurchase() {
		return isPurchase;
	}
	public void setIsPurchase(char isPurchase) {
		this.isPurchase = isPurchase;
	}
	public int getPurchase() {
		return purchase;
	}
	public void setPurchase(int purchase) {
		this.purchase = purchase;
	}
	public String getBasketDate() {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String to = transFormat.format(basketDate);
		return to;
	}
	public void setBasketDate(Date basketDate) {
		this.basketDate = basketDate;
	}
	public void setBasketDate(String date) {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			basketDate = transFormat.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	public String getOptionCode() {
		return optionCode;
	}
	public void setOptionCode(String optionCode) {
		this.optionCode = optionCode;
	}
	@Override
	public String toString() {
		return "ShoppingbasketVo [shoppingNum=" + shoppingNum + ", userId=" + userId + ", enrollNum=" + enrollNum + ", isPurchase="
				+ isPurchase + ", purchase=" + purchase + ", basketDate=" + basketDate + ", optionCode=" + optionCode
				+ "]";
	}
	
}
