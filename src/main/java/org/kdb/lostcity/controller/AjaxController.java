package org.kdb.lostcity.controller;

import java.io.File;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.kdb.lostcity.service.ExplorersService;
import org.kdb.lostcity.service.PostsService;
import org.kdb.lostcity.util.FileRenameUtil;
import org.kdb.lostcity.util.ResizeImageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/ajax")
public class AjaxController {
	
	@Autowired
	private ExplorersService explorersService;
	@Autowired
	private ResizeImageUtil imageUtil;
	@Autowired
	private FileRenameUtil fileRenameUtil;
	@Autowired
	private PostsService postsService;
	
	
	
	@RequestMapping(value="/user/upload",method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	public String uploadImage(HttpServletRequest request, MultipartFile uploadImg, String type) {
		//절대 경로 구하기 위한 
		 ServletContext sc = request.getServletContext();
		 
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
	
	@RequestMapping(value="/post/categoryType/{categoryType}/sortingType/{sortingType}/page/{page}", method=RequestMethod.GET)
	public Map<String, Object> communityView(@PathVariable int page, @PathVariable String categoryType, @PathVariable String sortingType) {
//		System.out.println("Ajaxcontroller:"+categoryType);
		return postsService.getPosts(page, categoryType, sortingType, "", "");
	}


}
