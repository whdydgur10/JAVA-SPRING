package kr.green.project.vo;

public class OptionVo {

	private String code;
	private String size;
	private String color;
	private int amount;
	private int purchase;
	private String productCode;
//	옵션코드 / 사이즈 / 색상 / 재고량 / 구매량 / 제품코드
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
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
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPurchase() {
		return purchase;
	}
	public void setPurchase(int purchase) {
		this.purchase = purchase;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	@Override
	public String toString() {
		return "OptionVo [code=" + code + ", size=" + size + ", color=" + color + ", amount=" + amount + ", purchase="
				+ purchase + ", productCode=" + productCode + "]";
	}
	
}