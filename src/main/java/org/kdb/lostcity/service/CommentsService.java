package org.kdb.lostcity.service;

import java.util.List;
import java.util.Map;

import org.kdb.lostcity.vo.Comment;


public interface CommentsService {
	public Map<String, Object> register(Comment info);
	public int delete(int no, int postNo);
	public Comment getComment(int no);
	public List<Comment> getList(int postNo, int page);
}
