package com.Hotel.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class BookingDTO {

	private String bcode;
	private String b_mcode;
	private String b_ctcode;
	private String b_hocode;
	private String b_rocode;
	private Integer bperson;
	private Date bcheckin;
	private Date bcheckout;
	private Date bdrawup;
	private String brequest;
	private Integer bprice;
	public String getBcode() {
		return bcode;
	}
	public void setBcode(String bcode) {
		this.bcode = bcode;
	}
	public String getB_mcode() {
		return b_mcode;
	}
	public void setB_mcode(String b_mcode) {
		this.b_mcode = b_mcode;
	}
	public String getB_ctcode() {
		return b_ctcode;
	}
	public void setB_ctcode(String b_ctcode) {
		this.b_ctcode = b_ctcode;
	}
	public String getB_hocode() {
		return b_hocode;
	}
	public void setB_hocode(String b_hocode) {
		this.b_hocode = b_hocode;
	}
	public String getB_rocode() {
		return b_rocode;
	}
	public void setB_rocode(String b_rocode) {
		this.b_rocode = b_rocode;
	}
	public Integer getBperson() {
		return bperson;
	}
	public void setBperson(Integer bperson) {
		this.bperson = bperson;
	}
	public Date getBcheckin() {
		return bcheckin;
	}
	public void setBcheckin(Date bcheckin) {
		this.bcheckin = bcheckin;
	}
	public Date getBcheckout() {
		return bcheckout;
	}
	public void setBcheckout(Date bcheckout) {
		this.bcheckout = bcheckout;
	}
	public Date getBdrawup() {
		return bdrawup;
	}
	public void setBdrawup(Date bdrawup) {
		this.bdrawup = bdrawup;
	}
	public String getBrequest() {
		return brequest;
	}
	public void setBrequest(String brequest) {
		this.brequest = brequest;
	}
	public Integer getBprice() {
		return bprice;
	}
	public void setBprice(Integer bprice) {
		this.bprice = bprice;
	}
	@Override
	public String toString() {
		return "BookingDTO [bcode=" + bcode + ", b_mcode=" + b_mcode + ", b_ctcode=" + b_ctcode + ", b_hocode="
				+ b_hocode + ", b_rocode=" + b_rocode + ", bperson=" + bperson + ", bcheckin=" + bcheckin
				+ ", bcheckout=" + bcheckout + ", bdrawup=" + bdrawup + ", brequest=" + brequest + ", bprice=" + bprice
				+ "]";
	}
	
	
}
