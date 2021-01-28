package org.kdb.lostcity.service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.kdb.lostcity.dao.LikesDAO;
import org.kdb.lostcity.vo.Like;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
public class LikesServiceImpl implements LikesService {
	@Autowired
	private LikesDAO likesDAO;
	
	@Override
	@Transactional
	public Map<String, Object> beLike(Like info) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		if(likesDAO.selectBeing(info)!=null) {
			map.put("result", true);
		}else {
			map.put("result", false);
		}
		map.put("likes", likesDAO.selectAmount(info));
		return map;
	}
	@Override
	@Transactional
	public int cancleLike(Like info) {
		likesDAO.delete(info); //삭제 
		int likes =  likesDAO.selectAmount(info);
		return likes;
	}
	@Override
	@Transactional
	public int doLike(Like info) {
		likesDAO.insert(info);
		int likes = likesDAO.selectAmount(info);
		return likes;
		
	}
}