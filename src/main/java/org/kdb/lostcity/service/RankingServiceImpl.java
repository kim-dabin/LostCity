package org.kdb.lostcity.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.kdb.lostcity.dao.ExplorersDAO;
import org.kdb.lostcity.util.EloRatingUtil;
import org.kdb.lostcity.vo.Explorer;
import org.kdb.lostcity.vo.StatisticVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RankingServiceImpl implements RankingService {
	@Autowired
	private ExplorersDAO explorersDAO;
	@Autowired
	private EloRatingUtil eru;
	

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
}