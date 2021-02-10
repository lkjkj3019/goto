package com.Hotel.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Hotel.dto.BookingDTO;
import com.Hotel.dto.RoomDTO;
import com.Hotel.service.RoomService;


@Controller
public class RoomController {

	@Autowired
	private RoomService roomService;
	
	@Autowired
	private HttpSession session;
	
	private ModelAndView mav;
	
	
	//룸등록 폼
	@RequestMapping(value = "/RoomWriteForm")
	public ModelAndView RoomWriteForm() {
		System.out.println("룸등록 폼!!");
		mav = roomService.roomWriteForm();
		return mav;
		
	}
	
	
	//룸등록 부분
	@RequestMapping(value = "/RoomWrite")
	public ModelAndView RoomWrite(RoomDTO roomDTO) throws IllegalStateException, IOException {
		System.out.println("/RoomWrite");
		System.out.println("룸등록부분..");
		mav = roomService.RoomWrite(roomDTO);
		System.out.println(roomDTO);
		return mav;
	}
	
	//룸리스트 부분
	@RequestMapping(value = "/RoomList")
	public ModelAndView RoomList(RoomDTO roomDTO) {
		System.out.println("/RoomList");
		System.out.println("룸리스트 부분");
		mav = roomService.RoomList(roomDTO);
		System.out.println(roomDTO);
		
		return mav;
		
	}
	//룸리스트 삭제
	@RequestMapping(value = "/RoomListDel")
	public ModelAndView RoomListDel(String rocode) {

		System.out.println("/RoomListDel");
		System.out.println("룸리스트 삭제");
		mav = roomService.RoomListDel(rocode);
		System.out.println(rocode);
		return mav;
	}
	
	
	//룸 디테일 부분
	@RequestMapping(value = "/RoomDetail")
	public ModelAndView RoomDetail(@RequestParam("rocode") String rocode) {
		System.out.println("/RoomDetail");
		System.out.println("룸디테일부분,");
		System.out.println("rocode::"+rocode);
		mav = roomService.RoomDetail(rocode);
		
		return mav;
		
	}
	
//	룸디테일 관리자
	@RequestMapping(value="/a_roomDetail")
	public ModelAndView selectRoom(String rocode) {
		System.out.println("/a_roomDetail");
		System.out.println("룸디테일 관리자 페이지 이동");
		mav = roomService.SelectRoom(rocode);
		return mav;
	}

//	룸 수정
	@RequestMapping(value="/RoomModify")
	public String RoomModify(RoomDTO roomDTO) throws IllegalStateException, IOException {
		System.out.println(roomDTO);
		System.out.println("/RoomModify");
		System.out.println("룸 수정하는 중");
		String result = roomService.RoomModify(roomDTO);
		return result;
	}
	
	
}
