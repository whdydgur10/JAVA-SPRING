package kr.green.project.vo;

public class ReviewVo {

	private int num;
	private String userId;
	private String title;
	private String content;
	private int grade;
	private int listNum;
//	후기번호 / 회원아이디 / 제목 / 내용 / 별점 / 구매내역
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	@Override
	public String toString() {
		return "ReviewVo [num=" + num + ", userId=" + userId + ", title=" + title + ", content=" + content + ", grade="
				+ grade + ", listNum=" + listNum + "]";
	}
	
}
