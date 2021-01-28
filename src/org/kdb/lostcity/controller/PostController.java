package org.kdb.lostcity.controller;

import java.util.List;

import org.apache.log4j.ConsoleAppender;
import org.apache.log4j.Logger;
import org.kdb.lostcity.service.PostsService;
import org.kdb.lostcity.vo.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PostController {
	
	@Autowired
	private PostsService postsService;
	
	private  Logger log = Logger.getLogger(this.getClass());
	
	
	public void setPostsService(PostsService postsService) {
		this.postsService = postsService;
	}
	
	@RequestMapping(value="/community/{no}")
	public String detailPost(@PathVariable int page) {
		return "posting";
	}
	
	@RequestMapping(value="/community", method=RequestMethod.GET)
	public void communityView() {	
		
	}
	
	@RequestMapping(value="/community/categoryType/{categoryType}/sortingType/{sortingType}/page/{page}", method=RequestMethod.GET)
	public String communityView(Model model,@PathVariable int page, @PathVariable String categoryType, @PathVariable String sortingType) {
		
		model.addAllAttributes(postsService.getPosts(page, categoryType, sortingType, "", ""));
		
		return "community";
	}
	
	
}
