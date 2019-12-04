package org.kdb.lostcity.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.kdb.lostcity.dao.CommentsDAO;
import org.kdb.lostcity.dao.ExplorersDAO;
import org.kdb.lostcity.dao.PostsDAO;
import org.kdb.lostcity.util.EloRatingUtil;
import org.kdb.lostcity.vo.Explorer;
import org.kdb.lostcity.vo.StatisticVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class ExplorersServiceImpl implements ExplorersService {
	@Autowired
	private ExplorersDAO explorersDAO;
	
	@Autowired
	private EloRatingUtil eru;
	@Autowired
	private CommentsDAO commentsDAO;
	@Autowired
	private PostsDAO postsDAO;
	
	
	@Override
	public StatisticVO getStat() {
		
		return explorersDAO.selectStatistics();
	}
	@Override
	public Map<String, Object>  getRanking() {
		
		List<Explorer> explorers = explorersDAO.selectList();
		Map<String, Object> map = new ConcurrentHashMap<>();
		StatisticVO stat = explorersDAO.selectStatistics();
		ArrayList<Double> scoreList = new ArrayList<>();
		ArrayList<Integer> num = new ArrayList<>();
		ArrayList<Double> prob = new ArrayList<>();
		int[] nums = new int[61];
		double[] percentage = new double[61];
		Arrays.fill(nums, 0);
		Arrays.fill(percentage, 0.0);
		for( Explorer user : explorers ) {
			scoreList.add(user.getScore());
		}
		int cnt=1;
		for(int i=0; i<scoreList.size();i++) {
			int check = (int) Math.ceil(scoreList.get(i));
			System.out.println(check);
			for(int j=0; j<=3000; j+=50) {
				int idx = j/50;
				if(j<=check&&j+50>check) {
					
					nums[idx]+=1;
					percentage[idx] = 100.0-eru.getProb(j, stat.getAvg(), stat.getStd());
					num.add(idx,nums[idx]);
					prob.add(idx, percentage[idx]);
					
				}else {
					num.add(idx,0);
					prob.add(idx, 0.0);
				}
			}
			
		}
		
		map.put("y", nums);
		map.put("percentage", percentage);
		ArrayList<String> json = new ArrayList<>();
		for(int i=0; i<nums.length;i++) {
			json.add("{\"y\":"+nums[i]+",\"percentage\":"+percentage[i]+"}");
		}
	

		
		
		
		return map;
	}
	
	
	@Override
	@Transactional
	public Map<String, Object> getUserData(int no) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		StatisticVO stat =  explorersDAO.selectStatistics();
		Explorer explorer = explorersDAO.selectUser(no);
		double score = explorer.getScore();
		double mean = stat.getAvg();
		double sd =  stat.getStd();
		
		int tier = eru.getTier(score, mean, sd);
		
		map.put("explorer", explorer);
		map.put("tier", tier);
		map.put("probability", eru.getProb(score, mean, sd));
		map.put("totalComments", commentsDAO.selectAmountByUser(no));
		map.put("totalPosts", postsDAO.selectAmountByUser(no));
		
		
		return map;
	}
	
	
	@Override
	public boolean register(Explorer user) {
		// TODO Auto-generated method stub
		
		if(explorersDAO.insertUser(user)>0) return true; //join success
		return false;
	}
	
	@Override
	public Explorer login(Explorer user) {
		// TODO Auto-generated method stub
		return explorersDAO.selectLogin(user);
	}
	
	@Override
	public List<Explorer> getList() {
		// TODO Auto-generated method stub
		return explorersDAO.selectList();
	}
	
	@Override
	public boolean checkId(String email) {
		// TODO Auto-generated method stub
		if(explorersDAO.selectId(email)>0) return true;
		return false;
	}
	
	@Override
	public boolean checkNickname(String nickname) {
		// TODO Auto-generated method stub
		if(explorersDAO.selectNickname(nickname)>0) return true;
		return false;
	}
}
