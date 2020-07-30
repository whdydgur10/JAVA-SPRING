package kr.green.last.vo;

public class FileVo {

	private int num;
	private int boardNum;
	private String name;
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
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "FileVo [num=" + num + ", boardNum=" + boardNum + ", name=" + name + "]";
	}
	public String getOrifile() {
		int index = name.indexOf("_");
		return name.substring(index + 1);
	}
}
