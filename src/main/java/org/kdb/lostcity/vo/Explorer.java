package org.kdb.lostcity.vo;

import java.io.Serializable;
import java.sql.Timestamp;

import org.kdb.lostcity.util.EloRatingUtil;

public class Explorer implements Serializable {
	private int no, ranking;//user no
	private String email, password, nickname, profile, checkEmail, keepLogin;
	private double score;
	private Timestamp regdate, checkEmailTime;
	
	public Explorer() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public void setRanking(int ranking) {
		this.ranking = ranking;
	}
	
	public int getRanking() {
		return ranking;
	}

	
	public void setCheckEmailTime(Timestamp checkEmailTime) {
		this.checkEmailTime = checkEmailTime;
	}
	
	public Timestamp getCheckEmailTime() {
		return checkEmailTime;
	}

	public String getKeepLogin() {
		return keepLogin;
	}

	public void setKeepLogin(String keepLogin) {
		this.keepLogin = keepLogin;
	}

	
	public double getScore() {
		return score;
	}
	
	public void setScore(double score) {
		this.score = score;
	}

	public String getProfile() {
		return profile;
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

	

	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getCheckEmail() {
		return checkEmail;
	}



	public void setCheckEmail(String checkEmail) {
		this.checkEmail = checkEmail;
	}



	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	

}