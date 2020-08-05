package kr.green.project.vo;

public class LevelVo {

	private int num;
	private String userId;
	private int level;
//	레벨번호 / 회원아이디 / 레벨
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
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	@Override
	public String toString() {
		return "LevelVo [num=" + num + ", userId=" + userId + ", level=" + level + "]";
	}
	
}
