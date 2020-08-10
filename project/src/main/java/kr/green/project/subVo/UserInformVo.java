package kr.green.project.vo;

public class UserInformVo {

	private int level;
	private int couponNum;
	private int point;
	private int purchaseListNum;
	private int vaginalNum;
	private int shoppingBasketNum;
	private int reviewNum;
	public UserInformVo() {
		this.level = 1;
		this.couponNum = 0;
		this.point = 0;
		this.purchaseListNum = 0;
		this.vaginalNum = 0;
		this.shoppingBasketNum = 0;
		this.reviewNum = 0;
	}
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
