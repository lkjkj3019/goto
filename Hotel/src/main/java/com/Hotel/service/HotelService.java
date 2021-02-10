package com.Hotel.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.Hotel.dto.BookingDTO;
import com.Hotel.dto.CityDTO;
import com.Hotel.dto.H_InfoDTO;
import com.Hotel.dto.HeartDTO;
import com.Hotel.dto.HistoryDTO;
import com.Hotel.dto.HotelDTO;
import com.Hotel.dto.PageDTO;
import com.Hotel.dto.ReviewDTO;
import com.Hotel.dto.RoomDTO;
import com.Hotel.mapper.CityMapper;
import com.Hotel.mapper.HotelMapper;
import com.Hotel.mapper.ReviewMapper;

@Service
public class HotelService {

	ModelAndView mav;

	@Autowired
	private HotelMapper hotelMapper;

	@Autowired
	private CityMapper cityMapper;

	@Autowired
	private ReviewMapper reviewMapper;

	@Autowired
	private HttpSession session;

	// (고객페이지) 호텔리스트
	public ModelAndView c_HotelList(BookingDTO bookingDTO, String ctname, int page) {
		mav = new ModelAndView();
		// 페이징 처리
		int pageLimit = 5;
		int pageNumLimit = 3;
		int startRow = (page - 1) * pageLimit + 1;
		int endRow = page * pageLimit;
		PageDTO pageDTO = new PageDTO();
		pageDTO.setStartrow(startRow);
		pageDTO.setEndrow(endRow);

		// 호텔 리스트 가져오기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ctname", ctname);
		map.put("bookingDTO", bookingDTO);
		map.put("pageDTO", pageDTO);
		List<Map<String, Object>> hotelList = hotelMapper.c_HotelList(map);

		// 페이징 처리
		int hotelListCnt = hotelMapper.getHotelListCnt(map);
		int maxPage = (int) (Math.ceil((double) hotelListCnt / pageLimit));
		System.out.println(maxPage);
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

		// 찜 리스트 가져오기
		String loginId = (String) session.getAttribute("MLoginId");
		ArrayList<HeartDTO> heartList = hotelMapper.getHeartList(loginId);

		mav.addObject("heartList", heartList);
		mav.addObject("ctname", ctname);
		mav.addObject("searchData", bookingDTO);
		mav.addObject("hotelList", hotelList);
		mav.addObject("pageDTO", pageDTO);
		mav.setViewName("hotel/c_HotelList");
		return mav;
	}

	// (고객페이지) 룸리스트
	public ModelAndView c_RoomList(String hocode) {
		mav = new ModelAndView();

		// 호텔 정보 가져오기
		H_InfoDTO h_info = hotelMapper.getHotelInfo(hocode);
		HotelDTO hotelDTO = hotelMapper.gethotel(hocode);

		// 룸 리스트 가져오기
		ArrayList<RoomDTO> roomList = hotelMapper.c_RoomList(hocode);

		// 후기 리스트 & 개수 가져오기
		ArrayList<ReviewDTO> reviewList = reviewMapper.getReviewList(hocode);
		int reviewCnt = reviewMapper.getReviewCnt(hocode);

		// 좋아요
		String loginId = (String) session.getAttribute("MLoginId");
		ArrayList<HistoryDTO> likeList = reviewMapper.getlikeList(loginId);
		mav.addObject("h_info", h_info);
		mav.addObject("hotelDTO", hotelDTO);
		mav.addObject("roomList", roomList);
		mav.addObject("reviewList", reviewList);
		mav.addObject("reviewCnt", reviewCnt);
		mav.addObject("likeList", likeList);
		mav.setViewName("room/c_RoomList");
		return mav;
	}

	// 관리자 호텔리스트
	public ModelAndView a_hotelList() {
		mav = new ModelAndView();
		String loginId = (String) session.getAttribute("ALoginId");

		// 업체 hotelList 불러오기
		ArrayList<HotelDTO> hotelList = hotelMapper.a_hotelList(loginId);
		String pw = hotelMapper.getPw(loginId);
		System.out.println(hotelList);

		mav.addObject("hotelList", hotelList);
		mav.addObject("password", pw);
		mav.setViewName("hotel/a_HotelList");
		return mav;
	}

