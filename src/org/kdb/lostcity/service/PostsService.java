package org.kdb.lostcity.service;

import java.util.List;
import java.util.Map;

import org.kdb.lostcity.vo.Post;


public interface PostsService {
	
	public Map<String, Object> getPosts(int page, String categoryType, String sortingType, String text, String searchOpt);
	
	public Post getPost(int no);
}
