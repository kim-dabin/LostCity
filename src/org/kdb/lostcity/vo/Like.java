package org.kdb.lostcity.vo;

import java.io.Serializable;
import java.sql.Timestamp;

public class Like implements Serializable {
	private int no, explorerNo, contentNo;
	private String contentType;
	private Timestamp regdate;
	
	public Like() {
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

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
}
