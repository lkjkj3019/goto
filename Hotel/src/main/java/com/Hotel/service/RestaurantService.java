package com.Hotel.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.Hotel.dto.CityDTO;
import com.Hotel.dto.LandmarkDTO;
import com.Hotel.dto.PageDTO;
import com.Hotel.dto.RestaurantDTO;
import com.Hotel.mapper.LandmarkMapper;
import com.Hotel.mapper.RestaurantMapper;

@Service
public class RestaurantService {

	private ModelAndView mav;

	@Autowired
	private RestaurantMapper restaurantMapper;

	@Autowired
	private LandmarkMapper landmarkMapper;

	// 레스토랑 리스트 출력
	public ModelAndView restaurantList(String re_ctcode, int page) {
		mav = new ModelAndView();

		// 페이징 처리
		int pageLimit = 2;
		int pageNumLimit = 3;

		int startRow = (page - 1) * pageLimit + 1;
		int endRow = page * pageLimit;

		PageDTO pageDTO = new PageDTO();

		pageDTO.setStartrow(startRow);
		pageDTO.setEndrow(endRow);

		// 레스토랑 리스트, 리스트 개수 미리 선언
		ArrayList<RestaurantDTO> restaurantList = new ArrayList<RestaurantDTO>();
		int restaurantListCnt = 0;
		CityDTO cityDTO = new CityDTO();

		// re_ctcode가 있을 경우와 없을 경우 나눠서 select
		if (re_ctcode == null) {
			// 모든 레스토랑 리스트 select
			restaurantList = restaurantMapper.AllRestaurantList(startRow, endRow);

			// 모든 레스토랑 리스트 개수 select
			restaurantListCnt = restaurantMapper.getAllRestaurantListCnt();
		} else {
			// city 테이블 ctname, ctdivide select
			cityDTO = restaurantMapper.getCityDTO(re_ctcode);

			// 레스토랑 리스트 select
			restaurantList = restaurantMapper.restaurantList(cityDTO, startRow, endRow);
			System.out.println(restaurantList);

			// 레스토랑 리스트 개수 select
			restaurantListCnt = restaurantMapper.getrestaurantListCnt(cityDTO);
		}

		// 페이징 처리
		int maxPage = (int) (Math.ceil((double) restaurantListCnt / pageLimit));
		int startPage = page - 1;
		if (page == 1)
			startPage = 1;
		int endPage = page + 1;
		if (page == 1)
			endPage = 3;
		if (endPage > maxPage) {
			endPage = maxPage;
		}

		if (endPage > maxPage) {
			endPage = maxPage;
		}
		pageDTO.setPage(page);
		pageDTO.setStartpage(startPage);
		pageDTO.setEndpage(endPage);
		pageDTO.setMaxpage(maxPage);

		mav.addObject("cityDTO", cityDTO);
		mav.addObject("restaurantList", restaurantList);
		mav.addObject("pageDTO", pageDTO);
		mav.setViewName("member/restaurantList");

		return mav;
	}

	// 레스토랑 검색
	public ModelAndView searchingRestaurant(String ctname, String ctdivide, int page) {
		mav = new ModelAndView();

		// 페이징 처리
		int pageLimit = 2;
		int pageNumLimit = 3;

		int startRow = (page - 1) * pageLimit + 1;
		int endRow = page * pageLimit;

		PageDTO pageDTO = new PageDTO();

		pageDTO.setStartrow(startRow);
		pageDTO.setEndrow(endRow);

		// 레스토랑 검색
		ArrayList<RestaurantDTO> restaurantList = restaurantMapper.searchingRestaurant(ctname, ctdivide, startRow, endRow);

		// 페이징 처리
		int landmarkListCnt = restaurantMapper.getSearchRestaurantListCnt(ctname, ctdivide);
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
		mav.addObject("restaurantList", restaurantList);
		mav.addObject("cityDTO", cityDTO);
		mav.setViewName("member/restaurantList");

		return mav;
	}

}
