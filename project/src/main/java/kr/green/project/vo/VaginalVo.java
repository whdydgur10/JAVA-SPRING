package kr.green.project.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class VaginalVo {

	private int num;
	private String title;
	private Date registerDate;
	private char isAnswer;
	private char isSecret;
	private String userId;
	private int view;
	private int registerNum;
	private String content;
	public int getRegisterNum() {
		return registerNum;
	}
	public void setRegisterNum(int registerNum) {
		this.registerNum = registerNum;
	}
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
	public String getRegisterDate() {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String to = transFormat.format(registerDate);
		return to;
	}
	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	public void setRegisterDate(String date) {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			registerDate = transFormat.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "VaginalVo [num=" + num + ", title=" + title + ", registerDate=" + registerDate + ", isAnswer="
				+ isAnswer + ", isSecret=" + isSecret + ", userId=" + userId + ", view=" + view + ", registerNum="
				+ registerNum + ", content=" + content + "]";
	}
	
}
