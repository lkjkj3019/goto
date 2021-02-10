package com.Hotel.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;

import com.Hotel.dto.FaqDTO;


public interface FaqMapper {

	// 자묻질 리스트 select
	ArrayList<FaqDTO> FaqList();

	// 자묻질 삭제
	@Delete("DELETE FROM FAQ WHERE FAQCODE=#{faqcode}")
	public int FaqDelete(String faqcode);

}
