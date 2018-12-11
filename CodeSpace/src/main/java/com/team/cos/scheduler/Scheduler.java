package com.team.cos.scheduler;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.team.cos.project.dao.ProjectInfoInterface;

@Service
public class Scheduler {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private ProjectInfoInterface dao;
	

	//scheduler 를 통한 project staus 변경
	@Scheduled(cron="0 59 11 * * *")
	public void projectStatusScheduler() {
		dao = sqlSessionTemplate.getMapper(ProjectInfoInterface.class);
		
		try {
			int statusUpdateCount = dao.updateAllProStatus();
			System.out.println("everyday 11:59 project status update: "+statusUpdateCount);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
