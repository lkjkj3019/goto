package com.Hotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Hotel.service.RestaurantService;

@Controller
public class RestaurantController {
	
	private ModelAndView mav;
	
	@Autowired
	private RestaurantService restaurantService;
	
	//레스토랑 리스트
	@RequestMapping(value="/restaurantList")
	public ModelAndView restrauntList(String re_ctcode, @RequestParam(value="page", defaultValue="1") int page) {
		// restaurantList
		
		System.out.println("/restrauntList");
		
		 mav = restaurantService.restaurantList(re_ctcode,page);
		
		return mav;
	}

	//레스토랑 검색
	@RequestMapping(value="/searchingRestaurant")
	public ModelAndView searchingRestaurant(String ctname, String ctdivide, @RequestParam(value="page", defaultValue="1") int page) {
		// searchingRestaurant
		
		
		mav = restaurantService.searchingRestaurant(ctname, ctdivide, page);
		
		return mav;
	}
	
}

