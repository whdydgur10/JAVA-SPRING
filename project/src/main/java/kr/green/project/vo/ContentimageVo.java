package kr.green.project.vo;

public class ContentimageVo {

	private int contentImageNum;
	private String contentImage;
	private int enrollmentNum;
	public int getContentImageNum() {
		return contentImageNum;
	}
	public void setContentImageNum(int contentImageNum) {
		this.contentImageNum = contentImageNum;
	}
	public String getContentImage() {
		return contentImage;
	}
	public void setContentImage(String contentImage) {
		this.contentImage = contentImage;
	}
	public int getEnrollmentNum() {
		return enrollmentNum;
	}
	public void setEnrollmentNum(int enrollmentNum) {
		this.enrollmentNum = enrollmentNum;
	}
	@Override
	public String toString() {
		return "ContentimageVo [contentImageNum=" + contentImageNum + ", contentImage=" + contentImage
				+ ", enrollmentNum=" + enrollmentNum + "]";
	}
}
