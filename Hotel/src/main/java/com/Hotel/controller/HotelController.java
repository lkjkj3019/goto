package com.Hotel.controller;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Hotel.dto.BookingDTO;
import com.Hotel.dto.CityDTO;
import com.Hotel.dto.H_InfoDTO;
import com.Hotel.dto.HeartDTO;
import com.Hotel.dto.HotelDTO;
import com.Hotel.service.HotelService;

@Controller
public class HotelController {

	ModelAndView mav;
	
	@Autowired
	private HotelService hotelService;
	
	// (고객페이지) 호텔리스트
	@RequestMapping(value="c_HotelList")
	public ModelAndView c_HotelList(BookingDTO bookingDTO, String ctname ,@RequestParam(value="page", defaultValue = "1") int page) {
		System.out.println("c_HotelList");
		mav = hotelService.c_HotelList(bookingDTO, ctname ,page);
		return mav;
	}

	// (고객페이지) 룸리스트  
	@RequestMapping(value = "c_RoomList")
	public ModelAndView c_RoomList(String hocode) {
		System.out.println("c_RoomList");
		mav = hotelService.c_RoomList(hocode);
		return mav;
	}
	

	// 호텔리스트(관리자)
	@RequestMapping(value = "a_hotelList")
	public ModelAndView a_hotelList() {
		System.out.println("a_hotelList");
		mav = hotelService.a_hotelList();
		return mav;
	}

	// 호텔 삭제
	@RequestMapping(value = "deleteHotel")
	public @ResponseBody String deleteHotel(String hocode) {
		System.out.println("deleteHotel");
		String result = hotelService.deleteHotel(hocode);
		return result;
	}
	
	// 찜 등록
	@RequestMapping(value = "insertHeart")
	public @ResponseBody String insertHeart(HeartDTO heartDTO) {
		System.out.println("insertHeart");
		String result = hotelService.insertHeart(heartDTO);
		return result;
	}
	
	// 찜 취소
	@RequestMapping(value = "deleteHeart")
	public @ResponseBody String deleteHeart(HeartDTO heartDTO) {
		System.out.println("deleteHeart");
		String result = hotelService.deleteHeart(heartDTO);
		return result;
	}

//	호텔검색
	@RequestMapping(value="/searchHotel")
	public ModelAndView searchHotel(@RequestParam(value = "page",defaultValue = "1") int page, String search) {
		System.out.println("/searchHotel");
		System.out.println("호텔 검색 결과 가져오는 중");
		mav = hotelService.searchHotel(page, search);
		return mav;
	}
	
	//호텔상세보기 페이지
	@RequestMapping(value = "/a_hotelView")
	public ModelAndView hotelView(String hocode) {
		System.out.println("/hotelView");
		
		mav = hotelService.hotelView(hocode);
		return mav;
	}
	
	
	//호텔등록 페이지
	@RequestMapping(value = "/a_hotelInfoForm")
	public String a_hotelInfoForm() {
		return "company/a_hotelInfoForm";
	}
	
	
	//호텔등록
	@RequestMapping(value = "/hotelInfoForm")
	public ModelAndView hotelInfoForm(CityDTO cityDTO, HotelDTO hotelDTO, H_InfoDTO h_infoDTO) throws IllegalStateException, IOException {
		System.out.println("/hotelInfoForm");
		System.out.println(cityDTO + "::" + hotelDTO + "::" + h_infoDTO);
		
		mav = hotelService.hotelInfoForm(cityDTO,hotelDTO,h_infoDTO);
		return mav;
	}
	
	
	//호텔수정
	@RequestMapping(value = "/updateIndetail")
	public @ResponseBody String updateIndetail(H_InfoDTO h_infoDTO) {
		System.out.println("/updateIndetail");
		System.out.println(h_infoDTO);
		
		String updateIndetail = hotelService.updateIndetail(h_infoDTO);
		return updateIndetail;
	}
	
	
	//호텔지역
	@RequestMapping(value = "/getCtborough")
	public @ResponseBody ArrayList<String> getCtborough(CityDTO cityDTO){
		System.out.println("/getCtborough");
		System.out.println(cityDTO);
		
		ArrayList<String> cityList = hotelService.getCtborough(cityDTO);
		
		return cityList;
	}
	
	//호텔조회수
	@RequestMapping(value = "updateHit")
	public @ResponseBody String updateHit(String hocode) {
		System.out.println("updateHit");
		String result = hotelService.updateHit(hocode);
		return result;
	}
	

}
