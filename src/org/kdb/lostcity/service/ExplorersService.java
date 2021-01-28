package org.kdb.lostcity.service;

import java.util.List;
import java.util.Map;

import org.kdb.lostcity.vo.Explorer;
import org.kdb.lostcity.vo.StatisticVO;


public interface ExplorersService {
	public Explorer login(Explorer user);
	public List<Explorer> getList();
	public Map<String, Object> getUserData(int no);
	public boolean checkId(String email);
	public boolean checkNickname(String nickname);
	public boolean register(Explorer user);
	public Map<String, Object> getRanking();
	public StatisticVO getStat();
}