package org.kdb.lostcity.service;

import org.kdb.lostcity.dao.LikesDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class LikesServiceImpl implements LikesService {
	@Autowired
	private LikesDAO likesDAO;
	
}
