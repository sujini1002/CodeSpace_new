package com.team.cos.project.vo;

import java.util.List;

public class TDLVo {
//	private String startDate;
//	private String endDate;
	private List<String> startDay;
	private List<String> endDay;

//	public String getStartDate() {
//		return startDate;
//	}
//
//	public void setStartDate(String startDate) {
//		this.startDate = startDate;
//	}
//
//	public String getEndDate() {
//		return endDate;
//	}
//
//	public void setEndDate(String endDate) {
//		this.endDate = endDate;
//	}

	public List<String> getStartDay() {
		return startDay;
	}

	public void setStartDay(List<String> startDay) {
		this.startDay = startDay;
	}

	public List<String> getEndDay() {
		return endDay;
	}

	public void setEndDay(List<String> endDay) {
		this.endDay = endDay;
	}
//
//	@Override
//	public String toString() {
//		return "TDLVo [startDate=" + startDate + ", endDate=" + endDate + ", startDay=" + startDay + ", endDay="
//				+ endDay + "]";
//	}

	@Override
	public String toString() {
		return "TDLVo [startDay=" + startDay + ", endDay=" + endDay + "]";
	}

}
