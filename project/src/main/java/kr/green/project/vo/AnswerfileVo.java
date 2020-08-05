package kr.green.project.vo;

public class AnswerfileVo {

	private int num;
	private String image;
	private String answerNum;
//	파일 번호 / 파일 내용 / 첨부할 글번호
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
	public String getAnswerNum() {
		return answerNum;
	}
	public void setAnswerNum(String answerNum) {
		this.answerNum = answerNum;
	}
	@Override
	public String toString() {
		return "AnswerFileVo [num=" + num + ", image=" + image + ", answerNum=" + answerNum + "]";
	}
	
}
