package kr.green.project.vo;

public class AddressVo {

	private int num;
	private String userId;
	private char isMain;
	private String code;
	private String address;
	private String detail;
//	주소지 번호 / 주소내용 / 회원아이디 / 기본배송지 설정
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public char getIsMain() {
		return isMain;
	}
	public void setIsMain(char c) {
		this.isMain = c;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	@Override
	public String toString() {
		return "AddressVo [num=" + num + ", userId=" + userId + ", isMain=" + isMain + ", code=" + code + ", address="
				+ address + ", detail=" + detail + "]";
	}
	
}
