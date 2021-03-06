package kr.green.last.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardVo {

	private int num;
	private String title;
	private String writer;
	private String content;
	private Date registerDate;
	private char isDel;
	private Date delDate;
	private int views;
	private char modify;
	private int commend;
	private int deprecated;
	private int fileCnt;
	private Date modifyDate;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegisterDate() {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String to = transFormat.format(registerDate);
		return to;
	}
	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	public void setRegisterDate(String date) {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			registerDate = transFormat.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	public char getIsDel() {
		return isDel;
	}
	public void setIsDel(char isDel) {
		this.isDel = isDel;
	}
	public Date getDelDate() {
		return delDate;
	}
	public void setDelDate(Date delDate) {
		this.delDate = delDate;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public char getModify() {
		return modify;
	}
	public void setModify(char modify) {
		this.modify = modify;
	}
	public int getCommend() {
		return commend;
	}
	public void setCommend(int commend) {
		this.commend = commend;
	}
	public int getFileCnt() {
		return fileCnt;
	}
	public void setFileCnt(int fileCnt) {
		this.fileCnt = fileCnt;
	}
	public int getDeprecated() {
		return deprecated;
	}
	public void setDeprecated(int deprecated) {
		this.deprecated = deprecated;
	}
	public String getModifyDate() {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String to = transFormat.format(modifyDate);
		return to;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public void setModifyDate(String date) {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			modifyDate = transFormat.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	@Override
	public String toString() {
		return "BoardVo [num=" + num + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", registerDate=" + registerDate + ", isDel=" + isDel + ", delDate=" + delDate + ", views=" + views
				+ ", modify=" + modify + ", commend=" + commend + ", deprecated=" + deprecated + ", fileCnt=" + fileCnt
				+ ", modifyDate=" + modifyDate + "]";
	}
	
}
