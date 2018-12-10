package com.team.cos.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
public class Scheduler {

	//scheduler 를 통한 staus 변경
	@Scheduled(cron="0 32 18 * * *")
	public void testScheduler() {
		System.out.println("스케쥴러");
	}
}
