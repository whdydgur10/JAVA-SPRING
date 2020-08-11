package kr.green.project.vo;

public class PointVo {

	private String level;
	private double point;
	private int needPrice;
//	레벨 / 적립율 / 조건금액
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
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
		return "PointVo [level=" + level + ", point=" + point + ", needPrice=" + needPrice + "]";
	}
	
	public String getStringNeedPrice() {
		return String.format("%,d", needPrice);
	}
	
}
