package org.kdb.lostcity.dao;

import java.util.List;

import org.kdb.lostcity.vo.Explorer;
import org.kdb.lostcity.vo.StatisticVO;


public interface ExplorersDAO {
	public List<Explorer> selectList();
	public Explorer selectLogin (Explorer user);
	public int selectId(String id);
	public int selectNickname(String nickname);
	public int insertUser(Explorer user);
	public StatisticVO selectStatistics();
	public Explorer selectUser(int no);
}