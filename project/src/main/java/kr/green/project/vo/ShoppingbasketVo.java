package kr.green.project.vo;

public class ShoppingbasketVo {

	private int num;
	private String userId;
	private int enrollNum;
//	장바구니번호 / 회원아이디 / 등록글 번호
	public int getNum() {
		return num;
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
	public int getEnrollNum() {
		return enrollNum;
	}
	public void setEnrollNum(int enrollNum) {
		this.enrollNum = enrollNum;
	}
	@Override
	public String toString() {
		return "ShoppingbasketVo [num=" + num + ", userId=" + userId + ", enrollNum=" + enrollNum + "]";
	}
	
}
