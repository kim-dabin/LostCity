package org.kdb.lostcity.vo;

import java.io.Serializable;

public class StatisticVO implements Serializable  {
	
	private Double avg, std; //평균, 표준편차 
	
	public StatisticVO() {
	// TODO Auto-generated constructor stub
	}
 
	public void setAvg(Double avg) {
		this.avg = avg;
	}
	public void setStd(Double std) {
		this.std = std;
	}
	
	public Double getAvg() {
		return avg;
	}
	
	public Double getStd() {
		return std;
	}
 
}
