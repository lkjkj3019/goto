package com.Hotel.mapper;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.Hotel.dto.FaqDTO;
import com.Hotel.dto.HelpDTO;
import com.Hotel.dto.QcategoryDTO;

public interface HelpMapper {
	
	// 1대1 문의 등록
	public int HelpWrite(HelpDTO helpDTO);

	// 자묻질 리스트 select
	List<Map<String, Object>> selectFAQList();

	// 1대1문의 select
	Map<String, Object> helpAnswer(String hecode);
	
	// 1대1문의 답변 등록
	int updateAnswer(Map<String, Object> map);
	
	//1대1질문 목록
	public List<Map<String, Object>> questionList(String loginId);

	// 자묻질 등록
	public int faqWriteForm(FaqDTO faqDTO);

	// MAX FA코드 select
	public String maxFaqNum();

	// MAX he코드 select
	public String gethecode();

	// 카테고리 select
	public ArrayList<QcategoryDTO> getQcategory();
	
	// FAQ 카테고리 코드에 따른 ArrayList 불러오기
	public ArrayList<FaqDTO> searchingFAQList(String faq_qccode);
	
	//1대1문의 목록 카테고리 
	public List<Map<String, Object>> questionSelect(@Param("he_qccode")String he_qccode, @Param("loginId")String loginId);
}
