package kr.green.project.subVo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UserVaginalVo {

	private int num;
	private String title;
	private Date registerDate;
	private char isSecret;
	private String userId;
	private int view;
	private String id;
	private String name;
	private String auth;
	private int registerNum;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public int getRegisterNum() {
		return registerNum;
	}
	public void setRegisterNum(int registerNum) {
		this.registerNum = registerNum;
	}
	@Override
	public String toString() {
		return "UserVaginalVo [num=" + num + ", title=" + title + ", registerDate=" + registerDate + ", isAnswer="
				+ isAnswer + ", isSecret=" + isSecret + ", userId=" + userId + ", view=" + view + ", id=" + id
				+ ", name=" + name + ", auth=" + auth + ", registerNum=" + registerNum + "]";
	}
}
