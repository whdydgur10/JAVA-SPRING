package kr.green.project.vo;

public class PointVo {

	private int level;
	private double point;
//	레벨 / 적립율
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
	@Override
	public String toString() {
		return "PointVo [level=" + level + ", point=" + point + "]";
	}
	
}
