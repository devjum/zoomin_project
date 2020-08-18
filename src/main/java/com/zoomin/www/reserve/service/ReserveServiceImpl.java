package com.zoomin.www.reserve.service;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zoomin.www.dto.ReserveDTO;
import com.zoomin.www.dto.ReviewDTO;
import com.zoomin.www.reserve.dao.ReserveDAO;
import com.zoomin.www.review.dao.ReviewDAO;

@Service
public class ReserveServiceImpl implements ReserveService {

	@Autowired
	private ReserveDAO dao;
	
	@Autowired
	private ReviewDAO reviewDao;

	@Override
	public void reserveWriteOK(ReserveDTO dto) throws Exception {
		dao.reserveWriteOK(dto);
	}

	@Override
	public List<ReserveDTO> listOfArtist(int no) throws Exception {
		return dao.listOfArtist(no);
	}

	@Override
	public List<ReserveDTO> listOfGeneral(String id) throws Exception {
		return dao.listOfGeneral(id);
	}

	@Override
	public ReserveDTO reserveView(int no) throws Exception {
		return dao.reserveView(no);
	}

	@Override
	public void updateStatus(ReserveDTO dto) throws Exception {
		dao.updateStatus(dto);
		
	}

	@Override
	public void reserveModify(ReserveDTO dto) throws Exception {
		dao.reserveModify(dto);
	}

	@Override
	public void reserveDelete(int no) throws Exception {
		dao.reserveDelete(no);
	}

	@Override
	public List<ReserveDTO> completeReserve(String id) throws Exception {
		List<ReserveDTO> list = dao.completeReserve(id);
		Iterator<ReserveDTO> it = list.iterator();
		while(it.hasNext()) {
			ReserveDTO dto = it.next();
			System.out.println("getNo:"+dto.getNo());
			dto.setReviewExist(reviewDao.reviewExist(dto.getNo()));
			System.out.println("reviewExist:"+reviewDao.reviewExist(dto.getNo()));
			if(reviewDao.reviewExist(dto.getNo())!=0) {
				ReviewDTO reviewDTO = reviewDao.getReview(dto.getNo());
				System.out.println(reviewDTO.getReview());
				System.out.println("dto.getNo():"+dto.getNo());
				System.out.println("reviewDTO:"+reviewDTO);
				dto.setScore(reviewDTO.getScore());
				dto.setReview(reviewDTO.getReview());
				dto.setReviewWdate(reviewDTO.getWdate());
			}
		}
		return list;
	}


	

	
	
}
