package org.kdb.lostcity.dao;

import java.sql.SQLException;
import java.util.List;

import org.kdb.lostcity.vo.Comment;
import org.kdb.lostcity.vo.PageVO;

public interface CommentsDAO {
	public int insert(Comment info);
	public List<Comment> selectList (PageVO page);
	public int delete(int no);
	public int selectAmount(int postNo);
	public Comment selectOne(int no);
	public int deleteALL(int postNo);
	public List<Comment> selectListByUser(int explorerNo);
	public int selectPageByUser(Comment info);
	public int selectAmountByUser(int explorerNo);
}