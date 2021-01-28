package org.kdb.lostcity.service;

import java.util.List;
import java.util.Map;

import org.kdb.lostcity.vo.Post;


public interface PostsService {
	
	public Map<String, Object> getPosts(int page, String categoryType, String sortingType, String text, String searchOpt);
	public Map<String, Object> getPost(int no, String categoryType);
	public boolean delete(int no);
	public int delete(int no, int explorerNo);
	public Map<String, Post> getOrderPosts(Post info);
	public int getPosting(Post post);
	public List<Post> getPostsByExplorer(int explorerNo);
	
	
}