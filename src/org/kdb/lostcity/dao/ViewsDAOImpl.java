package org.kdb.lostcity.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ViewsDAOImpl implements ViewsDAO {
	@Autowired
	private SqlSession session;
	
}
