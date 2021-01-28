package org.kdb.lostcity.vo;

import java.io.Serializable;
import java.sql.Timestamp;

public class Report implements Serializable {
	private int no, explorerNo, contentNo;
	 //contentType: comment-> C, post -> P 
	//reason : ADULT, AD, PRIVATE_INFO, INFRINGEMENT
	private String contentType, reason;
	private Timestamp regdate;
	
	public Report() {
		// TODO Auto-generated constructor stub
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

	public int getContentNo() {
		return contentNo;
	}

	public void setContentNo(int contentNo) {
		this.contentNo = contentNo;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
}
