package org.kdb.lostcity.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.kdb.lostcity.dao.CommentsDAO;
import org.kdb.lostcity.dao.LikesDAO;
import org.kdb.lostcity.vo.Comment;
import org.kdb.lostcity.vo.Like;
import org.kdb.lostcity.vo.PageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CommentsServiceImpl implements CommentsService {
	@Autowired
	private CommentsDAO commentsDAO;
	@Autowired
	private LikesDAO likesDAO;
	
	
	
	@Override
	public int getPageByExplorer(Comment info) {
		// TODO Auto-generated method stub
		return commentsDAO.selectPageByUser(info);
	}
	
	@Override
	public List<Comment> getListByExplorer(int explorerNo) {

		return commentsDAO.selectListByUser(explorerNo);
	}
	
	@Override
	public Comment getComment(int no) {
		// TODO Auto-generated method stub
		return commentsDAO.selectOne(no);
	}
	
	@Override
	@Transactional
	public int delete(int no, int mountNo, String type) {
		// TODO Auto-generated method stub
		int result =0;
		
		if(commentsDAO.delete(no)>0) {
			
			if(type.equals("post")) {
			result=commentsDAO.selectAmount(mountNo);
			}else if(type.equals("comment")) {
				result=commentsDAO.selectAmountByUser(mountNo);
			}
		}
		
		return result;
	}
	
	@Override
	@Transactional
	public List<Comment> getList(int postNo, int page) {
		// TODO Auto-generated method stub
		int numPage = 5;
		Like likeInfo = new Like();
		PageVO pageVO = new PageVO();
		pageVO.setEnd(numPage*page);
		pageVO.setNo(postNo);
		pageVO.setStart(1);
		List<Comment> comments = commentsDAO.selectList(pageVO);
	
		
		for(Comment comment: comments) {
			likeInfo.setContentType("C");
			likeInfo.setContentNo(comment.getNo());
			comment.setCountLikes(likesDAO.selectAmount(likeInfo));
		}
		
		return comments;
	}
	@Override
	@Transactional
	public Map<String, Object> register(Comment info) {//댓글 등록 
		// TODO Auto-generated method stub
		int result =0;
		Comment comment = new Comment();
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
 		if(commentsDAO.insert(info)>0) {
 			result = commentsDAO.selectAmount(info.getPostNo());
 			comment = commentsDAO.selectOne(info.getNo());
 		}
		
		
 		map.put("amount", result);
 		map.put("comment", comment);
		
		return map;
	}
}