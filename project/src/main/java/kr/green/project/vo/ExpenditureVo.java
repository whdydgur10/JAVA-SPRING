package kr.green.project.vo;

public class ExpenditureVo {

	private String date;
	private int labor;
	private int pr;
	private int operating;
	private int cost;
	private int expend;
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getLabor() {
		return labor;
	}
	public void setLabor(int labor) {
		this.labor = labor;
	}
	public int getPr() {
		return pr;
	}
	public void setPr(int pr) {
		this.pr = pr;
	}
	public int getOperating() {
		return operating;
	}
	public void setOperating(int operating) {
		this.operating = operating;
	}
	public int getExpend() {
		return expend;
	}
	public void setExpend(int expend) {
		this.expend = expend;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	@Override
	public String toString() {
		return "ExpenditureVo [date=" + date + ", labor=" + labor + ", pr=" + pr + ", operating=" + operating
				+ ", cost=" + cost + ", expend=" + expend + "]";
	}
	
	public String getStringDate() {
		String[] tmp = date.split("-");
		
		return tmp[0]+"년 "+tmp[1]+"월";
	}
	
	public String getStringLabor() {
		return String.format("%,d", labor);
	}
	
	public String getStringPr() {
		return String.format("%,d", pr);
	}
	
	public String getStringOperating() {
		return String.format("%,d", operating);
	}
	
	public String getStringCost() {
		return String.format("%,d", cost);
	}
	
	public String getStringExpend() {
		return String.format("%,d", expend);
	}
	
}
