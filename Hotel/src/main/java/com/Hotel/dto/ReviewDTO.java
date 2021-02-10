package com.Hotel.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewDTO {

	private String vcode;
	private String v_hocode;
	private String vwriter;
	private String vcontent;
	private int vscore;
	private Date vdrawup;
	private String honame;
	private String v_bcode;
	
	public String getVcode() {
		return vcode;
	}
	public void setVcode(String vcode) {
		this.vcode = vcode;
	}
	public String getV_hocode() {
		return v_hocode;
	}
	public void setV_hocode(String v_hocode) {
		this.v_hocode = v_hocode;
	}
	public String getVwriter() {
		return vwriter;
	}
	public void setVwriter(String vwriter) {
		this.vwriter = vwriter;
	}
	public String getVcontent() {
		return vcontent;
	}
	public void setVcontent(String vcontent) {
		this.vcontent = vcontent;
	}
	public int getVscore() {
		return vscore;
	}
	public void setVscore(int vscore) {
		this.vscore = vscore;
	}
	public Date getVdrawup() {
		return vdrawup;
	}
	public void setVdrawup(Date vdrawup) {
		this.vdrawup = vdrawup;
	}
	public String getHoname() {
		return honame;
	}
	public void setHoname(String honame) {
		this.honame = honame;
	}
	
	@Override
	public String toString() {
		return "ReviewDTO [vcode=" + vcode + ", v_hocode=" + v_hocode + ", vwriter=" + vwriter + ", vcontent="
				+ vcontent + ", vscore=" + vscore + ", vdrawup=" + vdrawup + ", honame=" + honame + ", getVcode()="
				+ getVcode() + ", getV_hocode()=" + getV_hocode() + ", getVwriter()=" + getVwriter()
				+ ", getVcontent()=" + getVcontent() + ", getVscore()=" + getVscore() + ", getVdrawup()=" + getVdrawup()
				+ ", getHoname()=" + getHoname() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	
}
