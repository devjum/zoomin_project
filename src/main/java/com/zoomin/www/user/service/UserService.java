package com.zoomin.www.user.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.zoomin.www.dto.UserDTO;

public interface UserService {

	public List<UserDTO> bestArtist() throws Exception;
	public int loginChk(UserDTO dto) throws Exception;
	public void getUserInfo(HttpServletRequest request,String id) throws Exception;
	public void updateProfile(HttpServletRequest request, UserDTO dto) throws Exception;
	public void modifyInOK(UserDTO dto) throws Exception;
	public void dropUser(String id) throws Exception;
	public void joinMember(UserDTO dto) throws Exception;
	public int idCheck(String id) throws Exception;
	public List<UserDTO> recentArtist() throws Exception;
	public List<UserDTO> allUser(UserDTO dto) throws Exception;
	public UserDTO userCnt(UserDTO dto) throws Exception;
	public List<UserDTO> artistUser(UserDTO dto) throws Exception;
	public UserDTO artistCnt(UserDTO dto) throws Exception;
	public List<UserDTO> generalUser(UserDTO dto) throws Exception;
	public UserDTO generalCnt(UserDTO dto) throws Exception;
	
	
}
