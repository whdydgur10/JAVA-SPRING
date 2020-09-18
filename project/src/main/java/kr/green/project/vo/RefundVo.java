package kr.green.project.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class RefundVo {

	private int refundNum;
	private int listNum;
	private String userId;
	private String bankName;
	private String refundName;
	private String account;
	private String stat;
	private int price;
	private String reason;
	private Date refundDate;
	private Date depositDate;
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
	public String getStat() {
		return stat;
	}
	public void setStat(String stat) {
		this.stat = stat;
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
	public Date getRefundDate() {
		return refundDate;
	}
	public void setRefundDate(Date refundDate) {
		this.refundDate = refundDate;
	}
	public String getDepositDate() {
		if(depositDate == null)
			return "";
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String to = transFormat.format(depositDate);
		return to;
	}
	public void setDepositDate(Date depositDate) {
		this.depositDate = depositDate;
	}
	public void setDepositDate(String date) {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			depositDate = transFormat.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	@Override
	public String toString() {
		return "RefundVo [refundNum=" + refundNum + ", listNum=" + listNum + ", userId=" + userId + ", bankName="
				+ bankName + ", refundName=" + refundName + ", account=" + account + ", stat=" + stat + ", price="
				+ price + ", reason=" + reason + ", refundDate=" + refundDate + ", depositDate=" + depositDate + "]";
	}
}
