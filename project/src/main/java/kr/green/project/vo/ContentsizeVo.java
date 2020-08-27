package kr.green.project.vo;

public class ContentsizeVo {

	private int contentSizeNum;
	private String contentSize;
	private String contentLength;
	private String contentShoulder;
	private String contentChest;
	private String contentSleeve;
	private int enrollmentNum;
	public int getContentSizeNum() {
		return contentSizeNum;
	}
	public void setContentSizeNum(int contentSizeNum) {
		this.contentSizeNum = contentSizeNum;
	}
	public String getContentSize() {
		return contentSize;
	}
	public void setContentSize(String contentSize) {
		this.contentSize = contentSize;
	}
	public String getContentLength() {
		return contentLength;
	}
	public void setContentLength(String contentLength) {
		this.contentLength = contentLength;
	}
	public String getContentShoulder() {
		return contentShoulder;
	}
	public void setContentShoulder(String contentShoulder) {
		this.contentShoulder = contentShoulder;
	}
	public String getContentChest() {
		return contentChest;
	}
	public void setContentChest(String contentChest) {
		this.contentChest = contentChest;
	}
	public String getContentSleeve() {
		return contentSleeve;
	}
	public void setContentSleeve(String contentSleeve) {
		this.contentSleeve = contentSleeve;
	}
	public int getEnrollmentNum() {
		return enrollmentNum;
	}
	public void setEnrollmentNum(int enrollmentNum) {
		this.enrollmentNum = enrollmentNum;
	}
	@Override
	public String toString() {
		return "contentSize [contentSizeNum=" + contentSizeNum + ", contentSize=" + contentSize + ", contentLength="
				+ contentLength + ", contentShoulder=" + contentShoulder + ", contentChest=" + contentChest
				+ ", contentSleeve=" + contentSleeve + ", enrollmentNum=" + enrollmentNum + "]";
	}
	
}
