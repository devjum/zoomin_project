package com.zoomin.www.review.service;

import java.util.List;

import com.zoomin.www.dto.ReviewDTO;

public interface ReviewService {

	public List<ReviewDTO> talentReview(int no) throws Exception;
	public void reviewWrtie(ReviewDTO dto) throws Exception;
	public int reviewExist(int no) throws Exception;
}
