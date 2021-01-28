package org.kdb.lostcity.util;

import java.text.NumberFormat;

import org.apache.commons.math3.distribution.NormalDistribution;
import org.springframework.stereotype.Component;
@Component
public class EloRatingUtil {
	private double interval[]= {0.0, 2.6, 19.76, 54.31, 83.3, 96.05, 99.86999999999999, 99.92999999999999, 99.97999999999999, 99.99999999999999, 100.00999999999999}; //티어 구간 
	
	public double getProb(double score, double mean, double sd) {
		double prob = 0.0;
		try {
			NormalDistribution normal = new NormalDistribution(mean, sd);
			NumberFormat nf = NumberFormat.getInstance();//지수 표현 제거
			nf.setGroupingUsed(false);

			String probString = nf.format(normal.cumulativeProbability(score)*100);//확률(백분율) 계산 
			prob = Double.parseDouble(probString);
		} catch (Exception e) {
			prob = 100.0;
		}
		
		
		return prob;
	}
	
	public int getTier(double score, double mean, double sd) {
		int tier=0;
		if(sd>0) {
		
		
		double prob = getProb(score,mean,sd);
		
		
		
		//티어 계산 
		for(int i=0; i<interval.length;i++) {
			if(prob>=interval[i] && prob <interval[i+1]) {
				if(i==0) {
					 tier = (i+1);
				}else {
					tier = (i);
				}				
			}//if end
		}//for end
		}else {
			tier=4;
		}
		return tier;
	
	}
	
	
}