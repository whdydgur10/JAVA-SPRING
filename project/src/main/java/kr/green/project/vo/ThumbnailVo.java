package kr.green.project.vo;

public class ThumbnailVo {

	private int num;
	private int enrollNum;
	private String image;
//	썸네일번호 / 등록글 번호 / 이미지
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getEnrollNum() {
		return enrollNum;
	}
	public void setEnrollNum(int enrollNum) {
		this.enrollNum = enrollNum;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "ThumbnailVo [num=" + num + ", enrollNum=" + enrollNum + ", image=" + image + "]";
	}
	
}
