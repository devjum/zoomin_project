package com.zoomin.www.review.dao;

import java.util.List;

import com.zoomin.www.dto.ReserveDTO;
import com.zoomin.www.dto.ReviewDTO;

public interface ReviewMapper {

	public List<ReviewDTO> talentReview(int no) throws Exception;
	public void reviewWrite(ReviewDTO dto) throws Exception;
	public int reviewExist(int no) throws Exception;
	public ReviewDTO getReview(int no) throws Exception;
}
