package com.zoomin.www.user.dao;

import java.util.ArrayList;
import java.util.List;

import com.zoomin.www.dto.TalentDTO;
import com.zoomin.www.dto.UserDTO;

public interface UserMapper {

	public List<UserDTO> bestArtist() throws Exception;
	public int loginChk(UserDTO dto) throws Exception;
	public UserDTO getUserInfo(String id) throws Exception;
	public void updateProfile(UserDTO dto) throws Exception;
	public void modifyInOK(UserDTO dto) throws Exception;
	public void dropUser(String id) throws Exception;
	public void joinMember(UserDTO dto) throws Exception;
	public int idCheck(String id) throws Exception;
	public List<UserDTO> recentArtist() throws Exception;
	public List<UserDTO> allUser(UserDTO dto) throws Exception;
	public int userCnt(UserDTO dto) throws Exception;
	public List<UserDTO> artistUser(UserDTO dto) throws Exception;
	public int artistCnt(UserDTO dto) throws Exception;
	public List<UserDTO> generalUser(UserDTO dto) throws Exception;
	public int generalCnt(UserDTO dto) throws Exception;
}
