package org.kdb.lostcity.dao;

import java.util.List;
import java.util.Map;


import org.kdb.lostcity.vo.Post;

public interface PostsDAO {
	public List<Post> selectList(Map<String,Object> map);
	public int selectTotal(Map<String,Object> map);
	public Post selectOne(int no);
	public int delete(int no);
	public List<Post> selectOrder(Map<String,Object> post);
	public int insert(Post post);
	public int selectLastInsertID();
	public List<Post> selectListByUser(int explorerNo);
	public int selectAmountByUser(int explorerNo);
	
}
