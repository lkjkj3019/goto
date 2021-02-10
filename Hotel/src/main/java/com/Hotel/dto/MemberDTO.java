package com.Hotel.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberDTO {

	private String mcode;
	private String mid;
	private String mpassword;
	private String mname;
	private String mphone;
	private Date mbirth;
	private String memail;
	private String memailid;
	private String memaildomain;
	public String getMcode() {
		return mcode;
	}
	public void setMcode(String mcode) {
		this.mcode = mcode;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpassword() {
		return mpassword;
	}
	public void setMpassword(String mpassword) {
		this.mpassword = mpassword;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMphone() {
		return mphone;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public Date getMbirth() {
		return mbirth;
	}
	public void setMbirth(Date mbirth) {
		this.mbirth = mbirth;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getMemailid() {
		return memailid;
	}
	public void setMemailid(String memailid) {
		this.memailid = memailid;
	}
	public String getMemaildomain() {
		return memaildomain;
	}
	public void setMemaildomain(String memaildomain) {
		this.memaildomain = memaildomain;
	}
	@Override
	public String toString() {
		return "MemberDTO [mcode=" + mcode + ", mid=" + mid + ", mpassword=" + mpassword + ", mname=" + mname
				+ ", mphone=" + mphone + ", mbirth=" + mbirth + ", memail=" + memail + ", memailid=" + memailid
				+ ", memaildomain=" + memaildomain + "]";
	}
	
	
	
	
}
