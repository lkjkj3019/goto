package com.Hotel.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.Hotel.dto.CityDTO;
import com.Hotel.dto.LandmarkDTO;
import com.Hotel.dto.PageDTO;
import com.Hotel.dto.RestaurantDTO;

public interface RestaurantMapper {

	// 레스토랑 리스트 select
	public ArrayList<RestaurantDTO> restaurantList(@Param("cityDTO") CityDTO cityDTO, @Param("startrow")int startRow, @Param("endrow")int endRow  );

	// 레스토랑 검색
	public ArrayList<RestaurantDTO> searchingRestaurant(@Param("ctname") String ctname, @Param("ctdivide")String ctdivide, @Param("startrow") int startRow, @Param("endrow") int endRow);

	// 레스토랑 개수 select
	public int getrestaurantListCnt(CityDTO cityDTO);

	// 관리자 레스토랑 리스트 select
	public ArrayList<RestaurantDTO> adminRestaurantList();

	// 레스토랑 수정
	public int restaurantModify(RestaurantDTO restaurantDTO);

	// 레스토랑 사진 이름 select
	public String getRephotoname(String recode);

	// 레스토랑 삭제
	public int restaurantDelete(String recode);

	// 레스토랑 수정 폼
	public RestaurantDTO restaurantModifyForm(String recode);

	// 레스토랑 검색 개수 select
	public int getSearchRestaurantListCnt(@Param("ctname") String ctname, @Param("ctdivide") String ctdivide);

	// city 테이블 ctname, ctdivide select
	public CityDTO getCityDTO(String la_ctcode);

	// 모든 레스토랑 리스트 select
	public ArrayList<RestaurantDTO> AllRestaurantList( @Param("startrow")int startRow, @Param("endrow")int endRow);

	// 모든 레스토랑 리스트 개수 select
	public int getAllRestaurantListCnt();
}
