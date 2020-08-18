package com.zoomin.www.admin.dao;

import java.util.Calendar;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.zoomin.www.dto.AdminDTO;
import com.zoomin.www.dto.UserDTO;

@Repository
public class AdminDAO implements AdminMapper {

private SqlSession sqlSession;
	
	@Autowired
	public AdminDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	private static final String A_NAMESPACE = "com.zoomin.www.adminMapper";
	private static final String U_NAMESPACE = "com.zoomin.www.userMapping";
	private static final String T_NAMESPACE = "com.zoomin.www.talentMapper";
	private static final String R_NAMESPACE = "com.zoomin.www.reserveMapper";

	@Override
	public UserDTO adminLogin(UserDTO dto) throws Exception {
		return sqlSession.selectOne(A_NAMESPACE+".adminLogin",dto);
	}

	@Override
	public AdminDTO adminIndex() throws Exception {
		AdminDTO dto = new AdminDTO();
		int totalUser = sqlSession.selectOne(U_NAMESPACE+".totalUser");
		int taUser = sqlSession.selectOne(U_NAMESPACE+".totalArtistUser");
		int tgUser = sqlSession.selectOne(U_NAMESPACE+".totalGeneralUser");
		int monthUser = sqlSession.selectOne(U_NAMESPACE+".monthUser");
		int maUser = sqlSession.selectOne(U_NAMESPACE+".monthArtistUser");
		int mgUser = sqlSession.selectOne(U_NAMESPACE+".monthGeneralUser");
		int dNewUser = sqlSession.selectOne(U_NAMESPACE+".dailyUser");
		int dTalentCnt = sqlSession.selectOne(T_NAMESPACE+".dailyTalent");
		int dReserveCnt = sqlSession.selectOne(R_NAMESPACE+".dailyReserveComplete");
		
		dto.setTotalUser(totalUser);
		dto.setTaUser(taUser);
		dto.setTgUser(tgUser);
		dto.setMonthUser(monthUser);
		dto.setMaUser(maUser);
		dto.setMgUser(mgUser);
		dto.setdCnt(dNewUser);
		dto.setdTalentCnt(dTalentCnt);
		dto.setdReserveCnt(dReserveCnt);
		return dto;
	}

	@Override
	public AdminDTO adminGraph() throws Exception {
		AdminDTO dto = new AdminDTO();
		
		Calendar cal = Calendar.getInstance();
		String date1 = cal.get(Calendar.YEAR)+":"+(cal.get(Calendar.MONTH)+1)+":"+(cal.get(Calendar.DAY_OF_MONTH)-4);
		String date2 = cal.get(Calendar.YEAR)+":"+(cal.get(Calendar.MONTH)+1)+":"+(cal.get(Calendar.DAY_OF_MONTH)-3);
		String date3 = cal.get(Calendar.YEAR)+":"+(cal.get(Calendar.MONTH)+1)+":"+(cal.get(Calendar.DAY_OF_MONTH)-2);
		String date4 = cal.get(Calendar.YEAR)+":"+(cal.get(Calendar.MONTH)+1)+":"+(cal.get(Calendar.DAY_OF_MONTH)-1);

		int d1 = sqlSession.selectOne(R_NAMESPACE+".reserveGraph",date1);
		int d2 = sqlSession.selectOne(R_NAMESPACE+".reserveGraph",date2);
		int d3 = sqlSession.selectOne(R_NAMESPACE+".reserveGraph",date3);
		int d4 = sqlSession.selectOne(R_NAMESPACE+".reserveGraph",date4);
		int d5 = sqlSession.selectOne(R_NAMESPACE+".dailyReserveComplete");
		
		dto.setGraph_d1(d1);
		dto.setGraph_d2(d2);
		dto.setGraph_d3(d3);
		dto.setGraph_d4(d4);
		dto.setGraph_d5(d5);
		
		return dto;
	}

	@Override
	public AdminDTO visitCnt() throws Exception {
		AdminDTO dto = new AdminDTO();

		int todayVisit = sqlSession.selectOne(A_NAMESPACE+".getTodayVisit");
		int totalVisit = sqlSession.selectOne(A_NAMESPACE+".getTotalVisit");

		dto.setTodayVisit(todayVisit);
		dto.setTotalVisit(totalVisit);
		return dto;
	}

	@Override
	public void upVisit() throws Exception {
		System.out.println("dao실행");
		sqlSession.insert(A_NAMESPACE+".upVisitCount");

	}
	
	@Override
	public UserDTO getUserInfo(String id) throws Exception {
		return sqlSession.selectOne(U_NAMESPACE+".getUserInfo",id);
	}




	
}
