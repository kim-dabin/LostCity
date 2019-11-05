package org.kdb.lostcity.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.kdb.lostcity.vo.PageVO;
import org.kdb.lostcity.vo.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PostsDAOImpl implements PostsDAO {
	@Autowired
private SqlSession session;
	@Override
	public List<Post> selectOrder(Map<String,Object>  post) {
		// TODO Auto-generated method stub
		return session.selectList("posts.selectOrder", post);
	}
	
	@Override
	public int delete(int no) {
		// TODO Auto-generated method stub
		return session.delete("posts.delete", no);
	}
	@Override
		public List<Post> selectList(Map<String, Object> map) {
			// TODO Auto-generated method stub
			return session.selectList("posts.selectList", map);
		}
	
	@Override
		public int selectTotal(Map<String, Object> map) {
			// TODO Auto-generated method stub
			return session.selectOne("posts.selectTotal",map);
		}
	
	@Override
		public Post selectOne(int no) {
			// TODO Auto-generated method stub
			return session.selectOne("posts.selectOne", no);
		}
}
