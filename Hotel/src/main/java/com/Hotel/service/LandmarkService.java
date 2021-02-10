package com.Hotel.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.Hotel.dto.CityDTO;
import com.Hotel.dto.LandmarkDTO;
import com.Hotel.dto.PageDTO;
import com.Hotel.mapper.LandmarkMapper;

@Service
public class LandmarkService {

	private ModelAndView mav;

	@Autowired
	private LandmarkMapper landmarkMapper;

	// 랜드마크 리스트
	public ModelAndView landmarkList(String la_ctcode, int page) {

		mav = new ModelAndView();

		// 페이징 처리
		int pageLimit = 2;
		int pageNumLimit = 3;

		int startRow = (page - 1) * pageLimit + 1;
		int endRow = page * pageLimit;

		PageDTO pageDTO = new PageDTO();

		pageDTO.setStartrow(startRow);
		pageDTO.setEndrow(endRow);
		
		// 랜드마크 리스트, 리스트 개수 미리 선언
		ArrayList<LandmarkDTO> landmarkList = new ArrayList<LandmarkDTO>();
		int landmarkListCnt = 0;
		CityDTO cityDTO = new CityDTO();
		
		// la_ctcode가 있을 경우와 없을 경우 나눠서 select
		if(la_ctcode == null) {
			// 모든 랜드마크 리스트 select
			landmarkList = landmarkMapper.AlllandmarkList(startRow, endRow);
			
			// 모든 랜드마크 리스트 개수 select
			landmarkListCnt = landmarkMapper.getAlllandmarkListCnt();
		} else {
			// city 테이블 ctname, ctdivide select
			cityDTO = landmarkMapper.getCityDTO(la_ctcode);
			
			// 랜드마크 리스트 select
			landmarkList = landmarkMapper.landmarkList(cityDTO, startRow, endRow);
			System.out.println(landmarkList);
			
			// 랜드마크 리스트 개수 select
			landmarkListCnt = landmarkMapper.getlandmarkListCnt(cityDTO);
		}

		// 페이징 처리
		int maxPage = (int) (Math.ceil((double) landmarkListCnt / pageLimit));
		int startPage = page - 1;
		if (page == 1)
			startPage = 1;
		int endPage = page + 1;
		if (page == 1)
			endPage = 3;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		pageDTO.setPage(page);
		pageDTO.setStartpage(startPage);
		pageDTO.setEndpage(endPage);
		pageDTO.setMaxpage(maxPage);

		mav.addObject("cityDTO", cityDTO);
		mav.addObject("landmarkList", landmarkList);
		mav.addObject("pageDTO", pageDTO);
		mav.setViewName("member/landmarkList");

		return mav;

	}

	// 랜드마크 검색
	public ModelAndView searchingLandmark(String ctname, String ctdivide, int page) {
		mav = new ModelAndView();

		// 페이징 처리
		int pageLimit = 2;
		int pageNumLimit = 3;

		int startRow = (page - 1) * pageLimit + 1;
		int endRow = page * pageLimit;

		PageDTO pageDTO = new PageDTO();

		pageDTO.setStartrow(startRow);
		pageDTO.setEndrow(endRow);
		
		// 랜드마크 검색
		ArrayList<LandmarkDTO> landmarkList = landmarkMapper.searchingLandmark(ctname, ctdivide, startRow, endRow);

		// 페이징 처리
		int landmarkListCnt = landmarkMapper.getSearchLandmarkListCnt(ctname, ctdivide);
		int maxPage = (int) (Math.ceil((double) landmarkListCnt / pageLimit));
		int startPage = page - 1;
		if (page == 1)
			startPage = 1;
		int endPage = page + 1;
		if (page == 1)
			endPage = 3;
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		pageDTO.setPage(page);
		pageDTO.setStartpage(startPage);
		pageDTO.setEndpage(endPage);
		pageDTO.setMaxpage(maxPage);
		
		CityDTO cityDTO = new CityDTO();
		cityDTO.setCtname(ctname);
		cityDTO.setCtdivide(ctdivide);
		
		mav.addObject("pageDTO", pageDTO);
		mav.addObject("landmarkList", landmarkList);
		mav.addObject("cityDTO", cityDTO);
		mav.setViewName("member/landmarkList");

		return mav;
	}

}
