package kr.green.project.vo;

public class ContentsizetextVo {

	private int contentSizeTextNum;
	private String contentSizeText;
	private int enrollmentNum;
	public int getContentSizeTextNum() {
		return contentSizeTextNum;
	}
	public void setContentSizeTextNum(int contentSizeTextNum) {
		this.contentSizeTextNum = contentSizeTextNum;
	}
	public String getContentSizeText() {
		return contentSizeText;
	}
	public void setContentSizeText(String contentSizeText) {
		this.contentSizeText = contentSizeText;
	}
	public int getEnrollmentNum() {
		return enrollmentNum;
	}
	public void setEnrollmentNum(int enrollmentNum) {
		this.enrollmentNum = enrollmentNum;
	}
	@Override
	public String toString() {
		return "contentSizeTextVo [contentSizeTextNum=" + contentSizeTextNum + ", contentSizeText=" + contentSizeText
				+ ", enrollmentNum=" + enrollmentNum + "]";
	}
	
}
