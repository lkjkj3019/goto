package com.Hotel.dto;

import lombok.Data;

@Data
public class FaqDTO {

	private String faqcode;
	private String faq_qccode;
	private String faqtitle;
	private String faqcontent;
	public String getFaqcode() {
		return faqcode;
	}
	public void setFaqcode(String faqcode) {
		this.faqcode = faqcode;
	}
	public String getFaq_qccode() {
		return faq_qccode;
	}
	public void setFaq_qccode(String faq_qccode) {
		this.faq_qccode = faq_qccode;
	}
	public String getFaqtitle() {
		return faqtitle;
	}
	public void setFaqtitle(String faqtitle) {
		this.faqtitle = faqtitle;
	}
	public String getFaqcontent() {
		return faqcontent;
	}
	public void setFaqcontent(String faqcontent) {
		this.faqcontent = faqcontent;
	}
	@Override
	public String toString() {
		return "FaqDTO [faqcode=" + faqcode + ", faq_qccode=" + faq_qccode + ", faqtitle=" + faqtitle + ", faqcontent="
				+ faqcontent + "]";
	}
	
	
}
