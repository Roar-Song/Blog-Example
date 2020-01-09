package com.gd.test.batch.controller;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class BatchComponent {

	@Scheduled(cron = "0/5 15 10 * * *")
	public void cronTest1() {
		System.out.println("batch!!");
	}

}
