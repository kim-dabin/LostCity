package org.kdb.lostcity.service;

import java.util.List;

import org.kdb.lostcity.dao.ExplorersDAO;
import org.kdb.lostcity.util.EloRatingUtil;
import org.kdb.lostcity.vo.Explorer;
import org.kdb.lostcity.vo.StatisticVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ExplorersServiceImpl implements ExplorersService {
	@Autowired
	private ExplorersDAO explorersDAO;
	
	
	@Override
	public Explorer getUser(int no) {
		// TODO Auto-generated method stub
		
		Explorer user = explorersDAO.selectUser(no);
		return user;
	}
	@Override
	public boolean register(Explorer user) {
		// TODO Auto-generated method stub
		
		if(explorersDAO.insertUser(user)>0) return true; //join success
		return false;
	}
	
	@Override
	public Explorer login(Explorer user) {
		// TODO Auto-generated method stub
		return explorersDAO.selectLogin(user);
	}
	
	@Override
	public List<Explorer> getList() {
		// TODO Auto-generated method stub
		return explorersDAO.selectList();
	}
	
	@Override
	public boolean checkId(String email) {
		// TODO Auto-generated method stub
		if(explorersDAO.selectId(email)>0) return true;
		return false;
	}
	
	@Override
	public boolean checkNickname(String nickname) {
		// TODO Auto-generated method stub
		if(explorersDAO.selectNickname(nickname)>0) return true;
		return false;
	}
}
