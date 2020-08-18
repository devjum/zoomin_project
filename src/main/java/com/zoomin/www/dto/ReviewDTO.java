package com.zoomin.www.dto;

public class ReviewDTO {

	int no;
	String id;
	String review;
	int t_no;
	int r_no;
	int rExist;
	double score;
	String wdate = null;
	String name = null;
	String phone = null;
	String perDate = null;
	String perTime = null;
	String perPrice = null;
	String perName = null;
	String price = null;
	
	
	
	
	
	

	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPerDate() {
		return perDate;
	}
	public void setPerDate(String perDate) {
		this.perDate = perDate;
	}
	public String getPerTime() {
		return perTime;
	}
	public void setPerTime(String perTime) {
		this.perTime = perTime;
	}
	public String getPerPrice() {
		return perPrice;
	}
	public void setPerPrice(String perPrice) {
		this.perPrice = perPrice;
	}
	public String getPerName() {
		return perName;
	}
	public void setPerName(String perName) {
		this.perName = perName;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}

	public int getrExist() {
		return rExist;
	}
	public void setrExist(int rExist) {
		this.rExist = rExist;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	String img;
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}


	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public int getT_no() {
		return t_no;
	}
	public void setT_no(int t_no) {
		this.t_no = t_no;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
