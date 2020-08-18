package com.zoomin.www.review.dao;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.zoomin.www.dto.ReserveDTO;
import com.zoomin.www.dto.ReviewDTO;

@Repository
public class ReviewDAO implements ReviewMapper {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.zoomin.www.reviewMapper";

	@Override
	public List<ReviewDTO> talentReview(int no) throws Exception {
		return sqlSession.selectList(NAMESPACE+".talentReview",no);
	}

	@Override
	public void reviewWrite(ReviewDTO dto) throws Exception {
		sqlSession.insert(NAMESPACE+".reviewWrite",dto);
	}

	@Override
	public int reviewExist(int no) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".reviewExist",no);
	}

	@Override
	public ReviewDTO getReview(int no) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".getReview",no);
	}


	
}
