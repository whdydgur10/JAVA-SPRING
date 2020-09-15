package kr.green.project.dto;

public class PurchaseDto {

	private int num;
	private String userId;
	private String deposit;
	private String depositDate;
	private char isPoint;
	private char isCoupon;
	private String situation;
	private char isConfirm;
	private String confirmDate;
	private int price;
	private int discountPrice;
	private int deliveryPrice;
	private int usePoint;
	private String orderDate;
	private char isDel;
	private String mainTitle;
	private String invoice;
	public int getNum() {
		return num;
	}
	public PurchaseDto(int num, String userId, String deposit, String depositDate, char isPoint, char isCoupon,
			String situation, char isConfirm, String confirmDate, int price, int discountPrice, int deliveryPrice,
			int usePoint, String orderDate, char isDel, String mainTitle, String invoice) {
		this.num = num;
		this.userId = userId;
		this.deposit = deposit;
		this.isPoint = isPoint;
		this.isCoupon = isCoupon;
		this.situation = situation;
		this.isConfirm = isConfirm;
		this.price = price;
		this.discountPrice = discountPrice;
		this.deliveryPrice = deliveryPrice;
		this.usePoint = usePoint;
		this.isDel = isDel;
		this.mainTitle = mainTitle;
		this.depositDate = depositDate;
		this.confirmDate = confirmDate;
		this.orderDate = orderDate;
		this.invoice = invoice;
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
		return confirmDate;
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
		return orderDate;
	}
	public String getDepositDate() {
		return depositDate;
	}
	public void setDepositDate(String depositDate) {
		this.depositDate = depositDate;
	}
	public void setConfirmDate(String confirmDate) {
		this.confirmDate = confirmDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public char getIsDel() {
		return isDel;
	}
	public void setIsDel(char isDel) {
		this.isDel = isDel;
	}
	public String getMainTitle() {
		return mainTitle;
	}
	public String getInvoice() {
		return invoice;
	}
	public void setInvoice(String invoice) {
		this.invoice = invoice;
	}
	@Override
	public String toString() {
		return "PurchaseDto [num=" + num + ", userId=" + userId + ", deposit=" + deposit + ", depositDate="
				+ depositDate + ", isPoint=" + isPoint + ", isCoupon=" + isCoupon + ", situation=" + situation
				+ ", isConfirm=" + isConfirm + ", confirmDate=" + confirmDate + ", price=" + price + ", discountPrice="
				+ discountPrice + ", deliveryPrice=" + deliveryPrice + ", usePoint=" + usePoint + ", orderDate="
				+ orderDate + ", isDel=" + isDel + ", mainTitle=" + mainTitle + ", invoice=" + invoice + "]";
	}
	public void setMainTitle(String mainTitle) {
		this.mainTitle = mainTitle;
	}
	
	public int getPricePoint() {
		return (price - usePoint) / 100;
	}
	
	public String getStringPrice() {
		return String.format("%,d", price);
	}
}
