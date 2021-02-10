package com.Hotel.dto;

import lombok.Data;

@Data
public class HistoryDTO {

	private String hi_vcode;
	private String hiid;
	private int hichecklike;
	public String getHi_vcode() {
		return hi_vcode;
	}
	public void setHi_vcode(String hi_vcode) {
		this.hi_vcode = hi_vcode;
	}
	public String getHiid() {
		return hiid;
	}
	public void setHiid(String hiid) {
		this.hiid = hiid;
	}
	public int getHichecklike() {
		return hichecklike;
	}
	public void setHichecklike(int hichecklike) {
		this.hichecklike = hichecklike;
	}
	@Override
	public String toString() {
		return "HistoryDTO [hi_vcode=" + hi_vcode + ", hiid=" + hiid + ", hichecklike=" + hichecklike + "]";
	}
	
	
}
