package org.kdb.lostcity.service;

import java.util.List;

import org.kdb.lostcity.vo.Explorer;


public interface ExplorersService {
	public Explorer login(Explorer user);
	public List<Explorer> getList();
	public Explorer getUser(int no);
	public boolean checkId(String email);
	public boolean checkNickname(String nickname);
	public boolean register(Explorer user);
}
