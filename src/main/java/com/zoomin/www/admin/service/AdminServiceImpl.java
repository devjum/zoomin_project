package com.zoomin.www.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zoomin.www.admin.dao.AdminDAO;
import com.zoomin.www.dto.AdminDTO;
import com.zoomin.www.dto.UserDTO;

@Service
public class AdminServiceImpl implements AdminService {

	
	private AdminDAO dao;
	
	@Autowired
	public AdminServiceImpl(AdminDAO dao) {
		this.dao = dao;
	}

	@Override
	public UserDTO adminLogin(UserDTO dto) throws Exception {
		return dao.adminLogin(dto);
	}

	@Override
	public AdminDTO adminIndex() throws Exception {
		return dao.adminIndex();
	}

	@Override
	public AdminDTO adminGraph() throws Exception {
		return dao.adminGraph();
	}

	@Override
	public AdminDTO visitCnt() throws Exception {
		return dao.visitCnt();
	}

	@Override
	public void upVisit() throws Exception {
		System.out.println("service 실행");
		dao.upVisit();
	}

	@Override
	public UserDTO getUserInfo(String id) throws Exception {
		return dao.getUserInfo(id);
	}




	
	
}
