package org.kdb.lostcity.dao;

import java.util.List;

import org.kdb.lostcity.vo.Explorer;


public interface ExplorersDAO {
	public List<Explorer> selectList();
	public Explorer selectLogin (Explorer user);
	public int selectId(String id);
	public int selectNickname(String nickname);
	public int insertUser(Explorer user);
}
