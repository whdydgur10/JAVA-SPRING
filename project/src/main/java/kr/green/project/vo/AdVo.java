package kr.green.project.vo;

public class AdVo {

	private int num;
	private String title;
	private String content;
	private String image;
//	광고번호 / 제목 / 내용 / 이미지
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "adVo [num=" + num + ", title=" + title + ", content=" + content + ", image=" + image + "]";
	}
	
}
