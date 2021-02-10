package com.Hotel.dto;

import lombok.Data;

@Data
public class QcategoryDTO {

	private String qccode;
	private String qcname;
	public String getQccode() {
		return qccode;
	}
	public void setQccode(String qccode) {
		this.qccode = qccode;
	}
	public String getQcname() {
		return qcname;
	}
	public void setQcname(String qcname) {
		this.qcname = qcname;
	}
	@Override
	public String toString() {
		return "QcategoryDTO [qccode=" + qccode + ", qcname=" + qcname + "]";
	}
	
	
}
