package org.kdb.lostcity.dao;

import java.util.List;

import org.kdb.lostcity.vo.Like;

public interface LikesDAO {
	public Like selectBeing(Like info);
	public int selectAmount(Like info);
	public int delete(Like info);
	public int insert(Like info);
	
}
