package org.kdb.lostcity.service;

import java.util.ArrayList;
import java.util.Map;

import org.kdb.lostcity.vo.StatisticVO;

public interface RankingService {
	public Map<String, Object> getRanking();
	public StatisticVO getStat();
	//public ArrayList<String> getRanking();
	

}