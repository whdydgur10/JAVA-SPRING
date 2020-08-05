package kr.green.project.vo;

public class VaginalfileVo {

	private int num;
	private String image;
	private int vaginalNum;
//	첨부파일번호 / 이미지 / 등록된 질의글
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
	public int getVaginalNum() {
		return vaginalNum;
	}
	public void setVaginalNum(int vaginalNum) {
		this.vaginalNum = vaginalNum;
	}
	@Override
	public String toString() {
		return "VaginalfileVo [num=" + num + ", image=" + image + ", vaginalNum=" + vaginalNum + "]";
	}
	
}
