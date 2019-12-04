package org.kdb.lostcity.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kdb.lostcity.vo.Comment;
import org.kdb.lostcity.vo.PageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentsDAOImpl implements CommentsDAO {
	@Autowired
	private SqlSession session;
	
	@Override
	public int selectAmountByUser(int explorerNo) {
		// TODO Auto-generated method stub
		return session.selectOne("comments.selectAmountByUser", explorerNo);
	}
	
	@Override
	public int selectPageByUser(Comment info) {
		// TODO Auto-generated method stub
		return session.selectOne("comments.selectPageByUser", info);
	}
	
	@Override
	public List<Comment> selectListByUser(int explorerNo) {
		// TODO Auto-generated method stub
		return session.selectList("comments.selectListByUser", explorerNo);
	}
	
	@Override
	public int deleteALL(int postNo) {
		// TODO Auto-generated method stub
		return session.delete("comments.deleteALL", postNo);
	}
	 @Override
	public Comment selectOne(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("comments.selectOne", no);
	}
	@Override
	public int delete(int no) {
		// TODO Auto-generated method stub
		return session.delete("comments.delete", no);
	}
	@Override
	public int insert(Comment info){
		// TODO Auto-generated method stub
		return session.insert("comments.insert", info);
	}@Override
	public List<Comment> selectList(PageVO page) {
		// TODO Auto-generated method stub
		return session.selectList("comments.selectList", page);
	}
	@Override
	public int selectAmount(int postNo) {
		// TODO Auto-generated method stub
		return session.selectOne("comments.selectAmount", postNo);
	}
	
}
