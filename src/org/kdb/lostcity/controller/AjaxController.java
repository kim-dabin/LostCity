package main.java.org.kdb.lostcity.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.kdb.lostcity.service.CommentsService;
import org.kdb.lostcity.service.ExplorersService;
import org.kdb.lostcity.service.LikesService;
import org.kdb.lostcity.service.PostsService;
import org.kdb.lostcity.service.RankingService;
import org.kdb.lostcity.util.FileRenameUtil;
import org.kdb.lostcity.util.ResizeImageUtil;
import org.kdb.lostcity.vo.Comment;
import org.kdb.lostcity.vo.Like;
import org.kdb.lostcity.vo.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/ajax")
public class AjaxController {
	
	@Autowired
	private ExplorersService explorersService;
	@Autowired
	private LikesService likesService;
	@Autowired
	private ResizeImageUtil imageUtil;
	@Autowired
	private FileRenameUtil fileRenameUtil;
	@Autowired
	private PostsService postsService;
	@Autowired
	private CommentsService commentsService;
	@Autowired
	private RankingService rankingService;
	
	
	@RequestMapping(value="/post/{postNo}/comment/{no}", method=RequestMethod.POST)
	public String getPageCommentByExplorer(@PathVariable int postNo,@PathVariable int no ) {
		Comment info = new Comment();
		info.setPostNo(postNo);
		info.setNo(no);
		int page = commentsService.getPageByExplorer(info);
		return "{\"commentPage\":"+page+"}";
	}
	
	@RequestMapping(value="/explorer/{explorerNo}/comments", method=RequestMethod.POST)
	public List<Comment> getCommentsByExplorer(@PathVariable int explorerNo){
		//System.out.println("explorerNo"+" "+explorerNo);
		return commentsService.getListByExplorer(explorerNo);
	}
	
	@RequestMapping(value="/explorer/{explorerNo}/posting", method=RequestMethod.POST)
	public List<Post> getPostsByExplorer(@PathVariable int explorerNo){
		//System.out.println("explorerNo"+" "+explorerNo);
		return postsService.getPostsByExplorer(explorerNo);
	}
	
	@RequestMapping(value="/community/orderPosts", method=RequestMethod.POST)
	public Map<String, Post> getOrderPosts(Post info){
		return postsService.getOrderPosts(info);
	}
	
	
	
	@RequestMapping(value="/rank/chart", method=RequestMethod.GET)
	public Map<String, Object> getRankData(){ 
		//Map<String, Object> map = rankingService.getRanking();
		
		//return "{\"y\":"+map.get("y").toString()+",\"percentage\":"+map.get("percentage").toString()+"}";
		//return map;
		return explorersService.getRanking();
	}
	
	@RequestMapping(value="/explorer/{explorerNo}/post/{no}", method=RequestMethod.DELETE)	
	public boolean deletePost(@PathVariable int explorerNo, @PathVariable int no ) {
			
		return postsService.delete(no);
	}
	
	@RequestMapping(value="/comment/{no}", method=RequestMethod.GET)
	public Comment getComment(@PathVariable int no) {
		return commentsService.getComment(no);
	}
	
	
	
	@RequestMapping(value="/post/{postNo}/comment/{no}", method=RequestMethod.DELETE)
	public int deleteComment(@PathVariable int no, @PathVariable int postNo) {
		return commentsService.delete(no, postNo, "post");
	}
	
	@RequestMapping(value="/explorer/{explorerNo}/comment/{no}", method=RequestMethod.DELETE)
	public int deleteCommentByExplorer(@PathVariable int no, @PathVariable int explorerNo) {
		return commentsService.delete(no, explorerNo,"comment");
	}
	
	@RequestMapping(value="/post/{postNo}/comment/page/{page}", method=RequestMethod.GET)
	public List<Comment>  getComments(@PathVariable int postNo, @PathVariable int page) {	
		return commentsService.getList(postNo, page);
	}
	@RequestMapping(value="/comment", method=RequestMethod.POST)
	public Map<String, Object> registerComment(Comment info) {
		return commentsService.register(info);
	}
	
	@RequestMapping(value="/user/upload",method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	public String uploadImage(HttpServletRequest request, MultipartFile uploadImg, String type) {
		//절대 경로 구하기 위한 
		 ServletContext sc = request.getSession().getServletContext();
		 
		 String uploadPath = sc.getRealPath("upload");
			String profilePath = sc.getRealPath("profile");
			
			System.out.println(uploadPath);
			
			System.out.println(uploadImg.getOriginalFilename());
			
			File file = new File(uploadPath+File.separator+uploadImg.getOriginalFilename()); 
			
			file = fileRenameUtil.rename(file);

			try {
				
				uploadImg.transferTo(file);
				
				switch(type) {
				case "P" : 
					   
					imageUtil.resize(file.getAbsolutePath(),profilePath+File.separator+file.getName(), 200);
					
					break;
				case "B" : 
					break;
				}//switch end
				
				return "{\"src\":\""+ file.getName()+"\"}";
				
			} catch (Exception e) {
				e.printStackTrace();
				
				return "에러";
			} 
		
	}
	
	@RequestMapping(value="/user/email",method=RequestMethod.GET )
	public boolean checkEmail(String email) {
		
//		System.out.println(email);
//		System.out.println(explorersService.checkId(email));
//		
		return explorersService.checkId(email);
	}
	
	@RequestMapping(value="user/nickname/{nickname}",method=RequestMethod.GET )
	public boolean checkNickname(@PathVariable String nickname) {
		
		
		return explorersService.checkNickname(nickname);
	}
	
	@RequestMapping(value="/search", method=RequestMethod.POST)
	public Map<String, Object> searchPost(HttpServletRequest request){
		
		
		String text = (String) request.getParameter("text");
		String categoryType = (String)request.getParameter("categoryType");
		String sortingType = (String) request.getParameter("sortingType");
		String searchOpt = (String)  request.getParameter("searchOpt");
		String pagestr = request.getParameter("page");
		int page = Integer.parseInt(pagestr);
		
		
		System.out.println("Controller text: "+ text);

		return postsService.getPosts(page, categoryType, sortingType, text, searchOpt);
	}
	
	//Like check 
	@RequestMapping(value="/checkLike", method=RequestMethod.POST)
	public Map<String, Object> beLike(Like likeInfo) {
		return likesService.beLike(likeInfo);
	}
	
	@RequestMapping(value="/cancelLike", method=RequestMethod.POST)
	public String cancleLike(Like info) {
		int result = likesService.cancleLike(info);
		return "{\"result\":"+result+"}";
	}
	
	@RequestMapping(value="/doLike", method=RequestMethod.POST)
	public String doLike(Like info) {
		int result = likesService.doLike(info);
		return "{\"result\":"+result+"}";
	}



}
