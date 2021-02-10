package com.Hotel.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.Hotel.dto.HotelDTO;
import com.Hotel.dto.RoomDTO;
import com.Hotel.mapper.BookingMapper;
import com.Hotel.mapper.CompanyMapper;
import com.Hotel.mapper.RoomMapper;

@Service
public class RoomService {

	@Autowired
	private RoomMapper roomMapper;

	@Autowired
	private BookingMapper bookingMapper;

	@Autowired
	private CompanyMapper companyMapper;
	
	@Autowired
	private HttpSession session;

	private ModelAndView mav;

	// 룸등록 insert부분
	public ModelAndView RoomWrite(RoomDTO roomDTO) throws IllegalStateException, IOException {
		mav = new ModelAndView();

		// rocode 만들기
		String getRocode = roomMapper.getrocode(); // 가장 큰 rocode 가져오기
		String rocode;
		int rocodeNum = 0;
		if (getRocode == null) getRocode = "RO000";
		rocodeNum = Integer.parseInt(getRocode.substring(2, 5)) + 1; // rocode에서 숫자부분만 따로 뽑아서 1을 더해준다.
		if (rocodeNum < 10) {
			rocode = "RO" + "00" + rocodeNum; // 더한 rocodeNum이 한자리 숫자면
		} else if (rocodeNum < 100) { // 더한 rocodeNum이 두자리 숫자면
			rocode = "RO" + "0" + rocodeNum;
		} else { // 더한 rocodeNum이 세자리 숫자면
			rocode = "RO" + rocodeNum;
		}
		roomDTO.setRocode(rocode);

		// 파일이름을 랜덤으로 생성하는부분
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());

		MultipartFile rophoto = roomDTO.getRophoto();
		String rofilename = uuid.toString() + "_" + rophoto.getOriginalFilename();
		System.out.println("rofilename::" + rofilename);

		roomDTO.setRofilename(rofilename);

		// 경로값
		String savePath = "C:\\Users\\1\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\Hotel\\src\\main\\webapp\\resources\\img\\roomFile\\";

		// rophoto가 비어있지 않으면 새로운파일 적용가능한 조건문
		if (!rophoto.isEmpty()) {
			rophoto.transferTo(new File(savePath + rofilename));
		}

		// 룸등록 insert부분
		int insertResult = roomMapper.RoomWrite(roomDTO);
		System.out.println(roomDTO);
		if (insertResult > 0) {
			System.out.println("룸등록성공!");
		} else {
			System.out.println("룸등록실패!");
		}
		mav.setViewName("redirect:/RoomList");
		return mav;
	}

	// 룸리스트 ArrayList로 불러오는 부분
	public ModelAndView RoomList(RoomDTO roomDTO) {
		mav = new ModelAndView();
		String ALoginId = (String) session.getAttribute("ALoginId");

		// 방 리스트 select
		ArrayList<RoomDTO> RoomList = roomMapper.RoomList(ALoginId);
		System.out.println("RoomList:::" + RoomList);
		
		// 로그인된 아이디 비밀번호 select
		String loginPw = companyMapper.getloginPw(ALoginId);
		
		mav.addObject("loginPw", loginPw);
		mav.addObject("RoomList", RoomList);
		mav.setViewName("room/RoomListForm");
		return mav;
	}

	// 룸리스트 rocode로 삭제
	@Transactional(rollbackFor = Exception.class)
	public ModelAndView RoomListDel(String rocode) {
		mav = new ModelAndView();
		
		// 부킹 룸코드삭제
		int BookingDel = bookingMapper.BookingDel(rocode);
		
		// 룸 사진 삭제
		String deleteProfile = roomMapper.getRoomname(rocode);
		String savePath = "C:\\Users\\1\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\Hotel\\src\\main\\webapp\\resources\\img\\roomFile\\";
		File file = new File(savePath + deleteProfile);
		file.delete();
		
		// 룸코드 삭제
		int RoomListDel = roomMapper.RoomListDel(rocode);
		System.out.println("RoomListDel::" + RoomListDel);
		System.out.println("BookingDel::" + BookingDel);
		mav.setViewName("redirect:/RoomList");
		return mav;
	}

	// 룸디테일 select부분
	public ModelAndView RoomDetail(String rocode) {
		mav = new ModelAndView();
		
		// 방 정보 select
		RoomDTO roomDTO = roomMapper.RoomDetail(rocode);
		
		// 호텔 이름 select
		HotelDTO hotelDTO = roomMapper.getHotelName(rocode);

		mav.addObject("roomDTO", roomDTO);
		mav.addObject("hotelDTO", hotelDTO);
		mav.setViewName("room/RoomDetail");
		return mav;
	}

//	관리자 룸 디테일 select
	public ModelAndView SelectRoom(String rocode) {
		mav = new ModelAndView();
		
		// 방 정보 select
		RoomDTO roomDTO = roomMapper.RoomDetail(rocode);
		System.out.println(roomDTO);
		mav.addObject("roomDTO", roomDTO);
		mav.setViewName("admin/a_roomDetail");
		return mav;
	}

//	룸 수정
	public String RoomModify(RoomDTO roomDTO) throws IllegalStateException, IOException {

		// 파일이름을 랜덤으로 생성하는부분
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());

		MultipartFile rophoto = roomDTO.getRophoto();
		String rofilename = uuid.toString() + "_" + rophoto.getOriginalFilename();
		System.out.println("rofilename::" + rofilename);

		roomDTO.setRofilename(rofilename);

		// 경로값
		String savePath = "C:\\Users\\1\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\Hotel\\src\\main\\webapp\\resources\\img\\roomFile\\";

		// rophoto가 비어있지 않으면 새로운파일 적용가능한 조건문
		if (!rophoto.isEmpty()) {
			rophoto.transferTo(new File(savePath + rofilename));
		}

		// 방 수정
		int result = roomMapper.RoomModify(roomDTO);
		String resultSet;
		if (result > 0) {
			resultSet = "redirect:/RoomList";
		} else {
			System.out.println("룸 수정 실패");
			resultSet = "redirect:/RoomList";
		}
		return resultSet;
	}

	// 룸 작성 폼 넘어가는 부분
	public ModelAndView roomWriteForm() {
		mav = new ModelAndView();
		String loginId = (String) session.getAttribute("ALoginId");
		
		// 모든 호텔 이름 select
		ArrayList<HotelDTO> hotelList = roomMapper.getAllHotelName(loginId);
		mav.addObject("hotelList", hotelList);
		mav.setViewName("room/RoomWriteForm");
		return mav;
	}

}
