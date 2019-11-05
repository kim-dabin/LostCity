package org.kdb.lostcity.controller;

import org.kdb.lostcity.service.ExplorersService;
import org.kdb.lostcity.service.RankingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RankingController {
	
	@Autowired
	ExplorersService explorersService;
	@Autowired
	RankingService rankingService;
	
	@RequestMapping(value="/ranking")
	public void ranking() {
		
	}
}
