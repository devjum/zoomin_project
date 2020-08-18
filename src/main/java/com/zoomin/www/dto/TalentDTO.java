package com.zoomin.www.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class TalentDTO {
	int no = 0;
	String title;
	String categorize;
	String video;
	String content;
	String id;
	String wdate;
	int rcnt;
	String fileName;
	String img;
	String name;
	String introduce;
	double gradeAvg;
	String price1;
	String price2;
	MultipartFile thumbImg;
	String thumbName;
	MultipartFile [] files;
	String fileMultiName;
	String searchCondition;
	String searchKeyword = "";
	String [] searchChk;
	List<String> list;
	String searchCategorizeStr;
	int curpage;
	int totalpage;
	int totalCnt;
	int pageNo;
	int limitCnt;
	
	
	
	
	
	
	
	
	

	public List<String> getList() {
		return list;
	}
	public void setList(List<String> list) {
		this.list = list;
	}
	public int getLimitCnt() {
		return limitCnt;
	}
	public void setLimitCnt(int limitCnt) {
		this.limitCnt = limitCnt;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public int getTotalpage() {
		return totalpage;
	}
	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}
	public int getCurpage() {
		return curpage;
	}
	public void setCurpage(int curpage) {
		this.curpage = curpage;
	}
	public String getSearchCategorizeStr() {
		return searchCategorizeStr;
	}
	public void setSearchCategorizeStr(String searchCategorizeStr) {
		this.searchCategorizeStr = searchCategorizeStr;
	}

	

	public String[] getSearchChk() {
		return searchChk;
	}
	public void setSearchChk(String[] searchChk) {
		this.searchChk = searchChk;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public MultipartFile[] getFiles() {
		return files;
	}
	public void setFiles(MultipartFile[] files) {
		this.files = files;
	}
	public String getThumbName() {
		return thumbName;
	}
	public void setThumbName(String thumbName) {
		this.thumbName = thumbName;
	}
	public MultipartFile getThumbImg() {
		return thumbImg;
	}
	public void setThumbImg(MultipartFile thumbImg) {
		this.thumbImg = thumbImg;
	}
	public String getFileMultiName() {
		return fileMultiName;
	}
	public void setFileMultiName(String fileMultiName) {
		this.fileMultiName = fileMultiName;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategorize() {
		return categorize;
	}
	public void setCategorize(String categorize) {
		this.categorize = categorize;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public int getRcnt() {
		return rcnt;
	}
	public void setRcnt(int rcnt) {
		this.rcnt = rcnt;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public double getGradeAvg() {
		return gradeAvg;
	}
	public void setGradeAvg(double gradeAvg) {
		this.gradeAvg = gradeAvg;
	}
	public String getPrice1() {
		return price1;
	}
	public void setPrice1(String price1) {
		this.price1 = price1;
	}
	public String getPrice2() {
		return price2;
	}
	public void setPrice2(String price2) {
		this.price2 = price2;
	}

	
}
