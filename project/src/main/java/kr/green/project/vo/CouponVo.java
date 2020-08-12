package kr.green.project.vo;

public class CouponVo {

	private int num;
	private String name;
	private int discount;
	private String userId;
	private int purchaseNum;
	private String code;
//	쿠폰번호 / 쿠폰이름 / 할인금액 / 가지고있는회원 / 사용한 구매내역
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public int getPurchaseNum() {
		return purchaseNum;
	}
	public void setPurchaseNum(int purchaseNum) {
		this.purchaseNum = purchaseNum;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	@Override
	public String toString() {
		return "CouponVo [num=" + num + ", name=" + name + ", discount=" + discount + ", userId=" + userId
				+ ", purchaseNum=" + purchaseNum + ", code=" + code + "]";
	}
	
	public String getStringDiscount() {
		return String.format("%,d", discount);
	}
}
