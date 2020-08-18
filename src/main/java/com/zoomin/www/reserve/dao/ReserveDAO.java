package com.zoomin.www.reserve.dao;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.zoomin.www.dto.ReserveDTO;

@Repository
public class ReserveDAO implements ReserveMapper {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.zoomin.www.reserveMapper";

	@Override
	public void reserveWriteOK(ReserveDTO dto) {
		sqlSession.insert(NAMESPACE+".reserveWriteOK",dto);
	}

	@Override
	public List<ReserveDTO> listOfGeneral(String id) {
		return sqlSession.selectList(NAMESPACE+".listOfGeneral",id);
	}

	@Override
	public List<ReserveDTO> listOfArtist(int no) {
		return sqlSession.selectList(NAMESPACE+".listOfArtist",no);
	}

	@Override
	public ReserveDTO reserveView(int no) {
		return sqlSession.selectOne(NAMESPACE+".reserveView",no);
	}

	@Override
	public void updateStatus(ReserveDTO dto) {
		sqlSession.update(NAMESPACE+".updateStatus",dto);
	}

	@Override
	public void reserveModify(ReserveDTO dto) {
		sqlSession.update(NAMESPACE+".reserveModify",dto);
	}

	@Override
	public void reserveDelete(int no) {
		sqlSession.delete(NAMESPACE+".reserveDelete", no);
	}

	@Override
	public List<ReserveDTO> completeReserve(String id) {
		return sqlSession.selectList(NAMESPACE+".completeReserve",id);
	}




	
	
}
