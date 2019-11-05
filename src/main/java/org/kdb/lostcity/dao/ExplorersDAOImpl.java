package org.kdb.lostcity.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kdb.lostcity.vo.Explorer;
import org.kdb.lostcity.vo.StatisticVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExplorersDAOImpl implements ExplorersDAO {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public StatisticVO selectStatistics() {
		// TODO Auto-generated method stub
		return session.selectOne("explorers.selectStatistics");
	}
	@Override
	public int insertUser(Explorer user) {
		// TODO Auto-generated method stub
		return session.insert("explorers.insertUser", user);
	}
	@Override
	public Explorer selectLogin(Explorer user) {
		// TODO Auto-generated method stub
		return session.selectOne("explorers.selectLogin", user);
	}
	
	@Override
	public Explorer selectUser(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("explorers.selectList", no);
	}
	
	@Override
	public List<Explorer> selectList() {
		// TODO Auto-generated method stub
		return session.selectList("explorers.selectList");
	}
	
	@Override
	public int selectId(String id) {
		// TODO Auto-generated method stub
		return session.selectOne("explorers.selectId", id);
	}
	@Override
	public int selectNickname(String nickname) {
		// TODO Auto-generated method stub
		return session.selectOne("explorers.selectNickname", nickname);
	}
}
