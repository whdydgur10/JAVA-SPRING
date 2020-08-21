package kr.green.project.vo;

public class ContentremarkVO {

	private int contentRemarkNum;
	private String contentElasticity;
	private String contentLining;
	private String contentSeethrough;
	private String contentThickness;
	private String contentWeight;
	private String contentDry;
	private String contentRemarkText;
	private int enrollmentNum;
	public int getContentRemarkNum() {
		return contentRemarkNum;
	}
	public void setContentRemarkNum(int contentRemarkNum) {
		this.contentRemarkNum = contentRemarkNum;
	}
	public String getContentElasticity() {
		return contentElasticity;
	}
	public void setContentElasticity(String contentElasticity) {
		this.contentElasticity = contentElasticity;
	}
	public String getContentLining() {
		return contentLining;
	}
	public void setContentLining(String contentLining) {
		this.contentLining = contentLining;
	}
	public String getContentSeethrough() {
		return contentSeethrough;
	}
	public void setContentSeethrough(String contentSeethrough) {
		this.contentSeethrough = contentSeethrough;
	}
	public String getContentThickness() {
		return contentThickness;
	}
	public void setContentThickness(String contentThickness) {
		this.contentThickness = contentThickness;
	}
	public String getContentWeight() {
		return contentWeight;
	}
	public void setContentWeight(String contentWeight) {
		this.contentWeight = contentWeight;
	}
	public String getContentDry() {
		return contentDry;
	}
	public void setContentDry(String contentDry) {
		this.contentDry = contentDry;
	}
	public String getContentRemarkText() {
		return contentRemarkText;
	}
	public void setContentRemarkText(String contentRemarkText) {
		this.contentRemarkText = contentRemarkText;
	}
	public int getEnrollmentNum() {
		return enrollmentNum;
	}
	public void setEnrollmentNum(int enrollmentNum) {
		this.enrollmentNum = enrollmentNum;
	}
	@Override
	public String toString() {
		return "ContentremarkVO [contentRemarkNum=" + contentRemarkNum + ", contentElasticity=" + contentElasticity
				+ ", contentLining=" + contentLining + ", contentSeethrough=" + contentSeethrough
				+ ", contentThickness=" + contentThickness + ", contentWeight=" + contentWeight + ", contentDry="
				+ contentDry + ", contentRemarkText=" + contentRemarkText + ", enrollmentNum=" + enrollmentNum + "]";
	}
}
