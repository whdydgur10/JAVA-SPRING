package kr.green.project.dto;

import java.util.ArrayList;

public class ReviewPurchaseOptionDto {

	private int num;
	private String userId;
	private String title;
	private String content;
	private int grade;
	private int enrollNum;
	private String optionCode;
	private String size;
	private String color;
	private ArrayList<String> image;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getEnrollNum() {
		return enrollNum;
	}
	public void setEnrollNum(int enrollNum) {
		this.enrollNum = enrollNum;
	}
	public String getOptionCode() {
		return optionCode;
	}
	public void setOptionCode(String optionCode) {
		this.optionCode = optionCode;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public ArrayList<String> getImage() {
		return image;
	}
	public void setImage(ArrayList<String> image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "ReviewPurchaseOptionDto [num=" + num + ", userId=" + userId + ", title=" + title + ", content="
				+ content + ", grade=" + grade + ", enrollNum=" + enrollNum + ", optionCode=" + optionCode + ", size="
				+ size + ", color=" + color + ", image=" + image + "]";
	}
}
