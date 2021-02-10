package com.Hotel.dto;

import lombok.Data;

@Data
public class CompanyDTO {

	private String cmcode;
	private String cmid;
	private String cmpassword;
	private String cmname;
	private String cmphone;
	private String cmemail;
	private String cmaddress;
	private int cmcheck;
	private String cmmailid; //메일앞쪽
	private String cmdomain;  //도메인뒷쪽
	private String cmpost;   //우편번호
	private String cmaddr;   //주소
	private String cmexaddr;  //참고항목
	private String cmdetail; //상세주소
	public String getCmcode() {
		return cmcode;
	}
	public void setCmcode(String cmcode) {
		this.cmcode = cmcode;
	}
	public String getCmid() {
		return cmid;
	}
	public void setCmid(String cmid) {
		this.cmid = cmid;
	}
	public String getCmpassword() {
		return cmpassword;
	}
	public void setCmpassword(String cmpassword) {
		this.cmpassword = cmpassword;
	}
	public String getCmname() {
		return cmname;
	}
	public void setCmname(String cmname) {
		this.cmname = cmname;
	}
	public String getCmphone() {
		return cmphone;
	}
	public void setCmphone(String cmphone) {
		this.cmphone = cmphone;
	}
	public String getCmemail() {
		return cmemail;
	}
	public void setCmemail(String cmemail) {
		this.cmemail = cmemail;
	}
	public String getCmaddress() {
		return cmaddress;
	}
	public void setCmaddress(String cmaddress) {
		this.cmaddress = cmaddress;
	}
	public int getCmcheck() {
		return cmcheck;
	}
	public void setCmcheck(int cmcheck) {
		this.cmcheck = cmcheck;
	}
	public String getCmmailid() {
		return cmmailid;
	}
	public void setCmmailid(String cmmailid) {
		this.cmmailid = cmmailid;
	}
	public String getCmdomain() {
		return cmdomain;
	}
	public void setCmdomain(String cmdomain) {
		this.cmdomain = cmdomain;
	}
	public String getCmpost() {
		return cmpost;
	}
	public void setCmpost(String cmpost) {
		this.cmpost = cmpost;
	}
	public String getCmaddr() {
		return cmaddr;
	}
	public void setCmaddr(String cmaddr) {
		this.cmaddr = cmaddr;
	}
	public String getCmexaddr() {
		return cmexaddr;
	}
	public void setCmexaddr(String cmexaddr) {
		this.cmexaddr = cmexaddr;
	}
	public String getCmdetail() {
		return cmdetail;
	}
	public void setCmdetail(String cmdetail) {
		this.cmdetail = cmdetail;
	}
	@Override
	public String toString() {
		return "CompanyDTO [cmcode=" + cmcode + ", cmid=" + cmid + ", cmpassword=" + cmpassword + ", cmname=" + cmname
				+ ", cmphone=" + cmphone + ", cmemail=" + cmemail + ", cmaddress=" + cmaddress + ", cmcheck=" + cmcheck
				+ ", cmmailid=" + cmmailid + ", cmdomain=" + cmdomain + ", cmpost=" + cmpost + ", cmaddr=" + cmaddr
				+ ", cmexaddr=" + cmexaddr + ", cmdetail=" + cmdetail + "]";
	}
	
	
	
	
}
