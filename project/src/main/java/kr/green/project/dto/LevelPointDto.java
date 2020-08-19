package kr.green.project.dto;

public class LevelPointDto {

	private int num;
	private String userId;
	private int level;
	private double point;
	private int needPrice;
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
	public double getPoint() {
		return point;
	}
	public void setPoint(double point) {
		this.point = point;
	}
	public int getNeedPrice() {
		return needPrice;
	}
	public void setNeedPrice(int needPrice) {
		this.needPrice = needPrice;
	}
	@Override
	public String toString() {
		return "LevelPointVo [num=" + num + ", userId=" + userId + ", level=" + level + ", point=" + point
				+ ", needPrice=" + needPrice + "]";
	}
	
	public int getIntPoint() {
		return Integer.parseInt(String.valueOf((int)Math.floor(point*100)));
	}

}
