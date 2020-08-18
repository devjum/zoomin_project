package com.zoomin.www.inquiry.dao;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.zoomin.www.dto.InquiryDTO;
import com.zoomin.www.dto.ReserveDTO;

@Repository
public class InquiryDAO implements InquiryMapper {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.zoomin.www.inquiryMapper";

	@Override
	public void inquiryWrite(InquiryDTO dto) throws Exception {
		sqlSession.insert(NAMESPACE+".inquiryWrite",dto);
	}

	@Override
	public List<InquiryDTO> myInquiryList(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE+".myInquiryList", id);
	}

	@Override
	public InquiryDTO inquiryView(int no) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".inquiryView",no);
	}

	@Override
	public void inquiryModify(InquiryDTO dto) throws Exception {
		sqlSession.update(NAMESPACE+".inquiryModify",dto);
	}

	@Override
	public void inquiryDelete(int no) throws Exception {
		sqlSession.delete(NAMESPACE+".inquiryDelete",no);
	}

	@Override
	public List<InquiryDTO> allInquiryList() throws Exception {
		return sqlSession.selectList(NAMESPACE+".allInquiryList");
	}

	@Override
	public InquiryDTO inquiryViewByGroupnum(int no) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".inquiryViewByGroupnum",no);
	}

	@Override
	public void inquiryReOK(InquiryDTO dto) throws Exception {
		System.out.println("id:"+dto.getId()+", categorize:"+dto.getCategorize()+", title:"+dto.getTitle()+", content:"+dto.getContent()+", groupNum:"+dto.getGroupNum()+", replyok:"+dto.getReplyok());
		sqlSession.insert(NAMESPACE+".inquiryReOK",dto);
	}

	@Override
	public void replyUp(int no) throws Exception {
		sqlSession.update(NAMESPACE+".replyUp",no);
	}

	
	
}
