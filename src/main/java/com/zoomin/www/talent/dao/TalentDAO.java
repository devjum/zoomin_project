package com.zoomin.www.talent.dao;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.zoomin.www.dto.TalentDTO;

@Repository
public class TalentDAO implements TalentMapper {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.zoomin.www.talentMapper";
	
	@Override
	public List<TalentDTO> talentList(TalentDTO dto) {
		List<TalentDTO> list = sqlSession.selectList(NAMESPACE+".talentList",dto); 
		return list;
	}

	@Override
	public TalentDTO talentView(int no) {
		return sqlSession.selectOne(NAMESPACE+".talentView",no);
	}

	@Override
	public int talentExist(String id) {
		return sqlSession.selectOne(NAMESPACE+".talentExist",id);
	}

	@Override
	public int getTalentNo(String id) {
		int no = 0;
		no=sqlSession.selectOne(NAMESPACE+".getTalentNo",id);
		return no;
	}

	@Override
	public void talentModifyOK(TalentDTO dto) {
		sqlSession.update(NAMESPACE+".talentModifyOK",dto);
	}

	@Override
	public void filesUpload(TalentDTO dto) {
		sqlSession.update(NAMESPACE+".filesUpload",dto);
	}

	@Override
	public void uploadThumb(TalentDTO dto) {
		sqlSession.update(NAMESPACE+".uploadThumb",dto);
	}

	@Override
	public void talentWrite(TalentDTO dto) {
		sqlSession.insert(NAMESPACE+".talentWrite",dto);
		
	}

	@Override
	public void talentDelete(String id) {
		sqlSession.delete(NAMESPACE+".talentDelete",id);
	}

	@Override
	public String getFileMultiName(String id) {
		return sqlSession.selectOne(NAMESPACE+".getFileMultiName",id);
	}

	@Override
	public String getThumbName(String id) {
		return sqlSession.selectOne(NAMESPACE+".getThumbName",id);
	}

	@Override
	public void updateAvg(int no) {
		sqlSession.update(NAMESPACE+".updateAvg",no);
	}

	@Override
	public int listCnt(TalentDTO dto) {
		int listTotalCnt = 0;
		if(dto.getSearchKeyword()==null) {
			dto.setSearchKeyword("");
		}
		listTotalCnt=sqlSession.selectOne(NAMESPACE+".talentListCnt",dto); 


		return listTotalCnt;
	}
	
	
	
	

	
}
