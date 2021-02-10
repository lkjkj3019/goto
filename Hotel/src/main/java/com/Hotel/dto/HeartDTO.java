package com.Hotel.dto;

import lombok.Data;

@Data
public class HeartDTO {

	private String htcode;
	private String ht_hocode;
	private String htid;
	private int htcheck;
	public String getHtcode() {
		return htcode;
	}
	public void setHtcode(String htcode) {
		this.htcode = htcode;
	}
	public String getHt_hocode() {
		return ht_hocode;
	}
	public void setHt_hocode(String ht_hocode) {
		this.ht_hocode = ht_hocode;
	}
	public String getHtid() {
		return htid;
	}
	public void setHtid(String htid) {
		this.htid = htid;
	}
	public int getHtcheck() {
		return htcheck;
	}
	public void setHtcheck(int htcheck) {
		this.htcheck = htcheck;
	}
	@Override
	public String toString() {
		return "HeartDTO [htcode=" + htcode + ", ht_hocode=" + ht_hocode + ", htid=" + htid + ", htcheck=" + htcheck
				+ "]";
	}
	
	
}
