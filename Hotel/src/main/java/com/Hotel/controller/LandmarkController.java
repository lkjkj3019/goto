package com.Hotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Hotel.service.LandmarkService;

@Controller
public class LandmarkController {
	
	private ModelAndView mav;
	
	@Autowired
	private LandmarkService landmarkService;
	
	//랜드마크 리스트
	@RequestMapping(value="/landmarkList")
	public ModelAndView landmarkList(String la_ctcode, @RequestParam(value="page", defaultValue="1") int page) {
		// landmarkList
		
		mav = landmarkService.landmarkList(la_ctcode,page);
		
		return mav;
	}
	
	//랜드마크 검색
	@RequestMapping(value="/searchingLandmark")
	public ModelAndView searchingLandmark(String ctname, String ctdivide, @RequestParam(value="page", defaultValue="1") int page) {
		// searchingLandmark
		System.out.println("searchingLandmark");
		mav = landmarkService.searchingLandmark(ctname, ctdivide, page);
		
		return mav;
	}

}
