package org.kdb.lostcity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WaitingController {
	
	@RequestMapping(value="/waiting", method=RequestMethod.GET)
	public String waitingPG() {
		return "waiting";
	}
}