	// 호텔 삭제
	@Transactional(rollbackFor = { Exception.class })
	public String deleteHotel(String hocode) {
		
		// history 삭제
		hotelMapper.deleteHistory(hocode);
		// 리뷰 삭제
		hotelMapper.deleteReview(hocode);
		// 찜 삭제
		hotelMapper.deleteHeartHotel(hocode);
		// 호텔정보 삭제
		hotelMapper.deleteH_Info(hocode);
		// 예약 삭제
		hotelMapper.deleteBooking(hocode);
		
		// 룸 사진 삭제
		String[] deleteProfile = hotelMapper.getRoomFilename(hocode);
		String savePath = "C:\\Users\\1\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\Hotel\\src\\main\\webapp\\resources\\img\\roomFile";
		for(int i = 0; i < deleteProfile.length; i++) {
			File file = new File(savePath + deleteProfile[i]);
			file.delete();
		}
		
		// 호텔 사진 삭제
		String deleteHotelProfile = hotelMapper.getHotelFilename(hocode);
		String hotelSavePath = "C:\\Users\\1\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\Hotel\\src\\main\\webapp\\resources\\img\\hotelFile\\";
		File hotelFile = new File(hotelSavePath + deleteHotelProfile);
		hotelFile.delete();

		// 룸, 호텔 삭제
		hotelMapper.deleteRoom(hocode);
		int deleteResult = hotelMapper.deleteHotel(hocode);
		String result = "NO";
		if (deleteResult > 0) {
			result = "OK";
		}
		return result;
	}

	// 찜 등록
	public String insertHeart(HeartDTO heartDTO) {

		// htcode 만들기
		String htcode = null;
		String getHtcode = hotelMapper.getHtcode(); // 가장 큰 htcode 가져오기
		if(getHtcode == null) getHtcode = "HT000";
		int htcodeNum = Integer.parseInt(getHtcode.substring(2, 5)) + 1; // htcode에서 숫자부분만 따로 뽑아서 1을 더해준다.
		if (htcodeNum < 10) {
			htcode = "HT00" + htcodeNum; // 더한 htcodeNum이 한자리 숫자면
		} else if (htcodeNum < 100) { // 더한 htcodeNum이 두자리 숫자면
			htcode = "HT0" + htcodeNum;
		} else { // 더한 htcodeNum이 세자리 숫자면
			htcode = "HT" + htcodeNum;
		}
		heartDTO.setHtcode(htcode);

		// 찜 등록
		int insertResult = hotelMapper.insertHeart(heartDTO);
		String result = "NO";
		if (insertResult > 0) {
			result = "OK";
		}
		return result;
	}

	// 찜 삭제
	public String deleteHeart(HeartDTO heartDTO) {

		// 찜 삭제
		int deleteResult = hotelMapper.deleteHeart(heartDTO);
		String result = "NO";
		if (deleteResult > 0) {
			result = "OK";
		}
		return result;
	}

	// 호텔 검색
	public ModelAndView searchHotel(int page, String search) {
		mav = new ModelAndView();
		PageDTO pageDTO = new PageDTO();
		Map<String, Object> map = new HashMap<String, Object>();

//		페이징처리
		int pageLimit = 5;
		int pageNumLimit = 3;
		int startRow = (page - 1) * pageLimit + 1;
		int endRow = page * pageLimit;

		pageDTO.setStartrow(startRow);
		pageDTO.setEndrow(endRow);

		map.put("search", search);
		map.put("startrow", pageDTO.getStartrow());
		map.put("endrow", pageDTO.getEndrow());

//		호텔 리스트
		List<Map<String, Object>> searchHotelList = hotelMapper.searchHotel(map);

		int hotelCount = hotelMapper.getHotelCount(search);

		// 페이징 처리
		int maxPage = (int) (Math.ceil((double) hotelCount / pageLimit));
		int startPage = ((int) (Math.ceil((double) page / pageNumLimit)) - 1) * pageNumLimit + 1;
		int endPage = startPage + pageNumLimit - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}
		pageDTO.setPage(page);
		pageDTO.setStartpage(startPage);
		pageDTO.setEndpage(endPage);
		pageDTO.setMaxpage(maxPage);

