package com.Hotel.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class HelpDTO {

	private String hecode;
	private String he_qccode;
	private String he_mid;
	private String hetitle;
	private String hecontent;
	private String heanswer;
	private Date hedate;
	public String getHecode() {
		return hecode;
	}
	public void setHecode(String hecode) {
		this.hecode = hecode;
	}
	public String getHe_qccode() {
		return he_qccode;
	}
	public void setHe_qccode(String he_qccode) {
		this.he_qccode = he_qccode;
	}
	public String getHe_mid() {
		return he_mid;
	}
	public void setHe_mid(String he_mid) {
		this.he_mid = he_mid;
	}
	public String getHetitle() {
		return hetitle;
	}
	public void setHetitle(String hetitle) {
		this.hetitle = hetitle;
	}
	public String getHecontent() {
		return hecontent;
	}
	public void setHecontent(String hecontent) {
		this.hecontent = hecontent;
	}
	public String getHeanswer() {
		return heanswer;
	}
	public void setHeanswer(String heanswer) {
		this.heanswer = heanswer;
	}
	public Date getHedate() {
		return hedate;
	}
	public void setHedate(Date hedate) {
		this.hedate = hedate;
	}
	@Override
	public String toString() {
		return "HelpDTO [hecode=" + hecode + ", he_qccode=" + he_qccode + ", he_mid=" + he_mid + ", hetitle=" + hetitle
				+ ", hecontent=" + hecontent + ", heanswer=" + heanswer + ", hedate=" + hedate + "]";
	}

	
	
	
}