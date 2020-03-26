package org.kdb.lostcity.dao;

import org.apache.ibatis.session.SqlSession;
import org.kdb.lostcity.vo.Like;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikesDAOImpl implements LikesDAO {
	@Autowired
	private SqlSession session;
	
	@Override
	public int deleteALL(Like info) {
		// TODO Auto-generated method stub
		return session.delete("likes.deleteALL", info);
	}
	
	@Override
	public int delete(Like info) {
		// TODO Auto-generated method stub
		return session.delete("likes.delete", info);
	}
	@Override
	public int insert(Like info) {
		// TODO Auto-generated method stub
		return session.insert("likes.insert", info);
	}
	@Override
	public int selectAmount(Like info) {
		// TODO Auto-generated method stub
		return session.selectOne("likes.selectAmount", info);
	}
	@Override
	public Like selectBeing(Like info) {
		// TODO Auto-generated method stub
		return session.selectOne("likes.selectBeing", info);
	}
	
}
