package kr.green.project.dto;

public class UserInformDto {

	private int level;
	private int couponNum;
	private int point;
	private int purchaseListNum;
	private int vaginalNum;
	private int shoppingBasketNum;
	private int reviewNum;
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getCouponNum() {
		return couponNum;
	}
	public void setCouponNum(int couponNum) {
		this.couponNum = couponNum;
	}
	public int getPoint() {
		
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getPurchaseListNum() {
		return purchaseListNum;
	}
	public void setPurchaseListNum(int purchaseListNum) {
		this.purchaseListNum = purchaseListNum;
	}
	public int getVaginalNum() {
		return vaginalNum;
	}
	public void setVaginalNum(int vaginalNum) {
		this.vaginalNum = vaginalNum;
	}
	public int getShoppingBasketNum() {
		return shoppingBasketNum;
	}
	public void setShoppingBasketNum(int shoppingBasketNum) {
		this.shoppingBasketNum = shoppingBasketNum;
	}
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	@Override
	public String toString() {
		return "UserInform [level=" + level + ", couponNum=" + couponNum + ", point=" + point + ", purchaseListNum="
				+ purchaseListNum + ", vaginalNum=" + vaginalNum + ", shoppingBasketNum=" + shoppingBasketNum
				+ ", reviewNum=" + reviewNum + "]";
	}
	
}
