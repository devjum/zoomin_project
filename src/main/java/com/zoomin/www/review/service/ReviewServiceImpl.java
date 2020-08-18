package com.zoomin.www.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zoomin.www.dto.ReviewDTO;
import com.zoomin.www.review.dao.ReviewDAO;
import com.zoomin.www.talent.dao.TalentDAO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAO dao;
	
	@Autowired
	private TalentDAO talentDao;

	@Override
	public List<ReviewDTO> talentReview(int no) throws Exception {
		return dao.talentReview(no);
	}

	@Override
	public void reviewWrtie(ReviewDTO dto) throws Exception {
		dao.reviewWrite(dto);
		talentDao.updateAvg(dto.getT_no());
	}

	@Override
	public int reviewExist(int no) throws Exception {
		return dao.reviewExist(no);
	}




	

	
	
}