		mav.addObject("search", search);
		mav.addObject("pageDTO", pageDTO);
		mav.addObject("hotelList", searchHotelList);
		mav.setViewName("hotel/c_HotelList");

		return mav;
	}

	// 호텔등록
	public ModelAndView hotelInfoForm(CityDTO cityDTO, HotelDTO hotelDTO, H_InfoDTO h_infoDTO)
			throws IllegalStateException, IOException {
		mav = new ModelAndView();

		System.out.println("service :: hotelInfoForm");

		// 호텔 전체 주소
		hotelDTO.setHoaddr("(" + hotelDTO.getHopost() + ")" + hotelDTO.getHoaddress() + hotelDTO.getHoexaddr()
				+ hotelDTO.getHodetail());

		// city코드
		String ctcode = cityMapper.getCtcode(cityDTO);
		cityDTO.setCtcode(ctcode);

		// hotel코드
		String hocode;
		String hoMaxNum = hotelMapper.hoMaxNum();
		int hoNum = Integer.parseInt(hoMaxNum.substring(2, 5)) + 1;
		if (hoNum < 10) {
			hocode = "HO" + "00" + hoNum;
		} else if (hoNum < 100) {
			hocode = "HO" + "0" + hoNum;
		} else {
			hocode = "HO" + hoNum;
		}
		hotelDTO.setHocode(hocode);
		String loginId = (String) session.getAttribute("ALoginId");
		hotelDTO.setHo_cid(loginId);

		// h_info코드
		String incode;
		String inMaxNum = hotelMapper.inMaxNum();
		int inNum = Integer.parseInt(inMaxNum.substring(2, 5)) + 1;
		if (inNum < 10) {
			incode = "IN" + "00" + inNum;
		} else if (inNum < 100) {
			incode = "IN" + "0" + inNum;
		} else {
			incode = "IN" + inNum;
		}
		h_infoDTO.setIncode(incode);

		// 파일등록
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());

		MultipartFile hophoto = hotelDTO.getHophoto();
		String hofilename = uuid.toString() + "_" + hophoto.getOriginalFilename();
		System.out.println("hofilename :: " + hofilename);

		String savePath = "C:\\Users\\1\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\Hotel\\src\\main\\webapp\\resources\\img\\hotelFile\\";
		if (!hophoto.isEmpty()) {
			hophoto.transferTo(new File(savePath + hofilename));
		}
		hotelDTO.setHofileName(hofilename);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cityDTO", cityDTO);
		map.put("hotelDTO", hotelDTO);
		map.put("h_infoDTO", h_infoDTO);

		// 호텔정보 insert
		int hotelInfo = hotelMapper.hotelInfoForm(map);
		System.out.println("hotelInfoForm :: " + hotelInfo);
		mav.setViewName("company/companyMain");
		return mav;
	}

	// 호텔 상세보기
	public ModelAndView hotelView(String hocode) {
		mav = new ModelAndView();

		// 호텔 정보 select
		HotelDTO hotelDTO = hotelMapper.gethotel(hocode);
		H_InfoDTO h_infoDTO = hotelMapper.getHotelInfo(hocode);
		System.out.println(hotelDTO);
		System.out.println(h_infoDTO);

		mav.addObject("hotelDTO", hotelDTO);
		mav.addObject("h_infoDTO", h_infoDTO);
		mav.setViewName("company/a_hotelView");
		return mav;
	}

	// 호텔 정보 수정
	public String updateIndetail(H_InfoDTO h_infoDTO) {
		// 호텔 정보 수정
		int update = hotelMapper.updateIndetail(h_infoDTO);

		String updateResult = null;
		if (update > 0) {
			updateResult = "OK";
		} else {
			updateResult = "NO";
		}
		return updateResult;
	}

	// 도시 지역 select
	public ArrayList<String> getCtborough(CityDTO cityDTO) {
		// 도시 지역 select
		ArrayList<String> cityList = hotelMapper.getCtborough(cityDTO);

		return cityList;
	}

	// 호텔 조회수
	public String updateHit(String hocode) {
		// 호텔 조회수
		int updateResult = hotelMapper.updateHit(hocode);
		String result = "NO";
		if (updateResult > 0)
			result = "OK";
		return result;
	}

}
