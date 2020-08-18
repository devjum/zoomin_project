package com.zoomin.www.admin.service;

import com.zoomin.www.dto.AdminDTO;
import com.zoomin.www.dto.UserDTO;

public interface AdminService {

	public UserDTO adminLogin(UserDTO dto) throws Exception;
	public AdminDTO adminIndex() throws Exception;
	public AdminDTO adminGraph() throws Exception;
	public AdminDTO visitCnt() throws Exception;
	public void upVisit() throws Exception;
	public UserDTO getUserInfo(String id) throws Exception;
}
