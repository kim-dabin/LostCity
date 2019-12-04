package org.kdb.lostcity.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.kdb.lostcity.dao.CommentsDAO;
import org.kdb.lostcity.dao.ExplorersDAO;
import org.kdb.lostcity.dao.PostsDAO;
import org.kdb.lostcity.util.EloRatingUtil;
import org.kdb.lostcity.util.PaginateUtil;
import org.kdb.lostcity.vo.PageVO;
import org.kdb.lostcity.vo.Post;
import org.kdb.lostcity.vo.StatisticVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PostsServiceImpl implements PostsService {
	@Autowired
	private PostsDAO postsDAO;
	@Autowired
	private CommentsDAO commentsDAO;
	@Autowired 
	private ExplorersDAO explorersDAO;

	@Autowired
	private PaginateUtil paginateUtil;
	@Autowired
	private EloRatingUtil eru;
	
	
	@Override
	public List<Post> getPostsByExplorer(int explorerNo) {
		
		return postsDAO.selectListByUser(explorerNo);
	}
	
	@Override
	@Transactional
	public int getPosting(Post post) {
		
		if(postsDAO.insert(post)>0) {
			
		 return	postsDAO.selectLastInsertID();
			
		}
		
		return -1;
	}

	@Override
	public Map<String, Post> getOrderPosts(Post info) {
		Map<String, Post> map = new ConcurrentHashMap<String, Post>();
		
		int no = info.getNo();
//		for(Post p : postsDAO.selectOrder(info)) {
//			System.out.println(p.getNo());
//				map.put(p.getNo()>no?"next":"prev", p);
//			
//			}
//		
		return map;
	}
	
	@Override
	@Transactional
	public boolean delete(int no) {
		if(commentsDAO.selectAmount(no)>0) {
			commentsDAO.deleteALL(no);
		}
		if(postsDAO.delete(no)>0) { return true;}
		return false;
	}
	
	@Override
	@Transactional
	public  Map<String, Object> getPost(int no, String categoryType) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		Map<String, Object> orderMap = new ConcurrentHashMap<String, Object>();
		Post orderPost = new Post(); // 이전글, 다음글 
		Post postInfo = postsDAO.selectOne(no);
		StatisticVO stat = explorersDAO.selectStatistics();
	
		int tier = eru.getTier(postInfo.getScore(), stat.getAvg(), stat.getStd() );
//		System.out.println(tier);
		map.put("tier", tier);
		map.put("posting", postInfo);
		map.put("type", categoryType);
		orderMap.put("no", no);
		
		orderMap.put("categoryType", categoryType);
//		orderPost.setNo(no);
//		orderPost.setCategoryType(categoryType);
		List<Post> orderPosts = postsDAO.selectOrder(orderMap);
		
		for(Post p : orderPosts ) {
			System.out.println(p.getCategoryType());
			System.out.println(p.getNo());
				map.put(p.getNo()>no?"next":"prev", p);
			
			}
	
		
		return map;
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
