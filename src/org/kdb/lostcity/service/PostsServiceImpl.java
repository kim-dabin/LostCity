package org.kdb.lostcity.service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.kdb.lostcity.dao.PostsDAO;
import org.kdb.lostcity.util.PaginateUtil;
import org.kdb.lostcity.vo.PageVO;
import org.kdb.lostcity.vo.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PostsServiceImpl implements PostsService {
	@Autowired
	private PostsDAO postsDAO;
	@Autowired
	private PaginateUtil paginateUtil;
	

	
	@Override
	public Post getPost(int no) {
		// TODO Auto-generated method stub
		return postsDAO.selectOne(no);
	}
	
	
	
	@Override
	public Map<String, Object> getPosts(int page, String categoryType, String sortingType, String text, String searchOpt) {
		
		int numPage = 10;//각 인덱스당 출력되는 post 개수 
		int numBlock = 5;//출력될 페이지 인덱스 개수
		//DB에 넣을 parameter data
		Map<String, Object> dataMap = new ConcurrentHashMap<String, Object>();
		System.out.println("service page "+page);
		//view에 보여줄 result data
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		PageVO pageVO = new PageVO(page, numPage);
		
		dataMap.put("start", pageVO.getStart());
		dataMap.put("end", pageVO.getEnd());
		
		dataMap.put("categoryType", categoryType);
		dataMap.put("sortingType", sortingType);
	//	System.out.println("categoryType Service out "+categoryType);
		if(text!=null&&searchOpt!=null&&text.length()>0&&searchOpt.length()>0) {
			System.out.println("categoryType Service "+categoryType);
			dataMap.put("text", "%"+text+"%");
			dataMap.put("searchOpt", searchOpt);
		}
		
		//System.out.println("service: "+dataMap.get("categoryType"));
		
		map.put("posts", postsDAO.selectList(dataMap));
		
		
		
		
		//총 게시물 수 
		int total = postsDAO.selectTotal(dataMap);
		System.out.println("total"+total);
		map.put("paginate", paginateUtil.getPaginate(page, total, numPage, numBlock, "/community/categoryType/"+categoryType+"/sortingType/"+sortingType));
		
		
		return map;
	}
}
