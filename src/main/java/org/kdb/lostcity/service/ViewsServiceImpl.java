package org.kdb.lostcity.service;

import org.kdb.lostcity.dao.ViewsDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ViewsServiceImpl implements ViewsService {
	@Autowired
	private ViewsDAO viewsDAO;
	
}
