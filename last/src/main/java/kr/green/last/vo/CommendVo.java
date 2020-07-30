package kr.green.last.vo;

public class CommendVo {

	private int num;
	private int boardNum;
	private String userId;
	private int type;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "CommendVo [num=" + num + ", boardNum=" + boardNum + ", UserId=" + userId + ", type=" + type + "]";
	}
}
