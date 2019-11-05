package org.kdb.lostcity.service;

import java.util.Map;

import org.kdb.lostcity.vo.Like;

public interface LikesService {
	public Map<String, Object> beLike(Like info);
	public int doLike(Like info);
	public int cancleLike(Like info);
}
