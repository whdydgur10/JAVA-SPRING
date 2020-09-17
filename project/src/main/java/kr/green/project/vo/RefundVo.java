package kr.green.project.vo;

public class RefundVo {

	private int refundNum;
	private int listNum;
	private String userId;
	private String bankName;
	private String refundName;
	private String account;
	private String status;
	private int price;
	private String reason;
	public int getRefundNum() {
		return refundNum;
	}
	public void setRefundNum(int refundNum) {
		this.refundNum = refundNum;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getRefundName() {
		return refundName;
	}
	public void setRefundName(String refundName) {
		this.refundName = refundName;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	@Override
	public String toString() {
		return "RefundVo [refundNum=" + refundNum + ", listNum=" + listNum + ", userId=" + userId + ", bankName="
				+ bankName + ", refundName=" + refundName + ", account=" + account + ", status=" + status + ", price="
				+ price + ", reason=" + reason + "]";
	}
}