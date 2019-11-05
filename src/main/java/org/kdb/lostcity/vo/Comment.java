package org.kdb.lostcity.vo;

import java.io.Serializable;
import java.sql.Timestamp;

public class Comment implements Serializable {
	private int no, explorerNo, postNo, countLikes;
	private String content, profile, nickname;
	private Timestamp regdate;
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}
	
	public void setCountLikes(int countLikes) {
		this.countLikes = countLikes;
	}
	public int getCountLikes() {
		return countLikes;
	}
	public String getNickname() {
		return nickname;
	}
	public String getProfile() {
		return profile;
	}
	
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getExplorerNo() {
		return explorerNo;
	}

	public void setExplorerNo(int explorerNo) {
		this.explorerNo = explorerNo;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	

}
