package kr.green.project.vo;

public class ProductVo {

	private String code;
	private String name;
	private int price;
	private String gender;
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
	@Override
	public String toString() {
		return "ProductVo [code=" + code + ", name=" + name + ", price=" + price + ", gender=" + gender + "]";
	}
	
}
