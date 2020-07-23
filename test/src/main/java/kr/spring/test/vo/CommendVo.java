package kr.spring.test.vo;

public class CommendVo {

	private int num;
	private String id;
	private int boardNum;
	private int type;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "CommendVo [num=" + num + ", id=" + id + ", boardNum=" + boardNum + ", type=" + type + "]";
	}
	
	
}
