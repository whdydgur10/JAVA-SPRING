package kr.green.project.vo;

public class enrollmentContentVo {

	private int contentNum;
	private String content;
	private int sequence;
	private int enrollmentNum;
	public int getContentNum() {
		return contentNum;
	}
	public void setContentNum(int contentNum) {
		this.contentNum = contentNum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getSequence() {
		return sequence;
	}
	public void setSequence(int sequence) {
		this.sequence = sequence;
	}
	public int getEnrollmentNum() {
		return enrollmentNum;
	}
	public void setEnrollmentNum(int enrollmentNum) {
		this.enrollmentNum = enrollmentNum;
	}
	@Override
	public String toString() {
		return "enrollmentContentVo [contentNum=" + contentNum + ", content=" + content + ", sequence=" + sequence
				+ ", enrollmentNum=" + enrollmentNum + "]";
	}
}
