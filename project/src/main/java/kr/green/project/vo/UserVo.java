package kr.green.project.vo;

public class UserVo {

	private String id;
	private String pw;
	private String name;
	private String phone;
	private String birthday;
	private String gender;
	private String auth;
	private String email;
	private String point;
	private String coupon;
	private String isDel;
	private String isDelDate;
//	아이디 / 비밀번호 / 이름 / 연락처 / 생년월일 / 성별 / 권한 / 이메일 / 포인트 / 쿠폰 / 삭제여부 / 삭제기간
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
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	public String getCoupon() {
		return coupon;
	}
	public void setCoupon(String coupon) {
		this.coupon = coupon;
	}
	public String getIsDel() {
		return isDel;
	}
	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}
	public String getIsDelDate() {
		return isDelDate;
	}
	public void setIsDelDate(String isDelDate) {
		this.isDelDate = isDelDate;
	}
	@Override
	public String toString() {
		return "UserVo [id=" + id + ", pw=" + pw + ", name=" + name + ", phone=" + phone + ", birthday=" + birthday
				+ ", gender=" + gender + ", auth=" + auth + ", email=" + email + ", point=" + point + ", coupon="
				+ coupon + ", isDel=" + isDel + ", isDelDate=" + isDelDate + "]";
	}
	
}