package org.kdb.lostcity.vo;

import java.io.Serializable;
import java.sql.Timestamp;

public class Post  implements Serializable {
	private int no, explorerNo, countViews, countLikes, countComments, rowNum, total;
	private String title, content, categoryType,categoryTypeLabel, email, nickname, profile, categoryName,sortingType,text;
	private double score;
	private Timestamp regdate;

	public Post() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return " no: "+no+" explorerNo: "+explorerNo+" countViews: "+ countViews
				+ " countLikes: "+ countLikes+ " countComments: "+countComments+" title: "+ title+ " content: "+ content
				+" categoryType: "+ categoryType +" email: "+ email+" nickname: "+nickname+" profile: "+profile+" categoryName: "+categoryName
				+" score: "+score+" regdate: "+regdate;
	}
	
	
	public Post(int no, int explorerNo, int countViews, int countLikes, int countComments, String title, String content,
			String categoryType, String email, String nickname, String profile, String categoryName, String likeType,
			double score, Timestamp regdate) {
		super();
		this.no = no;
		this.explorerNo = explorerNo;
		this.countViews = countViews;
		this.countLikes = countLikes;
		this.countComments = countComments;
		this.title = title;
		this.content = content;
		this.categoryType = categoryType;
		this.email = email;
		this.nickname = nickname;
		this.profile = profile;
		this.categoryName = categoryName;
		this.score = score;
		this.regdate = regdate;
	}
	
	public int getRowNum() {
		return rowNum;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
	public int getTotal() {
		return total;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	
	public String getSortingType() {
		return sortingType;
	}
	
	public void setSortingType(String sortingType) {
		this.sortingType = sortingType;
	}

	public int getCountViews() {
		return countViews;
	}


	public void setCountViews(int countViews) {
		this.countViews = countViews;
	}


	public int getCountLikes() {
		return countLikes;
	}


	public void setCountLikes(int countLikes) {
		this.countLikes = countLikes;
	}


	public int getCountComments() {
		return countComments;
	}


	public void setCountComments(int countComments) {
		this.countComments = countComments;
	}


	


	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getExplorerNo() {
		return explorerNo;
	}

	public void setExplorerNo(int explorerNo) {
		this.explorerNo = explorerNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCategoryType() {
		return categoryType;
	}

	public void setCategoryType(String categoryType) {
		this.categoryType = categoryType;
		
		if(categoryType.equals("F")) {
			categoryName = "자유";
			categoryTypeLabel = "free";
		}else if(categoryType.equals("P")) {
			categoryName = "건의/오류";
			categoryTypeLabel = "suggestion";
		}else if(categoryType.equals("T")) {
			categoryName = "전략/팁";
			categoryTypeLabel = "tip";
		}else if(categoryType.equals("N"))  {
			categoryName = "공지";
			categoryTypeLabel = "notice";
		}
	}
	
	public String getCategoryTypeLabel() {
		return categoryTypeLabel;
	}
	
	public String getCategoryName() {
		return categoryName;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
}
