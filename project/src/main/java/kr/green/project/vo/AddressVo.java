package kr.green.project.vo;

public class AddressVo {

	private int num;
	private String address;
	private String userId;
	private String isMain;
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
	public String getIsMain() {
		return isMain;
	}
	public void setIsMain(String isMain) {
		this.isMain = isMain;
	}
	@Override
	public String toString() {
		return "AddressVo [num=" + num + ", address=" + address + ", userId=" + userId + ", isMain=" + isMain + "]";
	}
	
}
