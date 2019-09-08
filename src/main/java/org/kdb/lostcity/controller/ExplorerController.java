package org.kdb.lostcity.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.kdb.lostcity.service.ExplorersService;
import org.kdb.lostcity.vo.Explorer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ExplorerController {
	
	@Autowired
	private ExplorersService explorersSerivce;
	
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String join(Explorer user) {
		explorersSerivce.register(user); 
		return "redirect:/joinBeforeAuth";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String joinForm() {
	
		return "joinForm";
	}

	@RequestMapping(value= {"/","/index"}, method = RequestMethod.GET)
	public String index(HttpSession session) {
		
		return "index";
	}
	
	@RequestMapping(value="/session", method = RequestMethod.POST)
	public String login(Explorer user, @RequestHeader String referer, HttpSession session, RedirectAttributes ra) {
		
//		System.out.println(user.getEmail());
		Explorer userCheck = explorersSerivce.login(user);
		 if(userCheck!=null) {
			 
			 session.setAttribute("logUser",userCheck);
			 return "redirect:/community";//임시로 커뮤니티로 이동 waitingRoom
		 }else {
			 ra.addFlashAttribute("msg", "등록된 이메일이 아닙니다.");
		 }
		
		return "redirect:"+referer;
	}
	

}
