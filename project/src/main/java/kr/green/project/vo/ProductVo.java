package kr.green.project.vo;

public class ProductVo {

	private String code;
	private String name;
	private int price;
	private String gender;
	private int discount;
	private int enrollNum;
//	제품코드 / 이름 / 가격 / 성별 / 할인금액 / 등록글
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getEnrollNum() {
		return enrollNum;
	}
	public void setEnrollNum(int enrollNum) {
		this.enrollNum = enrollNum;
	}
	@Override
	public String toString() {
		return "ProductVo [code=" + code + ", name=" + name + ", price=" + price + ", gender=" + gender + ", discount="
				+ discount + ", enrollNum=" + enrollNum + "]";
	}
	
}
