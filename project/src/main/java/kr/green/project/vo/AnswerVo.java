package kr.green.project.vo;

import java.util.Date;

public class AnswerVo {

	private int num;
	private String userId;
	private int vaginalNum;
	private String content;
	private Date answerDate;
//	답변 번호/ 작성자는 관리자만 / 답변단 질의글 번호 / 내용 / 답변날짜
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
	public int getVaginalNum() {
		return vaginalNum;
	}
	public void setVaginalNum(int vaginalNum) {
		this.vaginalNum = vaginalNum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getAnswerDate() {
		return answerDate;
	}
	public void setAnswerDate(Date answerDate) {
		this.answerDate = answerDate;
	}
	@Override
	public String toString() {
		return "Answer [num=" + num + ", userId=" + userId + ", vaginalNum=" + vaginalNum + ", content=" + content
				+ ", answerDate=" + answerDate + "]";
	}
	
}
