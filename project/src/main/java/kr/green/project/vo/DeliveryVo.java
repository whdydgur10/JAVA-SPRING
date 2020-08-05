package kr.green.project.vo;

public class DeliveryVo {

	private String name;
	private int purchaseNum;
	private String location;
	private int addressNum;
//	송장번호 / 구매번호 / 위치 / 주소번호
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPurchaseNum() {
		return purchaseNum;
	}
	public void setPurchaseNum(int purchaseNum) {
		this.purchaseNum = purchaseNum;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getAddressNum() {
		return addressNum;
	}
	public void setAddressNum(int addressNum) {
		this.addressNum = addressNum;
	}
	@Override
	public String toString() {
		return "DeliveryVo [name=" + name + ", purchaseNum=" + purchaseNum + ", location=" + location + ", addressNum="
				+ addressNum + "]";
	}
	
}
