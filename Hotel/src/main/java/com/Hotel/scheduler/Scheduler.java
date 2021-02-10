package com.Hotel.scheduler;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.Hotel.mapper.HotelMapper;

@Component
public class Scheduler {

	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private HotelMapper hotelMapper;
	
	@Scheduled(cron="0 1 0 1 * *")
	public void updateHitZero() {
		System.out.println("updateHitZero");
		int updateResult = hotelMapper.updateHitZero();
		System.out.println(updateResult);
	}
}
