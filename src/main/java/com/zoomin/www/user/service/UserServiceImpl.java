package com.zoomin.www.user.service;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.zoomin.www.dto.UserDTO;
import com.zoomin.www.user.dao.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Autowired
	private UserDAO dao;

	@Override
	public List<UserDTO> bestArtist() throws Exception {
		System.out.println("UserServiceImpl : bestArtist() 실행");
		return dao.bestArtist();
	}

	@Override
	public int loginChk(UserDTO dto) throws Exception {
		System.out.println("UserServiceImpl : loginChk() 실행");
		int getUser=dao.loginChk(dto);
		if (getUser == 0) {
			return -1;
		} else {
			
			return 1;
		}
		
	}

	@Override
	public void getUserInfo(HttpServletRequest request,String id) throws Exception {
		System.out.println("UserServiceImple : getUserInfo() 실행");
		UserDTO getUserInfo = dao.getUserInfo(id);
		HttpSession session = request.getSession();
		session.setAttribute("userInfo",getUserInfo);
	}

	@Override
	public void updateProfile(HttpServletRequest request, UserDTO user) throws Exception {
		System.out.println("UserServiceImple : updateProfile() 실행");
		//파일업로드 처리
		MultipartFile uploadFile = user.getFileUpload();
		String root_path = request.getSession().getServletContext().getRealPath("/");  
		System.out.println(root_path);
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File(uploadPath+"/"+fileName));
			user.setImg(fileName);
			dao.updateProfile(user);
		}
	}

	@Override
	public void modifyInOK(UserDTO dto) throws Exception {
		System.out.println("UserServiceImple : modifyInOK() 실행");
		dto.setPhone(dto.getPhone1()+dto.getPhone2()+dto.getPhone3());
		dao.modifyInOK(dto);
	}

	@Override
	public void dropUser(String id) throws Exception {
		dao.dropUser(id);
		
	}

	@Override
	public void joinMember(UserDTO dto) throws Exception {
		dto.setPhone(dto.getPhone1()+dto.getPhone2()+dto.getPhone3());
		dao.joinMember(dto);
	}

	@Override
	public int idCheck(String id) throws Exception {
		return dao.idCheck(id);
	}

	@Override
	public List<UserDTO> recentArtist() throws Exception {
		return dao.recentArtist();
	}

	@Override
	public List<UserDTO> allUser(UserDTO dto) throws Exception {
		return dao.allUser(dto);
	}

	@Override
	public UserDTO userCnt(UserDTO dto) throws Exception {
		dto.setTotalCnt(dao.userCnt(dto));
		int totalPage = dto.getTotalCnt()/9;
		if(dto.getTotalCnt()%10==0) {
			totalPage--;
		}
		if(totalPage>0) dto.setTotalpage(totalPage);
		return dto;
	}

	@Override
	public List<UserDTO> artistUser(UserDTO dto) throws Exception {
		return dao.artistUser(dto);
	}

	@Override
	public UserDTO artistCnt(UserDTO dto) throws Exception {
		dto.setTotalCnt(dao.artistCnt(dto));
		int totalPage = dto.getTotalCnt()/9;
		if(dto.getTotalCnt()%10==0) {
			totalPage--;
		}
		if(totalPage>0) dto.setTotalpage(totalPage);
		return dto;
	}

	@Override
	public List<UserDTO> generalUser(UserDTO dto) throws Exception {
		return dao.generalUser(dto);
	}

	@Override
	public UserDTO generalCnt(UserDTO dto) throws Exception {
		dto.setTotalCnt(dao.generalCnt(dto));
		int totalPage = dto.getTotalCnt()/9;
		if(dto.getTotalCnt()%10==0) {
			totalPage--;
		}
		if(totalPage>0) dto.setTotalpage(totalPage);
		return dto;
	}
	



	
	
	




	
	
	
}
