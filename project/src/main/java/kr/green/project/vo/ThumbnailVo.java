package kr.green.project.vo;

public class ThumbnailVo {

	private int thumbnailNum;
	private int enrollNum;
	private String thumbnailImage;
//	썸네일번호 / 등록글 번호 / 이미지
	public int getThumbnailNum() {
		return thumbnailNum;
	}
	public void setThumbnailNum(int thumbnailNum) {
		this.thumbnailNum = thumbnailNum;
	}
	public int getEnrollNum() {
		return enrollNum;
	}
	public void setEnrollNum(int enrollNum) {
		this.enrollNum = enrollNum;
	}
	public String getThumbnailImage() {
		return thumbnailImage;
	}
	public void setThumbnailImage(String thumbnailImage) {
		this.thumbnailImage = thumbnailImage;
	}
	@Override
	public String toString() {
		return "ThumbnailVo [thumbnailNum=" + thumbnailNum + ", enrollNum=" + enrollNum + ", thumbnailImage=" + thumbnailImage + "]";
	}
	
}
