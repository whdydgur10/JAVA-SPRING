package kr.green.project.vo;

import java.util.Date;

public class VaginalVo {

	private int num;
	private String title;
	private Date registerDate;
	private char isAnswer;
	private char isSecret;
	private String userId;
	private int view;
//	질의글번호 / 제목 / 작성일 / 답변여부 / 비밀글여부 / 회원아이디 / 조회수
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	public char getIsAnswer() {
		return isAnswer;
	}
	public void setIsAnswer(char isAnswer) {
		this.isAnswer = isAnswer;
	}
	public char getIsSecret() {
		return isSecret;
	}
	public void setIsSecret(char isSecret) {
		this.isSecret = isSecret;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	@Override
	public String toString() {
		return "VaginalVo [num=" + num + ", title=" + title + ", registerDate=" + registerDate + ", isAnswer="
				+ isAnswer + ", isSecret=" + isSecret + ", userId=" + userId + ", view=" + view + "]";
	}
	
}
