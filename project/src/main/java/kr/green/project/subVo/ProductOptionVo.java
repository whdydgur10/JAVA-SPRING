package kr.green.project.subVo;

public class ProductOptionVo {

	private String code;
	private String name;
	private int price;
	private String gender;
	private String optionCode;
	private String size;
	private String color;
	private int amount;
	private int purchase;
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
	public String getOptionCode() {
		return optionCode;
	}
	public void setOptionCode(String optionCode) {
		this.optionCode = optionCode;
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
	@Override
	public String toString() {
		return "ProductOption [code=" + code + ", name=" + name + ", price=" + price + ", gender=" + gender
				+ ", optionCode=" + optionCode + ", size=" + size + ", color=" + color + ", amount=" + amount
				+ ", purchase=" + purchase + "]";
	}
}
