package kr.green.project.vo;

public class ReviewfileVo {

	private int num;
	private String image;
	private int reviewNum;
//	첨부파일번호 / 내용 / 리뷰글번호
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	@Override
	public String toString() {
		return "ReviewfileVo [num=" + num + ", image=" + image + ", reviewNum=" + reviewNum + "]";
	}
	
}
