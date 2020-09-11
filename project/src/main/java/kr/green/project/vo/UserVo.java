package kr.green.project.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UserVo {

	private String id;
	private String pw;
	private String name;
	private String phone;
	private String birthday;
	private String gender;
	private int auth;
	private String email;
	private int point;
	private String isDel;
	private Date isDelDate;
//	아이디 / 비밀번호 / 이름 / 연락처 / 생년월일 / 성별 / 권한 / 이메일 / 포인트  / 삭제여부 / 삭제기간
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAuth() {
		return auth;
	}
	public void setAuth(int auth) {
		this.auth = auth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getIsDel() {
		return isDel;
	}
	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}
	public String getIsDelDate() {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String to = transFormat.format(isDelDate);
		return to;
	}
	public void setIsDelDate(Date isDelDate) {
		this.isDelDate = isDelDate;
	}
	public void setIsDelDate(String date) {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			isDelDate = transFormat.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	@Override
	public String toString() {
		return "UserVo [id=" + id + ", pw=" + pw + ", name=" + name + ", phone=" + phone + ", birthday=" + birthday
				+ ", gender=" + gender + ", auth=" + auth + ", email=" + email + ", point=" + point + ", isDel=" + isDel
				+ ", isDelDate=" + isDelDate + "]";
	}
	
	public String getStringPoint() {
		return String.format("%,d", point);
	}
}
