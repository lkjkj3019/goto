package com.Hotel.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.Hotel.dto.CityDTO;
import com.Hotel.dto.LandmarkDTO;
import com.Hotel.dto.PageDTO;

public interface LandmarkMapper {

	// 랜드마크 리스트 select
	public ArrayList<LandmarkDTO> landmarkList(@Param("cityDTO") CityDTO cityDTO, @Param("startrow")int startRow, @Param("endrow")int endRow);

	// 랜드마크 개수 select
	public int getlandmarkListCnt(CityDTO cityDTO);

	// 랜드마크 검색
	public ArrayList<LandmarkDTO> searchingLandmark(@Param("ctname") String ctname, @Param("ctdivide") String ctdivide, @Param("startrow") int startRow, @Param("endrow") int endRow);

	// 관리자 랜드마크 리스트
	public ArrayList<LandmarkDTO> adminLandmarkList();

	// 랜드마크 수정 폼
	public LandmarkDTO landmarkModifyForm(String lacode);

	// 랜드마크 삭제
	public int landmarkDelete(String lacode);

	// 랜드마크 사진 이름 select
	public String getLaphotoname(String lacode);

	// 랜드마크 수정
	public int landmarkModify(LandmarkDTO landmarkDTO);

	// 랜드마크 등록
	public int landmarkInsert(LandmarkDTO landmarkDTO);

	// 랜드마크 이름 확인
	public String lanameCheck(String inputLaname);

	// MAX la코드 select
	public String getlacode();

	// city select
	public ArrayList<CityDTO> getCityList();

	// 랜드마크 검색 개수 select
	public int getSearchLandmarkListCnt(@Param("ctname") String ctname, @Param("ctdivide") String ctdivide);

	// city 테이블 ctname, ctdivide select
	public CityDTO getCityDTO(String la_ctcode);

	// 모든 랜드마크 리스트 select
	public ArrayList<LandmarkDTO> AlllandmarkList( @Param("startrow")int startRow, @Param("endrow")int endRow);

	// 모든 랜드마크 리스트 개수 select
	public int getAlllandmarkListCnt();

}
