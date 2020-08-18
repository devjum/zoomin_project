package com.zoomin.www.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zoomin.www.dto.UserDTO;

@Repository
public class UserDAO implements UserMapper {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.zoomin.www.userMapping";

	@Override
	public List<UserDTO> bestArtist() throws Exception {
		System.out.println("UserDAO : bestArtist() 실행");
		return sqlSession.selectList(NAMESPACE+".bestArtist");
	}

	@Override
	public int loginChk(UserDTO user) throws Exception {
		System.out.println("UserDAO : loginChk() 실행");
		return sqlSession.selectOne(NAMESPACE+".loginCheck", user);
	}

	@Override
	public UserDTO getUserInfo(String id) throws Exception {
		System.out.println("UserDAO : getUserInfo() 실행");
		return sqlSession.selectOne(NAMESPACE+".getUserInfo",id);
	}

	@Override
	public void updateProfile(UserDTO dto) throws Exception {
		System.out.println("UserDAO : updateProfile() 실행");
		sqlSession.update(NAMESPACE+".updateProfile", dto);
	}

	@Override
	public void modifyInOK(UserDTO dto) throws Exception {
		System.out.println("UserDAO : modifyInOK() 실행");
		sqlSession.update(NAMESPACE+".modifyInOK",dto);
	}

	@Override
	public void dropUser(String id) throws Exception {
		System.out.println("UserDAO : dropUser() 실행");
		sqlSession.delete(NAMESPACE+".dropUser",id);
	}

	@Override
	public void joinMember(UserDTO dto) throws Exception {
		sqlSession.insert(NAMESPACE+".joinMember",dto);
	}

	@Override
	public int idCheck(String id) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".idCheck",id);
	}

	@Override
	public List<UserDTO> recentArtist() throws Exception {
		return sqlSession.selectList(NAMESPACE+".recentArtist");
	}

	@Override
	public List<UserDTO> allUser(UserDTO dto) throws Exception {
		dto.setPageNo(dto.getCurpage()*10);
		List<UserDTO> list = null;
		if(dto.getSearchCondition().equals("searchId")) list = sqlSession.selectList(NAMESPACE+".allUserById",dto);
		else if(dto.getSearchCondition().equals("searchName")) list = sqlSession.selectList(NAMESPACE+".allUserByName",dto);
		return list;
	}

	@Override
	public int userCnt(UserDTO dto) throws Exception {
		int userCnt = 0;
		if(dto.getSearchCondition().equals("searchId")) userCnt = sqlSession.selectOne(NAMESPACE+".allUserByIdCnt",dto);
		else if(dto.getSearchCondition().equals("searchName")) userCnt = sqlSession.selectOne(NAMESPACE+".allUserByNameCnt",dto);
		return userCnt;
	}

	@Override
	public List<UserDTO> artistUser(UserDTO dto) throws Exception {
		dto.setPageNo(dto.getCurpage()*10);
		List<UserDTO> list = null;
		if(dto.getSearchCondition().equals("searchId")) list = sqlSession.selectList(NAMESPACE+".artistById",dto);
		else if(dto.getSearchCondition().equals("searchName")) list = sqlSession.selectList(NAMESPACE+".artistByName",dto);
		return list;
	}

	@Override
	public int artistCnt(UserDTO dto) throws Exception {
		int userCnt = 0;
		if(dto.getSearchCondition().equals("searchId")) userCnt = sqlSession.selectOne(NAMESPACE+".artistByIdCnt",dto);
		else if(dto.getSearchCondition().equals("searchName")) userCnt = sqlSession.selectOne(NAMESPACE+".artistByNameCnt",dto);
		return userCnt;
	}

	@Override
	public List<UserDTO> generalUser(UserDTO dto) throws Exception {
		dto.setPageNo(dto.getCurpage()*10);
		List<UserDTO> list = null;
		if(dto.getSearchCondition().equals("searchId")) list = sqlSession.selectList(NAMESPACE+".generalById",dto);
		else if(dto.getSearchCondition().equals("searchName")) list = sqlSession.selectList(NAMESPACE+".generalByName",dto);
		return list;
	}

	@Override
	public int generalCnt(UserDTO dto) throws Exception {
		int userCnt = 0;
		if(dto.getSearchCondition().equals("searchId")) userCnt = sqlSession.selectOne(NAMESPACE+".generalByIdCnt",dto);
		else if(dto.getSearchCondition().equals("searchName")) userCnt = sqlSession.selectOne(NAMESPACE+".generalByNameCnt",dto);
		return userCnt;
	}
	
	
	

	

	
}
